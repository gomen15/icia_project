package com.example.demo.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.demo.dto.MemberDto;
import com.example.demo.dto.hosCheckDto;
import com.example.demo.dto.hosDto;
import com.example.demo.dto.hosRatingDto;
import com.example.demo.dto.ProfileDto;
import com.example.demo.service.MemberService;
import com.example.demo.service.hosService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class hosController {

    @Autowired
    private hosService hSer;
    
    @Autowired
    private MemberService mSer;
    
    @GetMapping("/hos/login")
    public String h_login(Model model,hosDto hDto,HttpSession session) {
    	hosDto hList = hSer.hosDataSelect(hDto);
    	log.info("hList : {}",hList);
    	String sysFileName = hList.getSysFileName();
        String imageUrl = ServletUriComponentsBuilder
                .fromCurrentContextPath()
                .path("/upload/")  // 이미지 업로드 폴더의 경로를 설정해야 합니다.
                .path(sysFileName)
                .toUriString();

        model.addAttribute("imageUrl", imageUrl);
    	session.setAttribute("hos", hList);
    	return "hosProfile";
    }
    
    @GetMapping("/hos/join")
    public String hosjoin() {
    	return "hosJoin";
    }
    
    @PostMapping("/hos/join")
    public String h_join(hosDto hDto,RedirectAttributes rttr,MultipartFile attachments,HttpSession session) {
    	log.info("hosDto : {}",hDto);
    	log.info("multipartFile : {}",attachments);
    	
    	if(hSer.h_join(attachments,session,hDto)) {
    		rttr.addFlashAttribute("msg","회원가입 성공");
    		return "redirect:/";
    	} else {
    		rttr.addAttribute("msg","회원가입 실패");
    		return "redirect:/hos/join";
    	}
    }
    
    @PostMapping("/hos/codecheck")
    public ResponseEntity<Map<String, Object>> h_codecheck(@RequestBody Map<String, String> requestData) {
        String code = requestData.get("code"); // 클라이언트에서 전송한 데이터 가져오기
        
        int result = hSer.h_codecheck(code); // 처리 로직 실행
        
        Map<String, Object> response = new HashMap<>();
        response.put("result", result > 0); // 처리 결과를 맵에 담기
        
        return ResponseEntity.ok(response); // 응답 반환
    }
    
    @GetMapping("/profile/hos")
    public String h_profile() {
    	return "hosProfile";
    }
    @PostMapping("/profile/hos/update")
    public String h_u_profile(hosDto hDto,RedirectAttributes rttr,HttpSession session) {
    	log.info("hosDto : {}",hDto);
    	
    	if(hSer.h_u_profile(hDto)) {
        	hosDto hList = hSer.hosDataSelect(hDto);
        	session.setAttribute("hos", hList);
        	log.info("hList : {}",hList);
    		rttr.addFlashAttribute("msg","회원수정 성공");
    		return "redirect:/profile/hos";
    	} else {
    		rttr.addAttribute("msg","회원수정 실패");
    		return "redirect:/profile/hos/update";
    	}
    }
    
    @GetMapping("/profile/hos/update")
    public String h_pro_update() {
    	return "hosUpdate";
    }
    
    @GetMapping("/hospital")
    public String hospital(@RequestParam(name = "search", required = false) String Keyword,
                           HttpSession session, Model model) {
        MemberDto mDto = (MemberDto) session.getAttribute("mb");
        log.info("mb: {}", mDto);

        List<hosDto> hList;

        if (Keyword != null && !Keyword.isEmpty()) {
            hList = hSer.hosSearch(Keyword);
        } else {
            hList = hSer.findHospitalList(mDto, model);
        }
        
        log.info("hos: {}", hList);
        log.info("Keyword :", Keyword);
        model.addAttribute("hosL", hList);
        model.addAttribute("searchKeyword", Keyword);

        return "hospital";
    }
    
    @GetMapping("/hospital/detail")
    public String hospitalDetail(@RequestParam("code") String code, Model model) {
    	hosDto hDto = hSer.hosSelect(code);
    	model.addAttribute("hosL", hDto);
    	return "hosDetail";
    }
    
    @GetMapping("/hospital/myhos")
    public String myhospital(HttpSession session, Model model) {
    	hosDto hDto = (hosDto) session.getAttribute("hos");
    	String code = hDto.getCode();
    	List<hosCheckDto> rsList = hSer.reservesListForHos(code);
    	model.addAttribute("rsList", rsList);
    	return "myhospital";
    }
    
    @GetMapping("/reserves_List")
    public String reserves_List(HttpSession session, Model model, RedirectAttributes rttr) {
    	MemberDto mDto = (MemberDto) session.getAttribute("mb");
    	log.info("reserves_List");
    	if(mDto == null) {
    		rttr.addFlashAttribute("showAlert", true);
    		return "redirect:/hospital";
    	}else {
    		String id = mDto.getId();
    		List<hosCheckDto> rsList = hSer.reservesList(id);
    		model.addAttribute("rsList", rsList);
    	}
    	return "hosReservesList";
    }
    
    @PostMapping("/reserves_hospital/cancel")
    public String cancelReservation(hosCheckDto hcDto, Model model, RedirectAttributes rttr) {
        log.info("hcDto : {}",hcDto);
        String checkdateString = hcDto.getCheckdate();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime parsedDateTime = LocalDateTime.parse(checkdateString, formatter);

        // LocalDateTime을 java.sql.Timestamp로 변환
        Timestamp timestamp = Timestamp.valueOf(parsedDateTime);

        hcDto.setCheckDateTime(timestamp);
        log.info("New hcDto : {}",hcDto);
    	boolean result = hSer.deleteReserves(hcDto);
        if(result) {
        	rttr.addFlashAttribute("msg", "예약취소 성공");
        	return "redirect:/reserves_List";	
        }else {
        	rttr.addFlashAttribute("msg", "예약취소 실패");
        	return "redirect:/reserves_List";
        }
         
    }
    
    @PostMapping("/reserves_hospital/cancelhos")
    public String cancelReservationhos(hosCheckDto hcDto, Model model, RedirectAttributes rttr) {
        log.info("hcDto : {}",hcDto);
        String checkdateString = hcDto.getCheckdate();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime parsedDateTime = LocalDateTime.parse(checkdateString, formatter);

        // LocalDateTime을 java.sql.Timestamp로 변환
        Timestamp timestamp = Timestamp.valueOf(parsedDateTime);

        hcDto.setCheckDateTime(timestamp);
        log.info("New hcDto : {}",hcDto);
    	boolean result = hSer.deleteReserves(hcDto);
        if(result) {
        	rttr.addFlashAttribute("msg", "예약취소 성공");
        	return "redirect:/hospital/myhos";	
        }else {
        	rttr.addFlashAttribute("msg", "예약취소 실패");
        	return "redirect:/hospital/myhos";
        }
         
    }

    
    @GetMapping("/reserves_hospital")
    public String reserves_hospital(@RequestParam("code") String code,
    		HttpSession session, Model model, RedirectAttributes rttr) {
    	MemberDto mDto = (MemberDto) session.getAttribute("mb");
    	if(mDto == null) {
    		rttr.addFlashAttribute("showAlert", true);
    		return "redirect:/hospital";
    	}
    	hosDto hDto = hSer.hosSelect(code);
    	ProfileDto profile = mSer.profileSelect(mDto.getId());
    	List<hosCheckDto> hcDto = hSer.reservesListForHos(hDto.getCode());
    	log.info("hDto : {}",hDto);
    	model.addAttribute("pro",profile);
    	model.addAttribute("hosL", hDto);
    	model.addAttribute("hoslist", hcDto);
    	return "hosReserve";
    }

//    @GetMapping("/hospital/search")
//    public String hospitalsearch(@RequestParam("hostitle") String hostitle
//    		, HttpSession session, Model model) {
//    	List<hosDto> hList = hSer.hosSearch(hostitle);
//    	model.addAttribute("hList", hList);
//    	return "hossearch";
//    }
    
    @GetMapping("/hosRating")
    public String hospitalRating(String code,
    		hosRatingDto hRDto, HttpSession session, Model model) {
    	List<hosRatingDto> rList = hSer.ratingList(code);
    	log.info("rLsit: {}", rList);
    	model.addAttribute("rList", rList);
    	model.addAttribute("code", code);
    	return "hosRating";
    }
    
    @GetMapping("/hosRating/write")
    public String hosRatingWrite(String code,
    		hosRatingDto hRDto, HttpSession session, Model model, RedirectAttributes rttr) {
    	log.info(code);
    	MemberDto mDto = (MemberDto) session.getAttribute("mb");
    	if(mDto == null) {
    		rttr.addFlashAttribute("showAlert", true);
    		return "redirect:/hosRating?code="+code;
    	} else {
	    	model.addAttribute("code", code);
	    	model.addAttribute("id", mDto.getId());
	    	log.info("ratingWrite");
	    	return "hosRatingWrite";
    	}
    }
    
    @PostMapping("/hosRating/write")
    public String hosRatingWrited(hosRatingDto hRDto, Model model) {
    	log.info("Write Connected");
    	boolean result = hSer.ratingWrite(hRDto);
    	
    	return "redirect:/hosRating?code="+hRDto.getCode();
    }
    
    @PostMapping("/reserves_hospital/check")
    public String reserve_hos(hosCheckDto hDto,HttpSession session, Model model) {
        log.info("hDto : {}", hDto);

        try {
            String checkdateString = hDto.getCheckdate();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime parsedDateTime = LocalDateTime.parse(checkdateString, formatter);

            // LocalDateTime을 java.sql.Timestamp로 변환
            Timestamp timestamp = Timestamp.valueOf(parsedDateTime);

            hDto.setCheckDateTime(timestamp);

            // 이제 timestamp를 활용하여 작업을 수행하는 로직을 추가

            boolean result = hSer.reserve_hos_check(hDto);

            if (result) {
                model.addAttribute("msg", "예약성공");
            } else {
                model.addAttribute("msg", "예약실패");
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "예약실패");
        }

        return "redirect:/";
    }
}
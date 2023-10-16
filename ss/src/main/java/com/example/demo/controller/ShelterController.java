package com.example.demo.controller;

import com.example.demo.dto.ShelterDto;
import com.example.demo.dto.ShelterReplyDto;
import com.example.demo.service.ShelterService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
@Slf4j
@Controller
@RequestMapping("/shelter")
public class ShelterController<ShelterFile> {

    @Autowired
    ShelterService sSer;
    
    int listcnt=10;
    
    
    
    @GetMapping("/write")
    public String shelterWrite() {
    	log.info("셀터라이트");
        return "shelterwrite";// JSP 파일명
    }
    
    @GetMapping("/list")
    public String shelterList(Model model,HttpSession session) {
    		List<ShelterDto> sList= sSer.findShelterList();
    		model.addAttribute("sList",sList);
    		log.info("shelter list");
    		return "shelterList";
    }

    @PostMapping("/replyInsert")
    public boolean replyInsert(ShelterReplyDto srDto) {
		log.info("srDto :{}", srDto);
		boolean result = sSer.replyInsert(srDto);
		log.info("result :{}", result);
		
		if(result) {
			log.info("reply success");
			return true;
		}else {
			log.info("reply failed");
			return false;
		}
    }
    
    
    @PostMapping("/write")
    public String writeShelter(
	ShelterDto sDto, HttpSession session, 
	RedirectAttributes rttr,MultipartFile attachments) {
    	log.info("글쓰기 처리");
		log.info("shelter={}", sDto);
		boolean result = sSer.shelterWrite(sDto,attachments,session);
		if (result) {
			rttr.addFlashAttribute("msg", "글쓰기 성공");
			return "redirect:/shelter/list";   //0--->10
		}else { //forward는 get--->get, post--->post만 가능
			rttr.addFlashAttribute("msg", "글쓰기 실패");
			return "redirect:/shelter/write";
		}
	}
    
	@GetMapping("/detail")
	public String shelterDetail(Integer snum, Model model) {
	ShelterDto sDto = sSer.shelterDetail(snum);
	List<ShelterReplyDto> rList= sSer.getReplyList(snum);
	
	String sysFileName = sDto.getSysFileName();
    String imageUrl = ServletUriComponentsBuilder
            .fromCurrentContextPath()
            .path("/upload/")  // 이미지 업로드 폴더의 경로를 설정해야 합니다.
            .path(sysFileName)
            .toUriString();
	
    model.addAttribute("imageUrl",imageUrl);
	model.addAttribute("sDto",sDto);
	model.addAttribute("rList", rList);
	return "shelterDetail";
}
	
	@GetMapping("/delete")
	public String shelterDelete(Integer snum) {
		sSer.shelterDelete(snum);
		
		return "redirect:/shelter/list";
	}
	
	@GetMapping("/update")
	public String shelterUpdate(@RequestParam Integer snum, Model model) {
		log.info("글 수정창 열기");
		ShelterDto sDto  = sSer.shelterDetail(snum);
		
		if(sDto != null) {
			model.addAttribute("sDto", sDto);
			return "shelterUpdate";
		} else {
			return "redirect:/shelter/list";
		}

	}
	
	@PostMapping("/update")
	public String shelterUpdateSet(MultipartFile attachments,ShelterDto sDto, RedirectAttributes rttr,HttpSession session) {
		log.info("글 수정 처리");
		log.info("update sDto ={}", sDto);
		log.info("attachments:{}",attachments);
		
		boolean result = sSer.shelterUpdate(sDto,attachments,session);
		if(result) {
			rttr.addFlashAttribute("msg","게시글 수정 성공");
			return "redirect:/shelter/list"; // 0 ---> 10
		} else {
			rttr.addFlashAttribute("msg","게시글 수정 실패");
			return "redirect:/shelter/list";
		}
	}
}
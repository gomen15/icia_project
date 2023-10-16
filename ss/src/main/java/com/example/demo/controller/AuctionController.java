package com.example.demo.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.demo.dto.AuctionBuyDto;
import com.example.demo.dto.AuctionDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.hosDto;
import com.example.demo.service.AuctionService;
import com.example.demo.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/auction")
public class AuctionController {

	@Autowired
	AuctionService acSer;
	
	@Autowired
	MemberService mSer;
	
	private int listCnt=10;
	

	@GetMapping("/list")
	public String findAuctionList(@RequestParam(name = "search", required = false) String keyword, AuctionDto acDto, Model model, HttpSession session) {
	    MemberDto mDto = (MemberDto) session.getAttribute("mb");
	    log.info("mb: {}", mDto);

	    List<AuctionDto> acList;

	    if (keyword != null && !keyword.isEmpty()) {
	        // 검색어가 제공된 경우, 검색 메서드를 호출합니다.
	        acList = acSer.searchAuctionList(keyword);
	    } else {
	        // 검색어가 없는 경우 전체 목록을 가져옵니다.
	        acList = acSer.findAuctionList(acDto);
	    }

	    log.info("AcList : {}", acList);

	    String imageUrl = ServletUriComponentsBuilder
	            .fromCurrentContextPath()
	            .path("/upload")
	            .toUriString();

	    for (AuctionDto auction : acList) {
	        if (auction.getSysFileName() != null) {
	            auction.setSysFileName(imageUrl + "/" + auction.getSysFileName());  // SysFileName 업데이트
	        }
	        log.info(auction.getSysFileName());
	    }

	    model.addAttribute("AcList", acList);
	    model.addAttribute("searchKeyword", keyword); // 검색어를 뷰로 전달

	    log.info("auction list");
	    return "auctionList";
	}
	
	@GetMapping("/write")
	public String auctionWrite() {
		return "auctionWrite";
	}
	
	
	@PostMapping("/write")
	public String auctionWrite(AuctionDto acDto,MultipartFile attachments,HttpSession session,RedirectAttributes rttr) {
	    String checkdateString = acDto.getEndtime2();

	    if (checkdateString != null && !checkdateString.isEmpty()) {
	        try {
	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	            LocalDateTime parsedDateTime = LocalDateTime.parse(checkdateString, formatter);

	            // LocalDateTime을 java.sql.Timestamp로 변환
	            Timestamp timestamp = Timestamp.valueOf(parsedDateTime);

	            acDto.setEndTimeSet(timestamp);
	        } catch (DateTimeParseException ex) {
	            // 파싱 예외 발생 시 처리
	            log.error("Error parsing endtime2: {}", ex.getMessage());
	        }
	    }
        
	    log.info("aDto : {}",acDto);

		
	 		if(acSer.auctionWrite(acDto,attachments,session)) {
	 			rttr.addFlashAttribute("msg","성공");
	 			return "redirect:/";
	 		} else {
	 			rttr.addFlashAttribute("msg","실패");
	 			return "endtime2";
	 		}
	}
		
	@GetMapping("/bid")
	public String bidAuctionFrm(Integer acnum, Model model) {
	    log.info("acnum : {}",acnum);
	    if(acnum==null) {
	    	return "redirect:/auction/list";
	}
	    AuctionDto acDto=acSer.getAuctionDetail(acnum);
	    List<AuctionBuyDto> abList=acSer.getAuctionBuy(acnum);
	    if(acDto!=null) {
	    	model.addAttribute("acDto",acDto).addAttribute("abList",abList);
	    	return "auctionBid";
	    }else {
	    	return "redirect:/auction/list";
	    }
	}
	
	@PostMapping("/bid")
	public String placeBid(@ModelAttribute("abDto") AuctionBuyDto abDto,Model model, HttpSession session, RedirectAttributes rttr) {
	    log.info("입찰 처리");

	    if (acSer.placeBid(abDto)) {
	            if(acSer.updateAuction(abDto)) {
	            }
	        model.addAttribute("acnum",abDto.getAcnum());
	        rttr.addFlashAttribute("msg", "입찰 성공");
		    return "redirect:/auction/bid";
	    } else {
	    	model.addAttribute("acnum",abDto.getAcnum());
	        rttr.addFlashAttribute("msg", "입찰 실패");
	        return "redirect:/auction/bid";
	    }
	}

	
}//end.

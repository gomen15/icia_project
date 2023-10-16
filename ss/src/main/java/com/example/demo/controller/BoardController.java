package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.demo.dto.BoardDto;
import com.example.demo.dto.ReplyDto;
import com.example.demo.exception.DBException;
import com.example.demo.service.BoardService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController<BoardFile> {

	@Autowired
	BoardService bSer;

	@GetMapping("/list")
	public String findBoardList(BoardDto bDto, Model model, HttpSession session) {
		List<BoardDto> bList = bSer.findBoardList(bDto);
		log.info("bList : {}", bList);

		String imageUrl = ServletUriComponentsBuilder.fromCurrentContextPath().path("/upload").toUriString();

		for (BoardDto Board : bList) {
			if (Board.getSysFileName() != null) {
				Board.setSysFileName(imageUrl + "/" + Board.getSysFileName()); // SysFileName 업데이트
			}
			log.info(Board.getSysFileName());
		}

		model.addAttribute("bList", bList);
		log.info("board list");
		return "board";
	}

	@GetMapping("/write")
	public String BoardWrite() {
		log.info("Board라이트");
		return "boardwrite";// JSP 파일명
	}

	@PostMapping("/write")
	public String Boardwrite(BoardDto bDto, MultipartFile attachments, HttpSession session, RedirectAttributes rttr,
			MultipartFile multi) {
		log.info("글쓰기 처리");
		log.info("Board={}", bDto);
		boolean result = bSer.boardWrite(bDto, attachments, session);
		if (result) {
			rttr.addFlashAttribute("msg", "글쓰기 성공");
			return "redirect:/board/list"; // 0--->10
		} else { // forward는 get--->get, post--->post만 가능
			rttr.addFlashAttribute("msg", "글쓰기 실패");
			return "redirect:/board/write";
		}
	}

	@GetMapping("/detail")
	public String BoardDetail(int bnum, Model model) {
		BoardDto bDto = bSer.BoardDetail(bnum);
		String imageUrl = ServletUriComponentsBuilder.fromCurrentContextPath().path("/upload/").path(bDto.getSysFileName()).toUriString();
		log.info("imageUrl : {}",imageUrl);
		
		if(bDto != null) {
			List<ReplyDto> rDto = bSer.getReplyList(bnum);
			int B_views = bDto.getB_views()+1;
			bSer.updateBoardViews(B_views,bnum);
			bDto.setB_views(B_views);
			model.addAttribute("boardDto", bDto);
			model.addAttribute("imageUrl",imageUrl);
			model.addAttribute("rList",rDto);
			return "boardDetail";
		} else {
			log.info("게시글 bDto 조회결과 null");
			return "redirect:/board/list";
		}
	}

	@GetMapping("/delete")
	public String BoardDelete(int bnum, HttpSession session, RedirectAttributes rttr) {
		log.info("BoardDelete bnum:{}", bnum);
		try {
			bSer.BoardDelete(bnum, session);
			rttr.addFlashAttribute("msg", bnum + "삭제성공");
			return "redirect:/board/list?pageNum=1";
		} catch (DBException e) {
			log.info(e.getMessage());
			rttr.addFlashAttribute("msg", bnum + " 삭제실패");
			return "redirect:/board/detail?bnum="+bnum;
		}
	}

	@PostMapping("/delete")
	public String BoardDelete(BoardDto bDto) {
		boolean replyDelete = bSer.replyDeleteList(bDto.getBnum());
		if(replyDelete) {
			boolean result = bSer.BoardDelete(bDto);
			log.info("bDto : {}",bDto.getBnum());
			if (result) {
				log.info("성공");
				return "redirect:/board/list";
			} else {
				log.info("실패");
				return "redirect:/board/list";
			}
		} else {
			boolean result = bSer.BoardDelete(bDto);
			log.info("bDto : {}",bDto.getBnum());
			if (result) {
				log.info("성공");
				return "redirect:/board/list";
			} else {
				log.info("실패");
				return "redirect:/board/list";
			}	
		}
	}
	
	@GetMapping("/replydelete")
	public String ReplyDelete(int rnum,int bnum, HttpSession session, RedirectAttributes rttr) {
		log.info("ReplyDelete rnum:{}", rnum);
		try {
			bSer.ReplyDelete(rnum, session);
			rttr.addFlashAttribute("msg", rnum + "삭제성공");
			return "redirect:/board/detail?bnum="+bnum;
		} catch (DBException e) {
			log.info(e.getMessage());
			rttr.addFlashAttribute("msg", rnum + " 삭제실패");
			return "redirect:/board/detail?bnum="+bnum;
		}
	}

	@PostMapping("/replydelete")
	public String ReplyDelete(ReplyDto rDto, HttpSession session) {
		log.info("rDto : {}",rDto.getRnum());
		boolean result = bSer.ReplyDelete(rDto);

		if (result) {
			log.info("성공");
			return "redirect:/board/detail?bnum="+rDto.getBnum();
		} else {
			log.info("실패");
			return "redirect:/board/detail?bnum="+rDto.getBnum();
		}
	}
	
	@ResponseBody
	@PostMapping("/likes")
	public String Likes(int bnum, String id,Model model) {
		log.info("bnum : {}",bnum);
		log.info("id : {}",id);
		
		boolean result = bSer.likesInsert(bnum,id);
		
		if(result) {
			boolean likes = bSer.updateLikes(bnum);
			
			if(likes) {
				return "좋아요 성공";				
			} else {
				return "좋아요 실패";
			}
		} else {
			boolean likescan = bSer.updateLikes(bnum);
			
			return "좋아요 취소";
		}
		
	}

}
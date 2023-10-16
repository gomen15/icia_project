package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.common.BoardFileManager;
import com.example.demo.dto.ReplyDto;
import com.example.demo.service.BoardService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardRestController {
	
	@Autowired
	private BoardService bSer;
	
	@Autowired
	private BoardFileManager bfm;
	
	@Autowired
	private BoardService rSer;
	

	
	@PostMapping("/reply2")
	public ResponseEntity<List<ReplyDto>> boardReply2(ReplyDto rDto,HttpSession session) {
		List<ReplyDto> rList = bSer.replyInsert2(rDto);
		return ResponseEntity.ok(rList);
	}
	
	@PostMapping("/reply")
//	@ResponseBody
	public ReplyDto BoardReply(ReplyDto rDto,HttpSession session) {
		log.info("rDto : {}", rDto);
		ReplyDto reply = bSer.replyInsert(rDto);
		return reply; //jackson => json => boarddetail => .done
	}
	
	@PostMapping("/replyjson")
//	@ResponseBody
	public String BoardReplyjson(@RequestBody ReplyDto rDto,HttpSession session) {
		log.info("reply:{}", rDto);
		return "사용할 수 있는 아이디입니다";
		//return rDto;
	}
}

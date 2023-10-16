package com.example.demo.service;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.common.BoardFileManager;
import com.example.demo.dao.BoardDao;
import com.example.demo.dto.BoardDto;
import com.example.demo.dto.ReplyDto;
import com.example.demo.exception.CommonException;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardService {

    @Autowired
    private BoardDao bDao;
    

    
    
    @Autowired
    private BoardFileManager bfm;

   
    

	public boolean b_join(MultipartFile attachments, HttpSession session, BoardDto bDto) {
		boolean result = bDao.b_join(bDto);
		if(result) {
			if(bfm.BoardfileUpload(attachments,session,bDto.getBnum())) {
				log.info("file Upload ok !");
				return true;
			} else {
				log.info("file Upload fail . . .");
				return false;
			}
		}
		return false;
	}


	public boolean b_u_profile(BoardDto bDto) {
		return bDao.b_u_profile(bDto);
	}

	public BoardDto boardDataSelect(BoardDto bDto) {
		return bDao.boardDataSelect(bDto);
	}
	
	public ResponseEntity<Resource> fileDownload(BoardDto bDto, HttpSession session) 
			throws FileNotFoundException, UnsupportedEncodingException {
		return bfm.boardfileDownload(bDto, session);
	}

	public boolean boardWrite(BoardDto bDto, MultipartFile attachments, HttpSession session) {
		
		boolean result = bDao.writePro(bDto);
		
		if(result) {
			if(bfm.BoardfileUpload(attachments, session, bDto.getBnum())) {
				return true;
			} else {
				log.info("게시글 작성만 성공");
				return true;
			}
		} else {
			log.info("게시글 작성 실패");
			return false;
		}
		
	}

	public BoardDto BoardDetail(int bnum) {
		return bDao.getBoardDetail(bnum);
	}

	public List<BoardDto> findBoardList(BoardDto bDto) {
		List<BoardDto> bList=bDao.findBoardList();
		return bList;
	
	}
	
	public void BoardDelete(int bnum, HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	public boolean BoardDelete(BoardDto bDto) {
		return bDao.BoardDelete(bDto);
	}


	public int updateBoardViews(int b_views, Integer bnum) {
		return bDao.updateBoardViews(b_views,bnum);
	}
	
	public List<ReplyDto> getReplyList(Integer bnum) {
		return bDao.getReplyList(bnum);
	}


	public ReplyDto replyInsert(ReplyDto rDto) {
		ReplyDto reply = null;
		if(bDao.replyInsertSelectKey(rDto)) { //r_num : 10
			log.info("rnum:{}",rDto.getRnum());
			reply = bDao.getReplyMyOne(rDto.getRnum());
			//select * from reply where r_bnum = #{r_bnum} and rownum = 1 안좋음
		}
		return reply;
	}
	

	
	@PostMapping("/reply")
	public List<ReplyDto> replyInsert2(ReplyDto rDto) {
		List<ReplyDto> rList = null;
		
		if(bDao.replyInsert(rDto)) {
			rList = bDao.getReplyList(rDto.getBnum());
			return rList;
		}
		throw new CommonException("댓글 추가 실패");
	}
	
	public List<ReplyDto> replyInsert3(ReplyDto reply) {
		List<ReplyDto> rList=null;
		if(bDao.replyInsert(reply)) {
		 	rList=bDao.getReplyList(reply.getBnum());
		 	return rList;
		}
		throw new CommonException("댓글 추가 예외 발생");
	}


	public List<ReplyDto> findReplyList(BoardDto bDto) {
		return bDao.findReplyList(bDto);
	}


	public void ReplyDelete(int rnum, HttpSession session) {
		// TODO Auto-generated method stub
		
	}


	public boolean ReplyDelete(ReplyDto rDto) {
		return bDao.ReplyDelete(rDto);
	}


	public boolean replyDeleteList(int bnum) {
		return bDao.replyDeleteList(bnum);
	}


	public boolean likesInsert(int bnum, String id) {
		Integer likes = bDao.selectLikes(bnum,id);
		
		if(likes > 0) {
			if(bDao.DeleteLikes(bnum,id)) {
				return false;
			} else {
				return false;
			}
		} else {
			if(bDao.InsertLikes(bnum,id)) {
				return true;
			} else {
				return false;
			}
		}
	}


	public boolean updateLikes(int bnum) {
		BoardDto bDto = bDao.SelectUpdateLikes(bnum);
		
		log.info("bDto : {}",bDto);
		
		if(bDto != null) {
			if(bDao.updateLikes(bDto.getLikes(),bnum)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}


}
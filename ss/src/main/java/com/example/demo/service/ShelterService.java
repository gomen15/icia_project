package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.common.FileManager;
import com.example.demo.dao.ShelterDao;
import com.example.demo.dto.ShelterDto;
import com.example.demo.dto.ShelterReplyDto;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@MultipartConfig
@Service
public class ShelterService {

	@Autowired
     ShelterDao sDao;
	
	@Autowired
	FileManager fm;

	public List<ShelterDto> findShelterList() {
		List<ShelterDto> sList=sDao.findShelterList();
		return sList;
	}

	public List<ShelterReplyDto> getReplyList(Integer snum) {
		return sDao.getReplyList(snum);
	}
	
	public boolean replyInsert(ShelterReplyDto reply) {
		return sDao.replyInsert(reply);
	}
	
	public ShelterDto shelterDetail(Integer snum) {
		return sDao.shelterDetail(snum);
	}

	public boolean shelterWrite(ShelterDto sDto, MultipartFile attachments, HttpSession session) {
		
		boolean result = sDao.shelterWrite(sDto);
		
		if(result) {
			if(fm.shelterfileUpload(attachments,session,sDto.getSnum())) {
				log.info("file Upload ok !");
				return true;
			} else {
				log.info("file Upload fail . . .");
				return false;
			}
		} else {
			log.info("글쓰기만 성공");
			return true;			
		}
	}

	public void shelterDelete(Integer snum) {
		sDao.shelterReplyDelete(snum);
		sDao.shelterDelete(snum);
	}

	public boolean shelterUpdate(ShelterDto sDto, MultipartFile attachments, HttpSession session) {
		boolean result = sDao.shelterUpdate(sDto);
		
		if(result) {
			if(fm.shelterfileUpload(attachments,session,sDto.getSnum())) {
				log.info("file Upload ok !");
				return true;
			} else {
				log.info("file Upload fail . . .");
				return false;
			}
		} else {
			log.info("글쓰기만 성공");
			return true;			
		}
	}
	
	


    // 나머지 비즈니스 로직 구현
}

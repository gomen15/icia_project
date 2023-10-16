package com.example.demo.service;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.common.FileManager;
import com.example.demo.dao.hosDao;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.hosCheckDto;
import com.example.demo.dto.hosDto;
import com.example.demo.dto.hosRatingDto;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class hosService {

    @Autowired
    private hosDao hDao;
    
    @Autowired
    private FileManager fm;

    public boolean reserve_hos_check(hosCheckDto hDto) {
    	log.info("reserve_hos_check!!!");
    	
        if(hDao.reserve_hos_select(hDto)) {
        	log.info("reserve_hos_select!!! false!!!");
            return false;
        } else {
        	log.info("reserve_hos_check!!! complete!!!");
            return hDao.reserve_hos_check(hDto);
        }
    }

	public boolean h_join(MultipartFile attachments, HttpSession session, hosDto hDto) {
		boolean result = hDao.h_join(hDto);
		if(result) {
			if(fm.hosfileUpload(attachments,session,hDto.getCode())) {
				log.info("file Upload ok !");
				return true;
			} else {
				log.info("file Upload fail . . .");
				return false;
			}
		}
		return false;
	}

	public int h_codecheck(String code) {
		return hDao.h_codecheck(code);
	}

	public boolean h_u_profile(hosDto hDto) {
		return hDao.h_u_profile(hDto);
	}

	public hosDto hosDataSelect(hosDto hDto) {
		return hDao.hosDataSelect(hDto);
	}
	
	public ResponseEntity<Resource> fileDownload(hosDto hDto, HttpSession session) 
			throws FileNotFoundException, UnsupportedEncodingException {
		return fm.hosfileDownload(hDto, session);
	}
	public List<hosDto> findHospitalList(MemberDto mDto, Model model) {
		log.info("findHospitalList");
    	if(mDto != null) {
    		return hDao.findHospitalList(mDto);
    	}else {
    		mDto = new MemberDto();
    		mDto.setAddr("서울");
    		return hDao.findHospitalList(mDto);
    	}
	
	}

	public hosDto hosSelect(String code) {
		hosDto hDto = hDao.hosSelect(code);
		return hDto;
	}

	public List<hosCheckDto> reservesList(String id) {
		return hDao.reservesList(id);
	}

	public List<hosCheckDto> reservesListForHos(String code) {
		return hDao.reservesListForHos(code);
	}

	public boolean deleteReserves(hosCheckDto hcDto) {
		return hDao.deleteReserves(hcDto);
	}

	public List<hosDto> hosSearch(String hostitle) {
		List<hosDto> hList = hDao.hosSearch(hostitle);
		return hList;
	}

	public List<hosRatingDto> ratingList(String code) {
		List<hosRatingDto> rList = hDao.hosRatingList(code);
		return rList;
	}

	public boolean ratingWrite(hosRatingDto hRDto) {
		return hDao.ratingWrite(hRDto);
	}

}
package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.common.FileManager;
import com.example.demo.dao.AuctionDao;
import com.example.demo.dao.MemberDao;
import com.example.demo.dto.AuctionBuyDto;
import com.example.demo.dto.AuctionDto;

import jakarta.servlet.http.HttpSession;

@Service
public class AuctionService {
	@Autowired
	MemberDao mDao;
	
	@Autowired
	AuctionDao acDao;
	
	@Autowired
	FileManager fm;
	

	public List<AuctionDto> findAuctionList(AuctionDto acDto) {
		List<AuctionDto> AcList=acDao.findAuctionList();
		return AcList;
	}


	


	public boolean auctionWrite(AuctionDto acDto, MultipartFile attachments, HttpSession session) {
		boolean result = acDao.auctionWrite(acDto);
		
		if(result) {
			if(fm.acfileUpload(attachments,session,acDto.getAcnum())) {
				return true;
			} else {
				return true;
			}
		} else {
			return false;
		}
	}





	public AuctionDto getAuctionDetail(Integer acnum) {
		return acDao.getAuctionDetail(acnum);
	}





	public List<AuctionBuyDto> getAuctionBuy(Integer acnum) {
		return acDao.getAuctionBuy(acnum);
	}





	public boolean placeBid(AuctionBuyDto abDto) {
		boolean result=acDao.placeBid(abDto);
		if(result) {
			return true;
		}else {
		return false;
	}
	}





	public AuctionDto getAuctionbuyDetail(Integer acnum) {
		return acDao.getAuctionbuyDetail(acnum);
	}





	public boolean updateAuction(AuctionBuyDto abDto) {
		return acDao.updateAuction(abDto);
	}





	public List<AuctionDto> searchAuctionList(String keyword) {
		return acDao.searchAuctionList(keyword);
	}




	


	
	
//	public boolean bidAuction(AuctionBuyDto abDto) {
//		return abDto;
//	}
	
	
	
	
	
	
	
	
}

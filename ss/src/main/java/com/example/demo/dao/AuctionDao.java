package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.AuctionBuyDto;
import com.example.demo.dto.AuctionDto;

@Mapper
public interface AuctionDao {

	@Select("select acnum,id,ac_animal,ac_age,minprice,toprice,starttime,endtime,OriFileName as OriFileName,SysFileName as SysFileName,filePath,endtime2 from auction")
	public List<AuctionDto> findAuctionList();
	


	@Select("select acnum,id,ac_animal,ac_age,minprice,toprice,starttime,endtime,OriFileName as OriFileName,SysFileName as SysFileName,filePath,endtime2 from auction where acnum=#{acnum}")
	public AuctionDto getAuctionDetail(Integer acnum);



public boolean auctionWrite(AuctionDto acDto);


@Update("update auction set OriFileName = #{oriFileName}, SysFileName = #{sysFileName}, filePath = #{filePath} where acnum = #{acnum}")
public boolean fileInsertMap(Map<String, Object> fMap);


@Select("select * from auctionbuy where acnum = #{acnum}")
public List<AuctionBuyDto> getAuctionBuy(Integer acnum);


@Insert("insert into auctionbuy values(#{id},#{acnum},#{toprice},sysdate)")
public boolean placeBid(AuctionBuyDto abDto);


@Select("select * from auctionbuy where acnum = #{acnum}")
public AuctionDto getAuctionbuyDetail(Integer acnum);


@Update("update auction set toprice=#{toprice} where acnum = #{acnum}")
public boolean updateAuction(AuctionBuyDto abDto);


@Select("select * from auction where ac_animal like '%' || #{ac_animal} || '%'")
public List<AuctionDto> searchAuctionList(String keyword);











}

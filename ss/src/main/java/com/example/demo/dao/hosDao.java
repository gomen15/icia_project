package com.example.demo.dao;

import java.util.Map;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.MemberDto;
import com.example.demo.dto.hosCheckDto;
import com.example.demo.dto.hosDto;
import com.example.demo.dto.hosRatingDto;

@Mapper
public interface hosDao {
    
	public boolean reserve_hos_select(hosCheckDto hDto);

    @Insert("insert into a_hos_check values(#{checkDateTime, jdbcType=TIMESTAMP},#{code},#{animal},#{h_pro},#{id})")
//	@Insert("insert into a_hos_check values('예약일','예약자','예약병원','예약동물','진료내용')")
	public boolean reserve_hos_check(hosCheckDto hDto);

    @Update("update a_hos_plus set hostitle = #{hostitle},hosphone = #{hosphone},hosaddr = #{hosaddr},hoshour = #{hoshour},hosmin = #{hosmin},hoshour2 = #{hoshour2},hosmin2 = #{hosmin2},mincheck = #{mincheck},hostype = #{hostype} where code = #{code}")
	public boolean h_join(hosDto hDto);
    
    @Select("select count(*) from a_hos_plus where code = #{code}")
	public int h_codecheck(String code);
    
    @Update("update a_hos_plus set code = #{code},hosphone = #{hosphone},hoshour = #{hoshour},hosmin = #{hosmin},hoshour2 = #{hoshour2},hosmin2 = #{hosmin2},mincheck = #{mincheck},hostype = #{hostype} where code = #{BeforeCode}")
	public boolean h_u_profile(hosDto hDto);
    
    @Select("select code,hostitle,hosphone,hosaddr,hoshour,hoshour2,hosmin,hosmin2,mincheck,hostype,sysfilename from a_hos_plus where code = #{code}")
	public hosDto hosDataSelect(hosDto hDto);
    
    @Update("update a_hos_plus set OriFileName = #{oriFileName}, SysFileName = #{sysFileName}, filePath = #{filePath} where code = #{code}")
	public boolean fileInsertMap(Map<String, String> fMap);
    
    public List<hosDto> findHospitalList(MemberDto mDto);
    
    public List<hosDto> hosSearch(String hostitle);

    @Select("select * from a_hos_plus where code = #{code}")
	public hosDto hosSelect(String code);

    
	public List<hosCheckDto> reservesList(String id);
	
	public List<hosCheckDto> reservesListForHos(String code);

	@Delete("delete from a_hos_check where code = #{code} and checkdate = #{checkDateTime, jdbcType=TIMESTAMP}")
	public boolean deleteReserves(hosCheckDto hcDto);

	@Select("select * from rating where code = #{code}")
	public List<hosRatingDto> hosRatingList(String code);

	@Insert("insert into rating values(#{code}, #{rating}, #{review}, sysdate, #{id})")
	public boolean ratingWrite(hosRatingDto hRDto);
    
    
}
package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.ShelterDto;
import com.example.demo.dto.ShelterReplyDto;

import jakarta.servlet.http.HttpSession;


@Mapper
public interface ShelterDao {
	@Select("SELECT * FROM SHELTER")
	List<ShelterDto> findShelterList();

	boolean shelterWrite(ShelterDto shelterList, List<MultipartFile> attachments, HttpSession session);

	@Insert("INSERT INTO SHELTER VALUES (#{snum}, #{id}, #{name}, #{s_title}, #{s_content}, null, #{s_date}, #{s_view})")
	boolean writePro(ShelterDto sDto);


	 @Insert("Insert INTO SHELTER_VIEW(image,fileName,filePath) VALUES(#{fileName},#{fileName},#{filePath})")
		void save(ShelterDto sDto);

	@Select("SELECT * FROM SHELTER WHERE snum = #{snum}")
	ShelterDto shelterDetail(Integer snum);

	@Select("SELECT * FROM S_REPLY WHERE snum = #{snum} ORDER BY sr_date DESC")
	List<ShelterReplyDto> getReplyList(Integer snum);

	@Insert("INSERT INTO S_REPLY VALUES(REPLY_RNUM_SEQ.nextval, #{snum}, #{id}, #{sr_content}, default)")
	boolean replyInsert(ShelterReplyDto reply);

    @Update("update shelter set OriFileName = #{oriFileName}, SysFileName = #{sysFileName}, filePath = #{filePath} where snum = #{snum}")
	boolean fileInsertMap(Map<String, Object> fMap);

    boolean shelterWrite(ShelterDto sDto);

    @Delete("delete from s_reply where snum = #{snum}")
	void shelterReplyDelete(Integer snum);

    @Delete("delete from shelter where snum = #{snum}")
	void shelterDelete(Integer snum);

	@Update("update shelter set s_title = #{s_title}, s_date = #{s_date}, s_date2 = #{s_date2}, s_age = #{s_age}, s_gender = #{s_gender}, s_genetic = #{s_genetic}, s_weight = #{s_weight} where snum = #{snum}")
	boolean shelterUpdate(ShelterDto sDto);

}

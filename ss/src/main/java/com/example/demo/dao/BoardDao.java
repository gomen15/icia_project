package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.BoardDto;
import com.example.demo.dto.ReplyDto;


@Mapper
public interface BoardDao {
    
	public boolean reserve_board_select(BoardDto bDto);

	public boolean writePro(BoardDto bDto);
    
    @Update("update board set OriFileName = #{oriFileName}, SysFileName = #{sysFileName}, filePath = #{filePath} where bnum = #{bnum}")
	public boolean fileInsertMap(Map<String, String> fMap);

	public boolean b_join(BoardDto bDto);
	
	@Select("select count(*) from board where bnum = #{bnum}")
	public int bnumcheck(String bnum);

	public boolean b_u_profile(BoardDto bDto);

	public BoardDto boardDataSelect(BoardDto bDto);

	@Select("select * from board")
	public List<BoardDto> findBoardList();

//	@Select("SELECT * FROM BOARD ")
//	public BoardDto getBoardDetail(String item);
	
	@Delete("delete from board where bnum=#{bnum}")
	public boolean BoardDelete(BoardDto bDto);
	
	public String[] getSysNameFiles(String bnum);

	public boolean boardExist(String bnum);

	
	
	public void save(BoardDto bDto);

	@Select("select * from board where bnum = #{bnum}")
	public BoardDto getBoardDetail(int bnum);
	
	@Update("UPDATE BOARD SET B_VIEWS = #{b_views} WHERE BNUM = #{bnum}")
	public int updateBoardViews(int b_views, Integer bnum);
	
	List<ReplyDto> getReplyList(Integer bnum);

	boolean replyInsert(ReplyDto rDto);

	boolean replyInsertSelectKey(ReplyDto rDto);
	
	ReplyDto getReplyMyOne(int rnum);
	
	@Delete("DELETE FROM REPLY WHERE RNUM = #{rnum}")
	boolean ReplyDelete(ReplyDto rDto);

	@Select("Select count(*)")
	public List<ReplyDto> findReplyList(BoardDto bDto);
	
	@Delete("DELETE FROM REPLY WHERE BNUM = #{bnum}")
	public boolean replyDeleteList(int bnum);

	@Select("Select Count(*) from likes where bnum = #{bnum} and id = #{id}")
	public Integer selectLikes(int bnum, String id);
	
	@Delete("Delete from likes where bnum = #{bnum} and id = #{id}")
	public boolean DeleteLikes(int bnum, String id);

	@Insert("Insert into likes values(#{bnum},#{id})")
	public boolean InsertLikes(int bnum, String id);

	@Select("Select count(*) as likes from likes where bnum = #{bnum}")
	public BoardDto SelectUpdateLikes(int bnum);

	@Update("Update board set likes = #{likes} where bnum = #{bnum}")
	public boolean updateLikes(int likes, int bnum);
	
}
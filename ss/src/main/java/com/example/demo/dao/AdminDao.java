package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.dto.MemberDto;
import com.example.demo.dto.hosDto;

@Mapper
public interface AdminDao {

    @Select("SELECT*FROM MEMBER")
    public List<MemberDto> memberList(String id);
    
    @Select("SELECT*FROM A_HOS_LIST")
    public List<hosDto> hosList(String hostitle);
}


package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.AdminDao;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.hosDto;

@Service
public class AdminService {

    @Autowired
    AdminDao ADao;

    public List<MemberDto> memberList(String id) {
        return ADao.memberList(id);
    }

    public List<hosDto> hosList(String hostitle) {
        return ADao.hosList(hostitle);
    }
}


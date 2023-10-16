package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dto.MemberDto;
import com.example.demo.dto.hosDto;
import com.example.demo.service.AdminService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class AdminController {
    
    @Autowired
    private AdminService ASer;

    @GetMapping("/admin")
    public String ad_move(){
        return "admin";
    }
    @GetMapping("/admin/memberList")
    public String memberList(HttpSession session,Model model,RedirectAttributes rttr){
        MemberDto mDto = (MemberDto) session.getAttribute("mb");
        log.info("memberlist",mDto);

        if(mDto == null){
            log.info("error");
            rttr.addFlashAttribute("mList",true);
            return "redirect:/admin";
        }else{
            String id = mDto.getId();
            List<MemberDto> mList= ASer.memberList(id);
            model.addAttribute("mList",mList);
        }
        return "memberList";
    }
    @GetMapping("/admin/hosList")
    public String hosList(HttpSession session,Model model,RedirectAttributes rttr){
        hosDto hDto = (hosDto) session.getAttribute("hos");
        log.info("hosList");
        if(hDto == null){
            rttr.addFlashAttribute("hList", true);
            return "redirect:/admin";
        }else{
            String hostitle = hDto.getHostitle();
            List<hosDto> hList=ASer.hosList(hostitle);
            model.addAttribute("hList", hList);
        }
        return "hosList";
    }



}
package com.groupone.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.groupone.service.IF_memberservice;
import com.groupone.vo.MemberVO;

@Controller
public class MemberController<ArchiveFolder> {
	@Inject
	IF_memberservice msvs;
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST) //가입
	public String memberinsert(Locale locale, Model model,MemberVO mvo) throws Exception {
		msvs.member_insert(mvo);
		return "index";
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET) //날짜로 검색
	public String memberselect(Locale locale, Model model,MemberVO mvo) throws Exception {
		List<MemberVO> list=msvs.member_select(mvo);
		System.out.println(list.size());
		model.addAttribute("list",list); //리스트 넘겨주기
		model.addAttribute("mvo",mvo); //리스트 넘겨주기
		return "select";
	}
	
	@RequestMapping(value = "/idchk", method = RequestMethod.GET)	//아이디중복체크
	@ResponseBody
	public int idchk(Locale locale, Model model, String id) throws Exception {
		int countM = msvs.idchk(id);
		model.addAttribute("countM",countM);
		return countM;
	}
	
	@ResponseBody
	@RequestMapping(value="/folderDelete.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public int folderDelete(HttpServletRequest request, @RequestParam(value="checkBoxArr[]") List<String> checkBoxArr 
	) throws Exception {
	    int result = 0;
	    String id = "";
	    System.out.println(checkBoxArr.size()+"체크사이즈");
	    
	    for(int i=0; i<checkBoxArr.size(); i++) {
	    	id=checkBoxArr.get(i);
	    	msvs.deleteM(id);
	    	System.out.println("완료");
	    }
	  return result; 
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET) 
	public String update(Locale locale, Model model,MemberVO mvo) throws Exception {
		msvs.updateM(mvo);
		System.out.println("수정완요");
		return "select";
	}
}

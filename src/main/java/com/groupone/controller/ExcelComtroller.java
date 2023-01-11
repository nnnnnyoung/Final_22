package com.groupone.controller;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.groupone.service.IF_memberservice;
import com.groupone.vo.MemberVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class ExcelComtroller {
	@Inject
	IF_memberservice msvs;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/excelD", method = RequestMethod.GET)
	public String excelD(Locale locale, Model model,MemberVO mvo) throws Exception {
	
		model.addAttribute("list", msvs.member_select(mvo));
		return "excel";
	}
}

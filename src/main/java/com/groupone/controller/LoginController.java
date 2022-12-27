package com.groupone.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.groupone.dao.IF_memberDAO;
import com.groupone.vo.MemberVO;

@Controller
public class LoginController {
	@Inject
	IF_memberDAO msvs;//회원DAO객체 변수
	
	@ResponseBody
	@RequestMapping(value="/login", method=RequestMethod.POST)	//로그인
	public String login(HttpSession session,
			@RequestParam("id")String id,	//로그인창 입력 id pass
			@RequestParam("pass")String pass) throws Exception {
		String message = "";
		MemberVO mvo = new MemberVO();	//입력받은 id 새로운vo에 저장
		mvo.setId(id);
		try {
			mvo = msvs.member_one(id);	//DB에 입력받은 아이디 조회
			if(mvo.getId()==null) {					//아이디가 없을경우
				message = "<script>alert('등록되지 않은 아이디 입니다.');location.href='/one/';</script>";
			}else if(!mvo.getPass().equals(pass)) {	//비밀번호가 틀릴경우
				message = "<script>alert('비밀번호가 틀렸습니다.');location.href='/one/';</script>";
			}else {									//로그인 성공
				if(session.getAttribute("id") != null) {
					session.removeAttribute("id");	//일종의 초기화. 한번더 청소하고 가겠다.
				}
				if(session.getAttribute("pass") != null) {
					session.removeAttribute("pass");	//일종의 초기화. 한번더 청소하고 가겠다.
				}
				session.setAttribute("login_id", id);		//세션저장
				session.setAttribute("login_pass", pass);
				message = "<script>alert('로그인 성공');location.href='/one/';</script>";
			}
			return message;
		} catch (Exception e) {
			message = "<script>alert('등록되지 않은 아이디 입니다.');location.href='/one/';</script>";
			return message;
		}
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)	//로그아웃
	public String logout(HttpSession session) throws Exception{
		session.invalidate();// 세션을 무력화..
		return "index";
	}
}

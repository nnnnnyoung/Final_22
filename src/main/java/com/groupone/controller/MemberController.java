package com.groupone.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.groupone.service.IF_boardservice;
import com.groupone.service.IF_memberservice;
import com.groupone.service.IF_reserveservice;
import com.groupone.vo.BoardVO;
import com.groupone.vo.CommentsVO;
import com.groupone.vo.MemberVO;
import com.groupone.vo.PageVO;
import com.groupone.vo.ReserveVO;

@Controller
public class MemberController {
	@Inject
	IF_memberservice msvs;
	@Inject
	IF_boardservice bsvs;
	@Inject
	IF_reserveservice rsvs;
	//@Inject
	//private FileDataUtil FileDataUtil;
	
	@RequestMapping(value = "/memberjoinview", method = RequestMethod.GET)	//회원가입화면으로 가기
	public String memberjoinview(Locale locale, Model model, String mid, String message, String idchk) throws Exception {
		model.addAttribute("id",mid);
		return "member/memberjoin";	//회원가입화면
	}
	
	@RequestMapping(value = "/idchk", method = RequestMethod.GET)	//아이디중복체크
	@ResponseBody
	public String idchk(Locale locale, Model model, String id) throws Exception {
			String mid=null;
			try {
				String cid = msvs.member_one(id).getId();		
			} catch (Exception e) {
				mid = id;
			}	
		model.addAttribute("id",mid);
		return mid;
	}
	
	@RequestMapping(value = "/memberinsert", method = RequestMethod.POST)	//회원가입하기
	public String memberinsert(Locale locale, Model model,MemberVO mvo,
			@RequestParam("yy")String yy,@RequestParam("mm") String mm,@RequestParam("dd") String dd,
			@RequestParam("postcode")String postcode, @RequestParam("address")String address,
			@RequestParam("detailAddress")String detailAddress,
			@RequestParam("emailId")String emailId, @RequestParam("domainTxt")String domainTxt
			) throws Exception {
		String age = yy+mm+dd;
		mvo.setAge(age);
		
		String addr=postcode+"/"+address+"/"+detailAddress;
		mvo.setAddr(addr);

		String email=emailId+domainTxt;
		mvo.setEmail(email);
		
		msvs.member_insert(mvo);
		return "index";
	}
	
	
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)	//내 정보 보기 페이지로 가기
	public String myInfo(Locale locale, Model model, @RequestParam("id") String id) throws Exception {

		MemberVO mvo=msvs.member_one(id);
		mvo.setAddr(mvo.getAddr().replace("/", " "));
		if(mvo.getGender().equals("M")) {
			mvo.setGender("남성");
		}else {
			mvo.setGender("여성");
		}
		String mdate = mvo.getAge().substring(0,4)+"년"+mvo.getAge().substring(5,7)+"월"+mvo.getAge().substring(8,10)+"일";
		mvo.setAge(mdate);
		
		List<BoardVO> blist = bsvs.selectId(id);
		

		List<ReserveVO> rlist = rsvs.selectId(id);
		
		List<CommentsVO> clist = bsvs.selectComId(id);
		
		
		
		model.addAttribute("mvo",mvo);
		model.addAttribute("blist",blist);
		model.addAttribute("rlist",rlist);
		model.addAttribute("clist",clist);
		
		return "member/memberInfo";	//내 정보 보기 페이지
	}
	
	@RequestMapping(value = "/modMember", method = RequestMethod.GET)	//수정 페이지로 이동
	public String memberjoinview(Locale locale, Model model, @RequestParam("id") String id) throws Exception {
		MemberVO mvo=msvs.member_one(id);
		String adrList[] = mvo.getAddr().split("/"); 
		String emList[] = mvo.getEmail().split("@"); 
		model.addAttribute("adrList",adrList);
		model.addAttribute("emList",emList);
		model.addAttribute("mvo",mvo);
		return "member/memberMod";	//수정 페이지
	}
	
	@RequestMapping(value = "/membermod", method = RequestMethod.POST)	//수정하기
	public String membermod(Locale locale, Model model,MemberVO mvo,
			@RequestParam("yy")String yy,@RequestParam("mm") String mm,@RequestParam("dd") String dd,
			@RequestParam("postcode")String postcode, @RequestParam("address")String address,
			@RequestParam("detailAddress")String detailAddress,
			@RequestParam("emailId")String emailId, @RequestParam("domainTxt")String domainTxt
			) throws Exception {
		String age = yy+mm+dd;
		mvo.setAge(age);
		
		String addr=postcode+"/"+address+"/"+detailAddress;
		mvo.setAddr(addr);

		String email=emailId+domainTxt;
		mvo.setEmail(email);
		
		msvs.member_mod(mvo);
		return "index";
	}
	
	@RequestMapping(value = "/memberdel", method = RequestMethod.GET)	// 회원 삭제 > 회원가입화면으로 가기
	public String memberdel(Locale locale, Model model, @RequestParam("id") String id,HttpSession session) throws Exception {
		msvs.member_del(id);
		session.invalidate();
		return "index";
	}
	
	@RequestMapping(value = "/reservList", method = RequestMethod.GET) //예약정보더보기
	public String reservList(Locale locale, Model model, String id) throws Exception {
		List<ReserveVO> rlist  =rsvs.selectId(id);
		for(int i=0; i<rlist.size(); i++) {
			if(rlist.get(i).getInsurance().equals("Y")) {
				rlist.get(i).setInsurance("네");
			} else {
				rlist.get(i).setInsurance("아니오");
			}
		}
		model.addAttribute("rlist",rlist);		
		return "member/memberReserve";
	}
	
	@RequestMapping(value = "/memberlist", method = RequestMethod.GET) // 나의 댓글 보기
	   public String memberlist(Locale locale, Model model, @ModelAttribute("pageVO") PageVO pageVO,@RequestParam("id") String id) throws Exception {
	      if (pageVO.getPage() == null) {
	         pageVO.setPage(1);
	      }
		int totalpageCnt = bsvs.countBM(id);		
		pageVO.setTotalCount(totalpageCnt);
		List<BoardVO> list = bsvs.selectML(pageVO);

		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);

		return "member/memberlist";
	      

	   }
	
	@RequestMapping(value = "/comList", method = RequestMethod.GET) // 나의 댓글 보기
	   public String comList(Locale locale, Model model, @ModelAttribute("pageVO") PageVO pageVO,@RequestParam("id") String id) throws Exception {
	      if (pageVO.getPage() == null) {
	         pageVO.setPage(1);
	      }
	      
		int totalpageCnt = bsvs.countCM(id);		
		pageVO.setTotalCount(totalpageCnt);
		
		System.out.println(pageVO.getEndNo()+"끝번호");

		System.out.println(pageVO.getStartNo()+"시작번호");
		
		List<CommentsVO> list = bsvs.selectCL(pageVO);

		System.out.println(list.size() + "나와라~~~");
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);

		return "member/commentlist";
	      

	   }
}

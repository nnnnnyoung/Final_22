package com.groupone.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.groupone.service.IF_memberservice;
import com.groupone.service.IF_rentcarservice;
import com.groupone.service.IF_reserveservice;
import com.groupone.vo.PageVO;
import com.groupone.vo.RentcarVO;
import com.groupone.vo.ReserveVO;

@Controller
public class ReserveController {
	@Inject
	IF_reserveservice rsvs;
	@Inject
	IF_rentcarservice csvs;
	@Inject
	IF_memberservice msvs;
	
	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	   public String reserve(Locale locale, Model model,@RequestParam("id") String id,RentcarVO cvo) throws Exception {
	        //System.out.println(id);
	        String coupon=msvs.member_one(id).getCoupon();
	        if(coupon==null) {
	            coupon="보유하신 쿠폰이 없습니다.";
	         }
	         int time_pick = 11;
	         model.addAttribute("time_pick", time_pick);
	         model.addAttribute("coupon", coupon);
	         model.addAttribute("cvo", cvo);
	         return "reserve/reserve";
	   }
	
	@RequestMapping(value = "/pricing", method = RequestMethod.GET)
	public String pricing(Locale locale, Model model) throws Exception {
		return "reserve/pricing";
	}

	@RequestMapping(value = "/cars", method = RequestMethod.GET) // 차량별 사진
	public String member(Locale locale, Model model, @ModelAttribute("pageVO") PageVO pageVO, RentcarVO cno)
			throws Exception {
		if (pageVO.getPage() == null) {
			pageVO.setPage(1);
		}
		int totalpageCnt = csvs.imgcar();
		System.out.println("현제페이지" + pageVO.getPage());
		System.out.println(totalpageCnt + "권병국");
		pageVO.setTotalCount(totalpageCnt);
		List<RentcarVO> list = csvs.imglist(cno);
		System.out.println(list.size() + "박지담");
		model.addAttribute("calist", list);
		model.addAttribute("pageVO", pageVO);

		return "reserve/cars";
	}
	@RequestMapping(value = "/reserveinsert", method = RequestMethod.GET)
	public String reserveinsert(Locale locale, Model model,ReserveVO rvo,RentcarVO cvo,
			@RequestParam("time_pick") int time_pick,
			@RequestParam("coupon") String coupon) throws Exception {
		
		rvo.setReturndate(rvo.getReturndate().replace("-",""));
		rvo.setRentdate(rvo.getRentdate().replace("-",""));
		int rentdate = Integer.parseInt(rvo.getRentdate().toString());
		int returndate = Integer.parseInt(rvo.getReturndate().toString());
		cvo=csvs.rentcarselect(cvo);
		int pay = (returndate-rentdate)*cvo.getPay();
		System.out.println("처음"+pay);
		rvo.setCno(cvo.getCno());
		if(rvo.getInsurance().equals("Y")) {
			pay+=50000;
		}
		System.out.println("보험"+pay);
		if(coupon.contains("20%")) {			
			msvs.delCoupon(rvo.getId());
			pay*=0.8;			
		}
		System.out.println("쿠폰선택"+pay);
		rvo.setSumpay(pay);
		rvo.setReturndate(rvo.getReturndate()+" "+12);
		rvo.setRentdate(rvo.getRentdate()+" "+time_pick);
		System.out.println(rvo.getRentdate());
		System.out.println(rvo.getReturndate());
		rsvs.reserveinsert(rvo);
		return "index";
	}
	
	
	@RequestMapping(value = "/fast_reserve", method = RequestMethod.GET)
	public String fast_reserve(Locale locale, Model model,ReserveVO rvo,RentcarVO cvo,@RequestParam("time_pick") int time_pick) throws Exception {
		//String rentD = rvo.getRentdate().replace("/","-");
		//String returnD = rvo.getReturndate().replace("/","-");
		//rvo.setReturndate(returnD);
		//rvo.setRentdate(rentD);
		//System.out.println(rvo.getId());
		String coupon=msvs.member_one(rvo.getId()).getCoupon();
		if(coupon==null) {
			coupon="보유하신 쿠폰이 없습니다.";
		}
		model.addAttribute("rvo", rvo);
		model.addAttribute("cvo", cvo);
		model.addAttribute("time_pick", time_pick);
		model.addAttribute("coupon", coupon);
		return "reserve/reserve";
	}
	
	
	@RequestMapping(value = "/chkDate", method = RequestMethod.GET)
	@ResponseBody
	public String chkdate(Locale locale, Model model, ReserveVO rvo,RentcarVO cvo) throws Exception {
		cvo=csvs.rentcarselect(cvo);
		rvo.setCno(cvo.getCno());
		try {
			String chk= rsvs.dateChk(rvo).getRentdate();
			return chk;
		}catch (Exception e) {
			// TODO: handle exception
			String chk="";
			return chk;
		}
	}
	@RequestMapping(value = "/paySet", method = RequestMethod.GET)
	   @ResponseBody
	   public String paySet(Locale locale, Model model,ReserveVO rvo,RentcarVO cvo,
	         @RequestParam("coupon") String coupon) throws Exception {
	      
	        rvo.setReturndate(rvo.getReturndate().replace("-",""));
	         rvo.setRentdate(rvo.getRentdate().replace("-",""));
	         int rentdate = Integer.parseInt(rvo.getRentdate().toString());
	         int returndate = Integer.parseInt(rvo.getReturndate().toString());
	         cvo=csvs.rentcarselect(cvo);
	         int pay = (returndate-rentdate)*cvo.getPay();
	         if(rvo.getInsurance().equals("Y")) {
	            pay+=50000;
	            System.out.println("보험 : "+pay);
	         }
	         if(coupon.contains("20")) {         
	            pay*=0.8;
	            System.out.println("쿠폰 : "+pay);
	         }
	         String cnt = Integer.toString(pay);
	         System.out.println("컨트롤러 들어옴");
	         
	         return cnt;
	   }
	
	
	
}

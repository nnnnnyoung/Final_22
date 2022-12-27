package com.groupone.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.groupone.dao.IF_memberDAO;
import com.groupone.vo.MemberVO;
@Service
public class MemberserviceImpl implements IF_memberservice{
	@Inject
	private IF_memberDAO memberdao;
	@Override
	public void member_insert(MemberVO mvo) throws Exception {
		memberdao.member_insert(mvo);
	}
	@Override
	public MemberVO member_one(String id) throws Exception {
		return memberdao.member_one(id);
	}
	@Override
	public void member_mod(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		memberdao.member_mod(mvo);
	}
	@Override
	public void member_del(String id) throws Exception {
		// TODO Auto-generated method stub
		memberdao.member_del(id);
	}
	@Override
	public void delCoupon(String id) throws Exception {
		// TODO Auto-generated method stub
		memberdao.del_coupon(id);
	}

}

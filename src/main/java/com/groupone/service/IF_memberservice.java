package com.groupone.service;

import com.groupone.vo.MemberVO;

public interface IF_memberservice {
	public void member_insert(MemberVO mvo) throws Exception;
	public MemberVO member_one(String id) throws Exception;
	public void member_mod(MemberVO mvo) throws Exception;
	public void member_del(String id) throws Exception;
	public void delCoupon(String id) throws Exception;
}

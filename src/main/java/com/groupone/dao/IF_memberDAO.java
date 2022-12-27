package com.groupone.dao;

import com.groupone.vo.MemberVO;

public interface IF_memberDAO {
	public void member_insert(MemberVO mvo) throws Exception;
	public MemberVO member_one(String id) throws Exception;
	public void member_mod(MemberVO mvo)throws Exception;
	public void member_del(String id) throws Exception;
	public void del_coupon(String id) throws Exception;
}

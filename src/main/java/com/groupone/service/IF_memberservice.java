package com.groupone.service;

import java.util.List;

import com.groupone.vo.MemberVO;

public interface IF_memberservice {
	public void member_insert(MemberVO mvo) throws Exception;

	public List<MemberVO> member_select(MemberVO mvo) throws Exception;

	public int idchk(String id) throws Exception;

	public void deleteM(String id) throws Exception;

	public void updateM(MemberVO mvo) throws Exception;
;
}

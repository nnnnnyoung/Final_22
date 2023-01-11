package com.groupone.service;

import java.util.List;

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
	public List<MemberVO> member_select(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		return memberdao.member_select(mvo);
	}
	@Override
	public int idchk(String id) throws Exception {
		// TODO Auto-generated method stub
		return memberdao.idchk(id);
	}
	@Override
	public void deleteM(String id) throws Exception {
		// TODO Auto-generated method stub
		memberdao.deleteM(id);
	}
	@Override
	public void updateM(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		memberdao.updateM(mvo);
	}

}

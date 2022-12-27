package com.groupone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.groupone.dao.IF_reserveDAO;
import com.groupone.vo.ReserveVO;

@Service
public class ReserveserviceImpl implements IF_reserveservice{
	@Inject
	IF_reserveDAO reservedao;
	
	@Override
	public void reserveinsert(ReserveVO rvo) throws Exception {
		System.out.println(2);
		reservedao.reserveinsert(rvo);
		System.out.println(6);
	}

	
	@Override
	public List<ReserveVO> selectlist(String id) throws Exception {
		// TODO Auto-generated method stub
				return reservedao.selectlist(id);
	}


	@Override
	public List<ReserveVO> selectId(String id) throws Exception {
		// TODO Auto-generated method stub
		return reservedao.selectId(id);
	}


	@Override
	public ReserveVO dateChk(ReserveVO rvo) throws Exception {
		// TODO Auto-generated method stub
		
		return reservedao.dateChk(rvo);
	}
	

	@Override
	public ReserveVO reservOne(int rno) throws Exception {
		// TODO Auto-generated method stub
		return reservedao.reservOne(rno);
	}


	@Override
	public void updateR(int rno) throws Exception {
		// TODO Auto-generated method stub
		reservedao.updateR(rno);
	}
}

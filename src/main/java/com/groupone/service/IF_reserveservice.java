package com.groupone.service;

import java.util.List;

import com.groupone.vo.ReserveVO;

public interface IF_reserveservice {
	public void reserveinsert(ReserveVO rvo) throws Exception;
	
	public List<ReserveVO> selectlist(String id) throws Exception;

	public List<ReserveVO> selectId(String id) throws Exception;

	public ReserveVO dateChk(ReserveVO rvo) throws Exception;
	public ReserveVO reservOne(int rno) throws Exception ;

	public void updateR(int rno) throws Exception;

}

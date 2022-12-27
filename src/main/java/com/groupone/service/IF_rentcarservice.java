package com.groupone.service;

import java.util.List;

import com.groupone.vo.RentcarVO;

public interface IF_rentcarservice {
	public RentcarVO rentcarselect(RentcarVO cvo) throws Exception;

	public List<RentcarVO> imglist(RentcarVO cno) throws Exception;

	public int imgcar() throws Exception;
}

package com.groupone.dao;


import java.util.List;

import com.groupone.vo.RentcarVO;

public interface IF_rentcarDAO {
   public RentcarVO rentcarselect(RentcarVO cvo) throws Exception;
   public List<RentcarVO> imglist(RentcarVO cno) throws Exception;
   public int imgcar() throws Exception;
   
}
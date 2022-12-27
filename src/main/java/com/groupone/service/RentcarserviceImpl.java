package com.groupone.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.groupone.dao.IF_rentcarDAO;
import com.groupone.vo.RentcarVO;

@Service
public class RentcarserviceImpl implements IF_rentcarservice{

   @Inject
   IF_rentcarDAO rentcardao;

   @Override
   public RentcarVO rentcarselect(RentcarVO cvo) throws Exception {
      return rentcardao.rentcarselect(cvo);
   }
   @Override
   public List<RentcarVO> imglist(RentcarVO cno) throws Exception {
      // TODO Auto-generated method stub
      return rentcardao.imglist(cno);
   }

   @Override
   public int imgcar() throws Exception {
      // TODO Auto-generated method stub
      return rentcardao.imgcar();
   }

}
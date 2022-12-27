package com.groupone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.groupone.vo.RentcarVO;

@Repository
public class RentcarDAOImpl implements IF_rentcarDAO{

   @Inject
   private SqlSession sqlsession;
   
   private static String mapperQuery = "com.groupone.dao.IF_rentcarDAO";
   @Override
   public RentcarVO rentcarselect(RentcarVO cvo) throws Exception {
      return sqlsession.selectOne(mapperQuery+".rentcarselect",cvo);
   }
   @Override
   public List<RentcarVO> imglist(RentcarVO cno) throws Exception {
      // TODO Auto-generated method stub
      return sqlsession.selectList(mapperQuery+".imglist",cno);
   }
   @Override
   public int imgcar() throws Exception {
      // TODO Auto-generated method stub
      return sqlsession.selectOne(mapperQuery+".imgcar");
   }
}
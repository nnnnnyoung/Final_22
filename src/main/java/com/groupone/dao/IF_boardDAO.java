package com.groupone.dao;

import java.util.List;

import com.groupone.vo.BoardVO;
import com.groupone.vo.CommentsVO;
import com.groupone.vo.GoodlistVO;
import com.groupone.vo.PageVO;

public interface IF_boardDAO {
	public List<BoardVO> selectAll(PageVO pageVO) throws Exception;
	public int countBoard() throws Exception;
	public BoardVO selectB(String bno) throws Exception;
	public void plusCnt(String bno) throws Exception;
	public String selectCN(int rno) throws Exception;
	public String selectAttach(String bno) throws Exception;
	public List<CommentsVO> selectCom(String bno) throws Exception;
	public void inputC(CommentsVO commentsVO) throws Exception;
	public void delCom(String bbno) throws Exception;
	public void insertAttach(String filename) throws Exception;
	public void insertOne(BoardVO boardvo) throws Exception;
	public BoardVO selectOne(String vno) throws Exception;
	public void delBoard(String bno) throws Exception;
	public BoardVO modiB(String rno) throws Exception;
	public void updateB(BoardVO bvo) throws Exception;
	public void updateBfile(BoardVO bvo) throws Exception;
	public int countSh(PageVO shPage) throws Exception;
	public List<BoardVO> selectSh(PageVO shPage) throws Exception;
	public void modiC(CommentsVO cvo) throws Exception ;
	public int countLike(GoodlistVO gvo) throws Exception;
	public void updateG(GoodlistVO gvo) throws Exception;
	public void deleteL(GoodlistVO gvo) throws Exception;
	public void insertL(GoodlistVO gvo) throws Exception;
	public List<BoardVO> selectId(String id);
	public List<CommentsVO> selectComId(String id) throws Exception;
	public int countBM(String id) throws Exception;
	public int countCM(String id) throws Exception;
	public List<BoardVO> selectML(PageVO pageVO) throws Exception;
	public List<CommentsVO> selectCL(PageVO pageVO) throws Exception;
}

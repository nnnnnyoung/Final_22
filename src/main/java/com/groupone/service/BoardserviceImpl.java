package com.groupone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.groupone.dao.IF_boardDAO;
import com.groupone.vo.BoardVO;
import com.groupone.vo.CommentsVO;
import com.groupone.vo.GoodlistVO;
import com.groupone.vo.PageVO;

@Service
public class BoardserviceImpl implements IF_boardservice{
	@Inject
	private IF_boardDAO boarddao;

	@Override
	public List<BoardVO> selectAll(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		List<BoardVO> List=boarddao.selectAll(pageVO);
		String newContent;
		String newtitle;
		for(int i=0; i<List.size(); i++) {
			if(List.get(i).getContent().length()>30) {
				newContent=List.get(i).getContent().substring(0, 30);
				List.get(i).setContent(newContent);
			}
			if(List.get(i).getTitle().length()>15) {
				newtitle=List.get(i).getTitle().substring(0, 15)+"..";
				List.get(i).setTitle(newtitle);
			}
		}
		return List;
	}
	@Override
	public int countBoard() throws Exception {
		// TODO Auto-generated method stub
		return boarddao.countBoard();
	}
	@Override
	public BoardVO selectB(String bno) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.selectB(bno);
	}
	@Override
	public void plusCnt(String bno) throws Exception {
		// TODO Auto-generated method stub
		boarddao.plusCnt(bno);
	}
	@Override
	public String selectCN(int rno) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.selectCN(rno);
	}
	@Override
	public String selectAttach(String bno) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.selectAttach(bno);
	}
	@Override
	public List<CommentsVO> selectCom(String bno) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.selectCom(bno);
	}
	@Override
	public void inputC(CommentsVO commentsVO) throws Exception {
		// TODO Auto-generated method stub
		boarddao.inputC(commentsVO);
	}
	@Override
	public void delCom(String bbno) throws Exception {
		// TODO Auto-generated method stub
		boarddao.delCom(bbno);
	}
	
	@Override
	public void insertOne(BoardVO boardvo) throws Exception {
		// TODO Auto-generated method stub
		boarddao.insertOne(boardvo);
		String[] fname = boardvo.getFiles();
		if (fname != null) {
			for (int i = 0; i < fname.length; i++) {
				if (fname[i] != null) {
					boarddao.insertAttach(fname[i]);
				}
			}
		}

	}

	@Override
	public BoardVO selectOne(String vno) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.selectOne(vno);
	}
	@Override
	public void delBoard(String bno) throws Exception {
		// TODO Auto-generated method stub
		boarddao.delBoard(bno);
	}
	@Override
	public BoardVO modiB(String bno) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.modiB(bno);
	}
	@Override
	public void updateB(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		boarddao.updateB(bvo);
	}
	@Override
	public void updateBfile(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		boarddao.updateBfile(bvo);
	}
	@Override
	public int countSh(PageVO shPage) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.countSh(shPage);
	}
	@Override
	   public List<BoardVO> selectSh(PageVO shPage) throws Exception {
	      // TODO Auto-generated method stub
	      List<BoardVO> List=boarddao.selectSh(shPage);
	      String newContent;
	      String newtitle;
	      for(int i=0; i<List.size(); i++) {
	         if(List.get(i).getContent().length()>30) {
	            newContent=List.get(i).getContent().substring(0, 30);
	            List.get(i).setContent(newContent);
	         }else if(List.get(i).getTitle().length()>15) {
	            newtitle=List.get(i).getTitle().substring(0, 15)+"..";
	            List.get(i).setTitle(newtitle);
	         }
	      }
	      return List;
	   }
	@Override
	public void modiC(CommentsVO cvo) throws Exception {
		// TODO Auto-generated method stub
		boarddao.modiC(cvo);
	}
	@Override
	public int countLike(GoodlistVO gvo) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.countLike(gvo);
	}
	@Override
	public void updateG(GoodlistVO gvo) throws Exception {
		// TODO Auto-generated method stub
		boarddao.updateG(gvo);
	}
	@Override
	public void deleteL(GoodlistVO gvo) throws Exception {
		// TODO Auto-generated method stub
		boarddao.deleteL(gvo);
	}
	@Override
	public void insertL(GoodlistVO gvo) throws Exception {
		// TODO Auto-generated method stub
		boarddao.insertL(gvo);
	}
	
	@Override
	public List<BoardVO> selectId(String id) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.selectId(id);
	}
	@Override
	public List<CommentsVO> selectComId(String id) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.selectComId(id);
	}
	@Override
	public int countBM(String id) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.countBM(id);
	}
	@Override
	public List<BoardVO> selectML(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.selectML(pageVO);
	}
	
	@Override
	public int countCM(String id) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.countCM(id);
	}
	@Override
	public List<CommentsVO> selectCL(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.selectCL(pageVO);
	}
}

package com.spring.crazy.dao;

import java.util.List;

import com.spring.crazy.model.CrazyBoardVO;

public interface CrazyBoardDAO {
	// 글목록
	public List<CrazyBoardVO> crazyList(int start, int end) throws Exception;

	// 게시물 개수를 가져오는 메소드
	public int crazyboardarticle() throws Exception;

	// 글쓰기
	public void crazywrite(CrazyBoardVO vo) throws Exception;

	// 글읽기
	public CrazyBoardVO crazyboardview(int bno) throws Exception;
	
	// 글수정
	public void crazyupdate(CrazyBoardVO vo) throws Exception;
	
	// 글삭제
	public void crazydelete(int bno) throws Exception;
}

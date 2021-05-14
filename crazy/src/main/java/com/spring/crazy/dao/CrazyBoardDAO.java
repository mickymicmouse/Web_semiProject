package com.spring.crazy.dao;

import java.util.List;

import com.spring.crazy.model.CrazyBoardVO;

public interface CrazyBoardDAO {
	// �۸��
	public List<CrazyBoardVO> crazyList(int start, int end) throws Exception;

	// �Խù� ������ �������� �޼ҵ�
	public int crazyboardarticle() throws Exception;

	// �۾���
	public void crazywrite(CrazyBoardVO vo) throws Exception;

	// ���б�
	public CrazyBoardVO crazyboardview(int bno) throws Exception;
	
	// �ۼ���
	public void crazyupdate(CrazyBoardVO vo) throws Exception;
	
	// �ۻ���
	public void crazydelete(int bno) throws Exception;
}
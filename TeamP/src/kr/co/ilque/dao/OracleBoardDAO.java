package kr.co.ilque.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ilque.dto.BoardDto;
import kr.co.ilque.dto.DetailViewDto;
import kr.co.ilque.dto.StartEnd;

@Repository("boardDao")
public class OracleBoardDAO {

	@Autowired
	private SqlSession ss;

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	public List<BoardDto> selectAll(int startNo, int endNo, String keyword,String category,String gender) {
		StartEnd se = new StartEnd();
		se.setEndNo(endNo);
		se.setStartNo(startNo);
		se.setKeyword(keyword);
		se.setCategory(category);
		se.setGender(gender);
		System.out.println("dao에서 키워드값 :"+keyword);
		System.out.println("dao에서 카테고리값 : " +category);
		List<BoardDto> list = ss.selectList("kr.co.ilque.board.selectAll", se);
		System.out.println(list);
		return list;
	}

	public int getData() {
		return ss.selectOne("kr.co.ilque.board.getTotal");
	}

	public DetailViewDto selectOne(int boardNo) {
		System.out.println(boardNo);
		return ss.selectOne("kr.co.ilque.board.showDetails", boardNo);

	}

	public void insertOne(BoardDto bdto) {
		// TODO Auto-generated method stub
		ss.insert("kr.co.ilque.board.insertOne",bdto);
	}

	public void deleteOne(int boardNo) {
		ss.delete("kr.co.ilque.board.deleteOne",boardNo);
		
	}

	public void updateOne(BoardDto bdto) {
		ss.update("kr.co.ilque.board.updateOne",bdto);
		
	}

	public void modifyOk(BoardDto bdto) {
		ss.update("kr.co.ilque.board.updateOne",bdto);
		
	}

	

}

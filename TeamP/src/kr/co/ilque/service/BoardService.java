package kr.co.ilque.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.ilque.dao.OracleBoardDAO;
import kr.co.ilque.dto.BoardDto;

@Service("boardService")
public class BoardService implements QuestService {

	@Resource(name = "boardDao")
	OracleBoardDAO dao;

	public void setDao(OracleBoardDAO dao) {
		this.dao = dao;
	}

	public List<BoardDto> leadAll(int startNo, int endNo) {
		return dao.selectAll(startNo, endNo);
	}

	public int getTotal() {
		return dao.getData();
	}

	public Object read(int boardno) {

		return dao.selectOne(boardno);
	}
}

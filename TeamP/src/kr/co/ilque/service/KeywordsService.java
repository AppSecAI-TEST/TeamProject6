package kr.co.ilque.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.ilque.dao.OracleKeywordsDAO;
import kr.co.ilque.dto.KeywordsDto;

@Service("keywordsService")
public class KeywordsService implements QuestService{

	@Resource(name = "keywordsDao")
	OracleKeywordsDAO dao;
	
	public List<KeywordsDto> select10(){
		return dao.showTop10();
	}
	
	public void add(String keyword) {
		dao.insertOne(keyword);
	}
	public List<KeywordsDto> check(String keyword){
		return dao.check(keyword);
	}
	public void update(String keyword) {
		dao.updateOne(keyword);
	}
	
}

package kr.co.ilque.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	//	거래목록에서 글 누르면 상세페이지로 넘어감
	//	bno를 통하여 db에서 글의 상세정보 가져오기
	@RequestMapping(value="/detail")
	public String showDetail() {
		return null;
		//"detail?bno="+bno;
	}
	
	//	작성 버튼 누르면 글 작성 정보를 가지고 글 상세페이지로 넘어감
	@RequestMapping(value="/write",method=RequestMethod.POST)
	public String writeOk() {
		return null;
		//"detail?bno="+bno;
	}
	
	
	//	유저 사진을 클릭하면 유저 상세페이지로 넘어감
	//	유저 id를 가지고 가서 db에서 유저 상세페이지 가져오기
	//	자기 페이지가 아닐 경우 휴대폰번호와 이름은 일정부분 필터링(성**, 0101234****)
	@RequestMapping("/userDetail")
	public String userDetail() {
		return "userDetail";
		//"userDetail?id="+id
	}
	

}
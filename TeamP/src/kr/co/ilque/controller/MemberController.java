package kr.co.ilque.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ilque.dto.MemberDto;
import kr.co.ilque.service.UserService;

//마이페이지에서의 페이지 이동

@Controller
public class MemberController {
	@Resource(name = "userService")
	UserService us;

	public void setUs(UserService us) {
		this.us = us;
	}

	// [수정]버튼 누르면 정보 수정하기
	// id값으로 기존 정보를 불러와서 미리 채워놓고 수정한 값을 db에 update한다
	// 작성 후엔 마이페이지로 다시 이동.@RequestMapping("/modify")
	@RequestMapping("/modifyForm")
	public ModelAndView goModifyForm(HttpSession session) {
		return new ModelAndView();
	}

	@RequestMapping("/modify")
	public String modify(@RequestParam("memberId") String memberId, @RequestParam("memberPwd") String memberPwd,
			@RequestParam("memberName") String memberName, @RequestParam("phone") String phone,
			@RequestParam("gender") String gender, @RequestParam("filePath") String profileSrc,
			@RequestParam("contents") String contents) {

		MemberDto dto = new MemberDto();
		dto.setMemberId(memberId);
		dto.setMemberPwd(memberPwd);
		dto.setMemberName(memberName);
		dto.setProfileSrc(profileSrc);
		dto.setGender(gender);
		dto.setPhone(phone);
		dto.setContents(contents);
		us.updateOne(dto);

		return "redirect:/myPage";

	}

}

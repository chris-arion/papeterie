package kr.co.papeterie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.MemberService;
import kr.co.papeterie.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("member")
	private MemberService service;
	
	@RequestMapping("/member/login")
	public String login() {
		return "/member/login";
	}

	@RequestMapping("/member/login_ok")
	public String login_ok(MemberVO mvo, HttpSession session) {
		return service.login_ok(mvo, session);
	}

	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/main/index";
	}

	@RequestMapping("/member/mypage")
	public String mypage() {
		return "/member/mypage";
	}
	

}

package kr.co.papeterie.service;

import javax.servlet.http.HttpSession;

import kr.co.papeterie.vo.MemberVO;

public interface MemberService {
	public String login_ok(MemberVO mvo, HttpSession session);
	public String userid_search_ok(MemberVO mvo);
	public String pwd_search_ok(MemberVO mvo);
}

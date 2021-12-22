package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.ReviewVO;

public interface MemberService {
	public String login_ok(MemberVO mvo, HttpSession session);
	public String userid_search_ok(MemberVO mvo);
	public String pwd_search_ok(MemberVO mvo);
	public String mywishlist(HttpSession session, Model model);
	public String del_wishlist(HttpServletRequest request);
	public String review_write(HttpServletRequest request, Model model);
	public String review_write_ok(HttpServletRequest request, HttpSession session, ReviewVO rvo) throws Exception;
	public String myorderlist(HttpSession session, Model model);
}

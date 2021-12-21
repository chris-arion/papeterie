package kr.co.papeterie.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.mapper.BasketMapper;
import kr.co.papeterie.mapper.GoodsMapper;
import kr.co.papeterie.mapper.MemberMapper;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.WishlistVO;

@Service
@Qualifier("member")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BasketMapper bmapper;

	@Autowired
	private GoodsMapper gmapper;

	@Override
	public String login_ok(MemberVO mvo, HttpSession session) {
		// TODO Auto-generated method stub
		MemberVO retvo = mapper.login_ok(mvo);
		
		if(retvo == null) // 아디디,비번 잘못입력
		{
			return "/member/login";
		}
		else
		{
			session.setAttribute("userid", retvo.getUserid());
			session.setAttribute("uname", retvo.getUname());
			session.setAttribute("pwd", retvo.getPwd());
			// 로그인 시 장바구니 정보 업데이트
			bmapper.update_userid(retvo.getUserid(), session.getId().toString());
			
			return "redirect:/main/index";
		}

	}

	@Override
	public String userid_search_ok(MemberVO mvo) {
		return mapper.userid_search_ok(mvo);
	}

	@Override
	public String pwd_search_ok(MemberVO mvo) {
		return mapper.pwd_search_ok(mvo);	
	}

	@Override
	public String mywishlist(HttpSession session, Model model) {
		String userid = session.getAttribute("userid").toString();
		ArrayList<WishlistVO> wlist = mapper.mywishlist(userid);
		model.addAttribute("wlist", wlist);
		return "/member/wishlist";
	}

	@Override
	public String del_wishlist(HttpServletRequest request) {
		// 
		int idx = Integer.parseInt(request.getParameter("idx"));
		mapper.del_wishlist(idx);
		return "redirect:/member/wishlist";
	}
	
	@Override
	public String review_write(HttpServletRequest request, Model model) {
		// 
		String pcode = request.getParameter("pcode");
		GoodsVO gvo = gmapper.goods_view(pcode);
		model.addAttribute("gvo", gvo);
		return null;
	}

}

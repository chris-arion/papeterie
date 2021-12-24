package kr.co.papeterie.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.papeterie.mapper.BasketMapper;
import kr.co.papeterie.mapper.GoodsMapper;
import kr.co.papeterie.mapper.MemberMapper;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.MyOrderVO;
import kr.co.papeterie.vo.ReviewVO;
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
		String order_code = request.getParameter("order_code");
//		System.out.println("review_write : order_code = " + order_code);
		GoodsVO gvo = gmapper.goods_view(pcode);
		model.addAttribute("gvo", gvo);
		model.addAttribute("order_code", order_code);
		return null;
	}

	@Override
	public String review_write_ok(HttpServletRequest request, HttpSession session, ReviewVO rvo) throws Exception {
		// 
		ServletContext application = session.getServletContext();
		String path = application.getRealPath("/resources/img/p01/review/");
		int max = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, path, max, "utf-8", new DefaultFileRenamePolicy());

//		System.out.println("pcode = " + multi.getParameter("pcode"));
//		System.out.println("userid = " + multi.getParameter("userid"));
//		System.out.println("score = " + multi.getParameter("score"));
//		System.out.println("content = " + multi.getParameter("content"));
//		System.out.println("filename = " + multi.getFilesystemName("filename"));
//		System.out.println("path = " + path);
		
		rvo.setPcode(multi.getParameter("pcode"));
		rvo.setScore(Integer.parseInt(multi.getParameter("score")));
		rvo.setUserid(multi.getParameter("userid"));
		rvo.setContent(multi.getParameter("content"));
		String filename = multi.getFilesystemName("filename");
		if (filename != null) {
			rvo.setFilename("/resources/img/p01/review/" + multi.getFilesystemName("filename"));
		}
		String order_code = multi.getParameter("order_code");
		rvo.setOrder_code(order_code);
		
		mapper.review_write_ok(rvo);
		
//		System.out.println("order_code = " + order_code);
		bmapper.deliver_ok(order_code);
		return null;
	}

	@Override
	public String myorderlist(HttpSession session, Model model) {
		// 
		String userid = session.getAttribute("userid").toString();
		ArrayList<MyOrderVO> list= mapper.myorderlist(userid);
		model.addAttribute("olist", list);
		return "/member/mypage";
	}

	@Override
	public String signup_ok(MemberVO mvo) {
		
		mapper.signup_ok(mvo);
		return "/member/signup3";
	}

	@Override
	public String userid_check(HttpServletRequest request) {
		
		String userid = request.getParameter("userid");
		String chk = mapper.userid_check(userid);
		return chk;
	}

	@Override
	public String myreviewlist(HttpSession session, Model model) {
		// 
		String userid = session.getAttribute("userid").toString();
		ArrayList<ReviewVO> rlist = mapper.myreviewlist(userid);
		model.addAttribute("rlist", rlist);
		return "/member/myreview";
	}

	@Override
	public String del_review(HttpServletRequest request, HttpSession session) {
		// 
		int idx = Integer.parseInt(request.getParameter("idx"));
		mapper.del_review(idx);
		return "redirect:/member/myreview";
	}

	@Override
	public String member_update(MemberVO mvo, Model model,HttpSession session) {
		
		String userid = session.getAttribute("userid").toString();
		
		model.addAttribute("mvo",mapper.member_update(userid));
		
		return "/member/member_update";
	}

	@Override
	public String member_update_ok(MemberVO mvo) {
		
		mapper.member_update_ok(mvo);
		
		return "redirect:/member/mypage";
	}

	@Override
	public String update_review(HttpServletRequest request, Model model) {
		// 
		int idx = Integer.parseInt(request.getParameter("idx"));
//		System.out.println("idx = " + idx);
		ReviewVO rvo = mapper.getreview(idx);
		model.addAttribute("rvo", rvo);
		return "/review/update";
	}
	
	@Override
	public String review_update_ok(HttpServletRequest request, HttpSession session, ReviewVO rvo) throws Exception {
		ServletContext application = session.getServletContext();
		String path = application.getRealPath("/resources/img/p01/review/");
		int max = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, path, max, "utf-8", new DefaultFileRenamePolicy());

		rvo.setScore(Integer.parseInt(multi.getParameter("score")));
		rvo.setContent(multi.getParameter("content"));
		int idx = Integer.parseInt(multi.getParameter("idx"));
		rvo.setIdx(idx);
		String filename = multi.getFilesystemName("filename");
		if (filename != null) {
			rvo.setFilename("/resources/img/p01/review/" + multi.getFilesystemName("filename"));
			mapper.review_update_ok(rvo);
		}
		else {
			mapper.review_update_ok2(rvo);
		}
		

		return "redirect:/member/myreview";
	}

}

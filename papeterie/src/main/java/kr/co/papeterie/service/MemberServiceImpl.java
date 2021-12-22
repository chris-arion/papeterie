package kr.co.papeterie.service;

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
		GoodsVO gvo = gmapper.goods_view(pcode);
		model.addAttribute("gvo", gvo);
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
		rvo.setFilename("/resources/img/p01/review/" + multi.getFilesystemName("filename"));
		mapper.review_write_ok(rvo);
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

}

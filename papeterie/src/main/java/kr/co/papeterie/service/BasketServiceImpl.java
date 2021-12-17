package kr.co.papeterie.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.mapper.BasketMapper;
import kr.co.papeterie.vo.CartVO;

@Service
@Qualifier("basket")
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketMapper mapper;

	@Override
	public String add_cart(CartVO cvo) {
		// 
		int nRet = mapper.iscount(cvo.getUserid(), cvo.getPcode());
		if (nRet > 0) {
			int count = nRet + cvo.getCount();
			mapper.update_count(count, cvo.getUserid());
			return "update";
		}
		else {
			mapper.add_cart(cvo);
			return "add";
		}
	}

	@Override
	public String cartlist(HttpSession session, Model model) {
		// 
		// 비회원 처리
		String userid = null;
		String cusername = null;
		if (session.getAttribute("userid") == null) {
			userid = session.getId();
			cusername = "손님";
		}
		else {
			userid = session.getAttribute("userid").toString();
			cusername = session.getAttribute("uname").toString() + " 님";
		}
		
		System.out.println("userid = " + userid);
		ArrayList<CartVO> list = mapper.cartlist(userid);
		model.addAttribute("cusername", cusername);
		model.addAttribute("list", list);
		return "/basket/cart";
	}

}

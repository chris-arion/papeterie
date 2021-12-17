package kr.co.papeterie.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.BasketService;
import kr.co.papeterie.vo.CartVO;

@Controller
public class BasketController {

	@Autowired
	@Qualifier("basket")
	private BasketService service;

	@RequestMapping("/basket/cart")
	public String cart(HttpSession session, Model model) {
		return service.cartlist(session, model);
	}

	@RequestMapping("/basket/add_cart")
	public void add_cart(HttpServletRequest request, HttpSession session, CartVO cvo, PrintWriter out) {
		String pcode = request.getParameter("pcode");
		int count = Integer.parseInt(request.getParameter("count"));
		
		// 비회원 처리
		String userid = null;
		if (session.getAttribute("userid") == null) {
			userid = session.getId();
		}
		else {
			userid = session.getAttribute("userid").toString();
		}
		
		System.out.println("userid = " + userid);
		System.out.println("pcode = " + pcode);
		System.out.println("count = " + count);
		cvo.setUserid(userid);
		cvo.setPcode(pcode);
		cvo.setCount(count);
		
		String retString = service.add_cart(cvo);
		
		out.print(retString);
	}

}

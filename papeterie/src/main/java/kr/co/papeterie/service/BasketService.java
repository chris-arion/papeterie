package kr.co.papeterie.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.CartVO;

public interface BasketService {
	public String add_cart(CartVO cvo);
	public String cartlist(HttpSession session, Model model);
}

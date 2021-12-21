package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.CartVO;

public interface BasketService {
	public String add_cart(CartVO cvo);
	public String cartlist(HttpSession session, Model model);
	public void del_cart(HttpServletRequest request);
	public void add_wishlist(HttpServletRequest request, HttpSession session);
}
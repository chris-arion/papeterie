package kr.co.papeterie.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.AddressVO;

public interface GoodsService {
	public String goods_view(String pcode, Model model);
	public String purchase(HttpSession session, Model model);
	public String myjuso(HttpSession session, Model model);
	public String address_add_ok(HttpSession session, AddressVO avo);
}

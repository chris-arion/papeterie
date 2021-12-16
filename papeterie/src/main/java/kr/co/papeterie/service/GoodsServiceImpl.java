package kr.co.papeterie.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.vo.AddressVO;
import kr.co.papeterie.mapper.GoodsMapper;

@Service
@Qualifier("goods")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsMapper mapper;
	
	private final String module = "/goods";
	
	@Override
	public String goods_view(String pcode, Model model)
	{
		model.addAttribute("gvo", mapper.goods_view(pcode));
		return module+"/goods_view";
	}
	
	@Override
	public String purchase(HttpSession session, Model model)
	{
		String userid = session.getAttribute("userid").toString();
		model.addAttribute("mvo", mapper.get_member(userid));
		model.addAttribute("avo", mapper.get_juso(userid));
		/* model.addAttribute("list", mapper.get_basket(userid)); */
		return module+"/purchase";
	}
	
	@Override
	public String myjuso(HttpSession session, Model model)
	{
		String userid = session.getAttribute("userid").toString();
		model.addAttribute("list", mapper.myjuso(userid));
		return module+"/myjuso";
	}
	
	@Override
	public String address_add_ok(HttpSession session, AddressVO avo)
	{
		avo.setUserid(session.getAttribute("userid").toString()); 
		mapper.address_add_ok(avo);
		return "redirect:"+module+"/myjuso";
	}
}

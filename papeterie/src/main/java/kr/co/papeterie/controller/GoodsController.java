package kr.co.papeterie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.GoodsService;
import kr.co.papeterie.vo.AddressVO;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	@Qualifier("goods")
	private GoodsService gservice;
	
	private final String module = "/goods";
	
	@RequestMapping("/goods_view")
	public String goods_view(HttpServletRequest request, Model model)
	{
		String pcode = request.getParameter("pcode");
		return gservice.goods_view(pcode, model);
	}
	
	@RequestMapping("/login_check")
	public String login_check(HttpSession session, HttpServletRequest request)
	{
		if(session.getAttribute("userid") == null)
		{
			return "redirect:../member/login";
		}
		else
		{
			String pcode = request.getParameter("pcode");
			String su = request.getParameter("su");
			return "redirect:"+module+"/purchase?pcode="+pcode+"&su="+su;
		}	
	}
	
	@RequestMapping("/purchase")
	public String purchase(HttpSession session, Model model)
	{
		if(session.getAttribute("userid") == null)
		{
			return "redirect:../member/login";		
		}
		else
		{
			return gservice.purchase(session, model);
		}		
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup()
	{
		return module+"/jusoPopup";
	}
	
	@RequestMapping("/myjuso")
	public String myjuso(HttpSession session, Model model)
	{
		return gservice.myjuso(session, model);
	}
	
	@RequestMapping("/address_add")
	public String address_add()
	{
		return module+"/address_add";
	}
	
	@RequestMapping("/address_add_ok")
	public String address_add_ok(HttpSession session, AddressVO avo)
	{
		return gservice.address_add_ok(session, avo);
	}
}

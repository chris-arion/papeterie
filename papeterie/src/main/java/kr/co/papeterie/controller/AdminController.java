package kr.co.papeterie.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.AdminService;
import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	@Qualifier("as")
	private AdminService aservice;
	
	private final String module="/admin/";
	
	@RequestMapping("manager")
	public String manager(Model model)
	{
		return aservice.manager(model);
	}
	
	@RequestMapping("user")
	public String user(MemberVO mvo,Model model)
	{
		return aservice.user_list(mvo, model);
	}
	
	@RequestMapping("gongji")
	public String gongji(GongjiVO gvo,Model model)
	{
		return aservice.gongji_list(gvo, model);
	}
}

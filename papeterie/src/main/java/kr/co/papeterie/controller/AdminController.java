package kr.co.papeterie.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	@Qualifier("as")
	private AdminService aservice;
	
	private final String module="/admin/";
	
	@RequestMapping("manager")
	public String manager()
	{
		return module+"manager";
	}
}

package kr.co.papeterie.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.papeterie.service.AdminService;
import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.QnaVO;

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
	
	@RequestMapping("qna")
	public String qna(QnaVO qvo,Model model)
	{
		return aservice.qna_list(qvo, model);
	}
	
	@RequestMapping("product")
	public String product(GoodsVO gsvo,Model model)
	{
		return aservice.pro_list(gsvo, model);
	}
	
	@RequestMapping("product_add")
	public String product_add()
	{
		return module+"product_add";
	}
	
	@RequestMapping("product_add_ok")
	public String product_add_ok(GoodsVO gsvo,HttpServletRequest request) throws Exception
	{
		return aservice.product_add_ok(gsvo,request);
	}
	
	@RequestMapping("product_delete")
	public String product_delete(HttpServletRequest request)
	{
		return aservice.product_delete(request);
	}
	
	
}

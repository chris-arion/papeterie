package kr.co.papeterie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	@Qualifier("goods")
	private GoodsService gservice;
	
	private final String module = "/goods";
	
	@RequestMapping("/goods_view")
	public String goods_view()
	{
		return module+"/goods_view";
	}
	
}

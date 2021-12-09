package kr.co.papeterie.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.GongjiService;
import kr.co.papeterie.vo.GongjiVO;

@Controller
@RequestMapping("/gongji")
public class GongjiController {

	@Autowired
	@Qualifier("gs")
	private GongjiService gservice;
	
	private final String module="/gongji/";
	
	
	
	// 공지사항 작성
	@RequestMapping("write")
	public String write()
	{
		return module+"write";
	}
	
	// 공지사항 작성 완료
	@RequestMapping("write_ok")
	public String write_ok(GongjiVO gvo)
	{
		return gservice.write_ok(gvo);
	}
	
	// 공지사항 리스트
	@RequestMapping("list")
	public String list()
	{
		return module+"list";
	}
	
	// 공지사항 콘텐츠
	@RequestMapping("content")
	public String content()
	{
		return module+"content";
	}
}

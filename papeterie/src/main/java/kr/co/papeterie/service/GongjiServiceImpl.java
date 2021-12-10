package kr.co.papeterie.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.mapper.GongjiMapper;
import kr.co.papeterie.vo.GongjiVO;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService{

	@Autowired
	private GongjiMapper mapper;

	private final String module="/gongji/";
	
	@Override
	public String write_ok(GongjiVO gvo) {
		
		mapper.write_ok(gvo);
		
		return "redirect:"+module+"list";
	}

	@Override
	public String list(Model model, HttpSession session) {
		
		model.addAttribute("list", mapper.list());
		model.addAttribute("userid", session.getAttribute("userid"));
		return null;
	}
	
}

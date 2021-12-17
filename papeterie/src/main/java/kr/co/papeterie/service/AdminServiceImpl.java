package kr.co.papeterie.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.mapper.AdminMapper;
import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.MemberVO;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper mapper;
	
	private final String module="/admin/";

	@Override
	public String manager(Model model) {
		
		model.addAttribute("userlist",mapper.userlist());
		model.addAttribute("userpoint",mapper.userpoint());
		model.addAttribute("gongjilist",mapper.gongjilist());
		model.addAttribute("qnalist",mapper.qnalist());
		model.addAttribute("qnalist2",mapper.qnalist2());
		
		return module+"manager";
	}

	@Override
	public String user_list(MemberVO mvo, Model model) {
		model.addAttribute("list",mapper.user_list());
		
		return module+"user";
	}

	@Override
	public String gongji_list(GongjiVO gvo, Model model) {
		
		model.addAttribute("list",mapper.gongji_list());
		
		return module+"gongji";
	}
}

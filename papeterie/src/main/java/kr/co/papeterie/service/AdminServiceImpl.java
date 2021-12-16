package kr.co.papeterie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.mapper.AdminMapper;

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
}

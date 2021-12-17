package kr.co.papeterie.service;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.MemberVO;

public interface AdminService {

	public String manager(Model model);
	
	public String user_list(MemberVO mvo,Model model);
	
	public String gongji_list(GongjiVO gvo,Model model);
	
}

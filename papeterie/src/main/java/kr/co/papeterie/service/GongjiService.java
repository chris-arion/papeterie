package kr.co.papeterie.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.GongjiVO;

public interface GongjiService {

	public String write_ok(GongjiVO gvo);
	
	public String list(Model model, HttpSession session);
}

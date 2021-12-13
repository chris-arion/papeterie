package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.QnaVO;

public interface QnaService {

	public String write_ok(QnaVO qvo,HttpSession session,HttpServletRequest request);
	
	public String list(Model model,HttpSession session);
}

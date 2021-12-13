package kr.co.papeterie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.QnaService;
import kr.co.papeterie.vo.QnaVO;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	@Qualifier("qser")
	private QnaService qservice;
	
	private final String module="/qna/";
	
	@RequestMapping("write")
	public String write()
	{
		return module+"write";
	}
	
	@RequestMapping("write_ok")
	public String write_ok(QnaVO qvo,HttpSession session,HttpServletRequest request)
	{
		return qservice.write_ok(qvo,session,request);
	}
	
	@RequestMapping("list")
	public String list(Model model,HttpSession session)
	{
		return qservice.list(model,session);
	}
	
	@RequestMapping("bimil")
	public String bimil()
	{
		return module+"bimil";
	}
	
}

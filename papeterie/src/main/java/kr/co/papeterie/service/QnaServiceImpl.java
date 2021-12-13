package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.mapper.QnaMapper;
import kr.co.papeterie.vo.QnaVO;

@Service
@Qualifier("qser")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaMapper mapper;
	
	private final String module="/qna/";

	@Override
	public String write_ok(QnaVO qvo,HttpSession session,HttpServletRequest request) {
		qvo.setCategory(Integer.parseInt(request.getParameter("category")));
		qvo.setUserid(session.getAttribute("userid").toString());
		qvo.setName(session.getAttribute("uname").toString());
		qvo.setPwd(session.getAttribute("pwd").toString());
		mapper.write_ok(qvo);
		return "redirect:"+module+"list";
	}

	@Override
	public String list(Model model, HttpSession session) {
		
		model.addAttribute("list",mapper.list());
		model.addAttribute("uname",session.getAttribute("uname"));
		return module+"list";
	}
}

package kr.co.papeterie.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.papeterie.mapper.MemberMapper;
import kr.co.papeterie.vo.MemberVO;

@Service
@Qualifier("member")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public String login_ok(MemberVO mvo, HttpSession session) {
		// TODO Auto-generated method stub
		MemberVO retvo = mapper.login_ok(mvo);
		
		if(retvo == null) // 아디디,비번 잘못입력
		{
			return "/member/login";
		}
		else
		{
			session.setAttribute("userid", retvo.getUserid());
			session.setAttribute("uname", retvo.getUname());
			session.setAttribute("pwd", retvo.getPwd());
			return "redirect:/main/index";
		}

	}

	@Override
	public String userid_search_ok(MemberVO mvo) {
		return mapper.userid_search_ok(mvo);
	}

	@Override
	public String pwd_search_ok(MemberVO mvo) {
		return mapper.pwd_search_ok(mvo);	
	}
}

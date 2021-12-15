package kr.co.papeterie.mapper;

import kr.co.papeterie.vo.MemberVO;

public interface MemberMapper {
	public MemberVO login_ok(MemberVO mvo);
	public String userid_search_ok(MemberVO mvo);
	public String pwd_search_ok(MemberVO mvo);


}

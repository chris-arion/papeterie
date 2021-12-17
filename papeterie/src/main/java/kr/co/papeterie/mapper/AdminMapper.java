package kr.co.papeterie.mapper;

import java.util.ArrayList;

import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.QnaVO;

public interface AdminMapper {

	public String userlist();
	
	public String userpoint();
	
	public String gongjilist();
	
	public String qnalist();
	
	public String qnalist2();
	
	public ArrayList<MemberVO> user_list();
	
	public ArrayList<GongjiVO> gongji_list();
	
	public ArrayList<QnaVO> qna_list();
	
}

package kr.co.papeterie.mapper;

import java.util.ArrayList;

import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.QnaVO;

public interface AdminMapper {

	public String userlist();
	
	public String userpoint();
	
	public String gongjilist();
	
	public String qnalist();
	
	public String qnalist2();
	
	public ArrayList<MemberVO> user_list();
	
	public ArrayList<GongjiVO> gongji_list();
	
	public ArrayList<GongjiVO> gongji_list_limit();
	
	public ArrayList<QnaVO> qna_list();
	
	public ArrayList<QnaVO> qna_list_limit();
	
	public ArrayList<GoodsVO> pro_list();
	
	public void product_add_ok(GoodsVO gsvo);
	
	public void product_delete(String id);
	
	public MemberVO admin_login_ok();
	
	public ArrayList<OrderVO> porder(OrderVO ovo);
	
	public void state_ok(String state,String id);
	
	
}

package kr.co.papeterie.mapper;

import java.util.ArrayList;

import kr.co.papeterie.vo.AddressVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.OrderitemVO;

public interface GoodsMapper {
	public GoodsVO goods_view(String pcode);
	public ArrayList<GoodsVO> get_cartproduct(String userid, String pcodelist);
	public MemberVO get_member(String userid);
	public AddressVO get_juso(String userid);
	public ArrayList<AddressVO> myjuso(String userid);
	public void address_add_ok(AddressVO avo);
	public int address_recent_id(String userid);
	public void address_update(AddressVO avo);
	public int make_order_code(String a);
	public void purchase_ok(OrderVO ovo);	
	public void set_orderitem(OrderitemVO ivo);	
	public OrderVO get_porder(String userid);
	public ArrayList<GoodsVO> get_product(String order_code);
}

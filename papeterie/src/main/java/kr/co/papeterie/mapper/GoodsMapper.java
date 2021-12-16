package kr.co.papeterie.mapper;

import java.util.ArrayList;

import kr.co.papeterie.vo.AddressVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;

public interface GoodsMapper {
	public GoodsVO goods_view(String pcode);
	public MemberVO get_member(String userid);
	public AddressVO get_juso(String userid);
	public ArrayList<AddressVO> myjuso(String userid);
	public void address_add_ok(AddressVO avo);
}

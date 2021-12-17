package kr.co.papeterie.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.papeterie.vo.CartVO;

public interface BasketMapper {
	public void add_cart(CartVO cvo);
	public int iscount(@Param("_userid") String userid, @Param("_pcode") String pcode);
	public void update_count(@Param("_count") int count, @Param("_userid") String userid);
	public ArrayList<CartVO> cartlist(@Param("_userid") String userid);
}

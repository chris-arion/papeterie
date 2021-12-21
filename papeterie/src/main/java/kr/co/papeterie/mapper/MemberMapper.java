package kr.co.papeterie.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.WishlistVO;

public interface MemberMapper {
	public MemberVO login_ok(MemberVO mvo);
	public String userid_search_ok(MemberVO mvo);
	public String pwd_search_ok(MemberVO mvo);
	public ArrayList<WishlistVO> mywishlist(@Param("_userid") String userid);
	public void del_wishlist(@Param("_idx") int idx);

}

package kr.co.papeterie.mapper;

import java.util.ArrayList;

import kr.co.papeterie.vo.GongjiVO;

public interface GongjiMapper {

	public void write_ok(GongjiVO gvo);
	
	public ArrayList<GongjiVO> list(); 
}

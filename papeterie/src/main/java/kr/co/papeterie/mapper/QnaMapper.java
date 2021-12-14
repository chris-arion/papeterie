package kr.co.papeterie.mapper;

import java.util.ArrayList;

import kr.co.papeterie.vo.QnaVO;

public interface QnaMapper {

	public void write_ok(QnaVO qvo);
	
	public ArrayList<QnaVO> list();
	
}

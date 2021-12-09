package kr.co.papeterie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.papeterie.mapper.GongjiMapper;
import kr.co.papeterie.vo.GongjiVO;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService{

	@Autowired
	private GongjiMapper mapper;

	private final String module="/gongji/";
	
	@Override
	public String write_ok(GongjiVO gvo) {
		
		mapper.write_ok(gvo);
		
		return "redirect:"+module+"list";
	}
	
}

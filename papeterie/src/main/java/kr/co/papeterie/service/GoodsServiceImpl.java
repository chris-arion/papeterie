package kr.co.papeterie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.papeterie.mapper.GoodsMapper;

@Service
@Qualifier("goods")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsMapper mapper;
}

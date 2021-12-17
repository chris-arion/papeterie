package kr.co.papeterie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.papeterie.mapper.BasketMapper;
import kr.co.papeterie.vo.CartVO;

@Service
@Qualifier("basket")
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketMapper mapper;

	@Override
	public String add_cart(CartVO cvo) {
		// 
		mapper.add_cart(cvo);
		return "true";
	}

}

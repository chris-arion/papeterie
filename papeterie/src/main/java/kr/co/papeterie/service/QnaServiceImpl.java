package kr.co.papeterie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.papeterie.mapper.QnaMapper;

@Service
@Qualifier("qs")
public class QnaServiceImpl {

	@Autowired
	private QnaMapper mapper;
	
	private final String module="/custom/";
}

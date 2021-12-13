package kr.co.papeterie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	@Qualifier("qser")
	private QnaService qservice;
	
	private final String module="/custom/";
}

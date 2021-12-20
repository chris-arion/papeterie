package kr.co.papeterie.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.vo.AddressVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.mapper.GoodsMapper;

@Service
@Qualifier("goods")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsMapper mapper;
	
	private final String module = "/goods";
	
	@Override
	public String goods_view(String pcode, Model model)
	{
		model.addAttribute("gvo", mapper.goods_view(pcode));
		return module+"/goods_view";
	}
	
	@Override
	public String purchase(HttpSession session, Model model, HttpServletRequest request)
	{
		String userid = session.getAttribute("userid").toString();
		model.addAttribute("mvo", mapper.get_member(userid));
		model.addAttribute("avo", mapper.get_juso(userid));
		if(request.getParameter("pcode") != null) //바로 구매로 넘어오는 경우
		{
			model.addAttribute("pvo", mapper.goods_view(request.getParameter("pcode")));
			model.addAttribute("count", request.getParameter("count"));
		}
		else // 장바구니에서 오는 경우
		{
			//model.addAttribute("list", mapper.get_basket(userid));
		}	
		return module+"/purchase";
	}
	
	@Override
	public String myjuso(HttpSession session, Model model)
	{
		String userid = session.getAttribute("userid").toString();
		model.addAttribute("list", mapper.myjuso(userid));
		return module+"/myjuso";
	}
	
	@Override
	public String address_add_ok(HttpSession session, AddressVO avo)
	{
		avo.setUserid(session.getAttribute("userid").toString()); 
		mapper.address_add_ok(avo);
		return "redirect:"+module+"/myjuso";
	}
	
	@Override
	public String purchase_ok(HttpServletRequest request, HttpSession session, AddressVO avo, OrderVO ovo)
	{
		String userid = session.getAttribute("userid").toString();
		avo.setUserid(userid);
		int addr_id = Integer.parseInt(request.getParameter("bidx"));
		// 신규배송지 일경우 추가후 배송 아이디 가져오기
		if(request.getParameter("shipping_loc").equals("0"))
		{
			avo.setSdefault(0);
			mapper.address_add_ok(avo);
			addr_id = mapper.address_recent_id(userid);
		}
		else// 기존 주소일경우 업데이트
		{
			avo.setIdx(addr_id);
			mapper.address_update(avo);
		}
		// 주문번호 생성하기
		LocalDate today = LocalDate.now();
		String a = today.toString();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String number_f = today.format(formatter);
		
		int num = mapper.make_order_code(a)+1;
		String number_b = String.format("%04d", num);
		
		String order_code = number_f+number_b;
		
		// 주문 테이블에 데이터 입력
		ovo.setOrder_code(order_code);
		ovo.setUserid(userid);
		ovo.setAddr_id(addr_id);
		ovo.setPhone(request.getParameter("pphone"));
		mapper.purchase_ok(ovo);
		
		return "redirect:"+module+"/purchase_finish";
	}
	
	@Override
	public String purchase_finish(HttpSession session, Model model)
	{
		String userid = session.getAttribute("userid").toString();
		// 주문
		return module+"/purchase_finish";
	}
	
}

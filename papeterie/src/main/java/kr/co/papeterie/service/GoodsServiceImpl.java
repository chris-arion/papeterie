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
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.OrderitemVO;
import kr.co.papeterie.mapper.BasketMapper;
import kr.co.papeterie.mapper.GoodsMapper;

@Service
@Qualifier("goods")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsMapper mapper;
	
	@Autowired
	private BasketMapper bmapper;
	
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
			GoodsVO pvo = new GoodsVO();
			pvo = mapper.goods_view(request.getParameter("pcode"));
			pvo.setCount(Integer.parseInt(request.getParameter("count")));
			model.addAttribute("pvo", pvo);
		}
		else 
		{
			String[] chkarray = request.getParameter("idxlist").split(",");
			String pcodelist = "";
			for (int i = 0; i < chkarray.length; i++) {
				String pcode = bmapper.getpcode(Integer.parseInt(chkarray[i]));
				if(pcodelist == "")
				{
					pcodelist = "'"+pcode+"'";
				}
				else
				{
					pcodelist = pcodelist+",'"+pcode+"'";
				}
			}
			model.addAttribute("list", mapper.get_cartproduct(userid, pcodelist));
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
		
		// 주문 테이블에 주문번호, 내용 데이터 입력
		ovo.setOrder_code(order_code);
		ovo.setUserid(userid);
		ovo.setAddr_id(addr_id);
		ovo.setPhone(request.getParameter("pphone"));
		mapper.purchase_ok(ovo);
		
		// 주문상품 테이블에 주문번호, 상품, 수량 입력
		String[] pcodesplit = request.getParameterValues("pcode");
		String[] countsplit = request.getParameterValues("count");
		OrderitemVO ivo = new OrderitemVO();
		ivo.setOrder_code(order_code);
		for(int i=0; i<pcodesplit.length; i++)
		{
			ivo.setPcode(pcodesplit[i]);
			ivo.setCount(Integer.parseInt(countsplit[i]));
			mapper.set_orderitem(ivo);
		}
		
		return "redirect:"+module+"/purchase_finish";
	}
	
	@Override
	public String purchase_finish(HttpSession session, Model model)
	{
		String userid = session.getAttribute("userid").toString();
		// 주문정보 가져오기
		OrderVO ovo = new OrderVO();
		ovo = mapper.get_porder(userid);
		String order_code = ovo.getOrder_code();
		System.out.println(order_code);
		
		// 주문상품 가져오기
		model.addAttribute("list", mapper.get_product(order_code));
		model.addAttribute("ovo", ovo);
		
		return module+"/purchase_finish";
	}
	
}

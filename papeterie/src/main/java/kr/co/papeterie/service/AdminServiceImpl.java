package kr.co.papeterie.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.papeterie.mapper.AdminMapper;
import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.QnaVO;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper mapper;
	
	private final String module="/admin/";

	@Override
	public String manager(Model model) {
		
		model.addAttribute("userlist",mapper.userlist());
		model.addAttribute("userpoint",mapper.userpoint());
		model.addAttribute("gongjilist",mapper.gongjilist());
		model.addAttribute("qnalist",mapper.qnalist());
		model.addAttribute("qnalist2",mapper.qnalist2());
		model.addAttribute("gongji_list",mapper.gongji_list_limit());
		model.addAttribute("qna_list",mapper.qna_list_limit());
		
		return module+"manager";
	}

	@Override
	public String user_list(MemberVO mvo, Model model) {
		model.addAttribute("list",mapper.user_list());
		
		return module+"user";
	}

	@Override
	public String gongji_list(GongjiVO gvo, Model model) {
		
		model.addAttribute("list",mapper.gongji_list());
		
		return module+"gongji";
	}
	
	@Override
	public String qna_list(QnaVO qvo, Model model) {
		
		model.addAttribute("list",mapper.qna_list());
		
		return module+"qna";
	}
	
	@Override
	public String pro_list(GoodsVO gsvo,Model model) {
		
		model.addAttribute("list",mapper.pro_list());
		
		return module+"product";
	}

	@Override
	public String product_add_ok(GoodsVO gsvo,HttpServletRequest request) throws Exception {
		
		String path = request.getRealPath("/resources/img/p01/main/");
		int max = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, path, max, "utf-8", new DefaultFileRenamePolicy());
		
		
		String pcode1 = multi.getParameter("pcode1");
		String pcode2 = multi.getParameter("pcode2");
		String pcode = pcode1 + pcode2;
		
		
		
		
		gsvo.setTitle(multi.getParameter("title"));
		gsvo.setPrice(Integer.parseInt(multi.getParameter("price")));
		gsvo.setCategory(multi.getParameter("category"));
		gsvo.setImg("/resources/img/p01/main/"+multi.getFilesystemName("img"));
		gsvo.setPcode(pcode);
		
		
		
		mapper.product_add_ok(gsvo);
		
		
		return "redirect:"+module+"product";
	}

	@Override
	public String product_delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		mapper.product_delete(id);
		
		return "redirect:"+module+"product";
	}
	
}

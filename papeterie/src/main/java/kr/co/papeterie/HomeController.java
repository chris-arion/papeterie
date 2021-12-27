package kr.co.papeterie;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.papeterie.mapper.GoodsMapper;
import kr.co.papeterie.vo.GoodsVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/main/index";
	}
	
	@Autowired
	private GoodsMapper mapper;

	@RequestMapping("/main/index")
	public String index(Model model) {
		ArrayList<GoodsVO> glist = mapper.all_goods();
		model.addAttribute("glist", glist);
		return "/main/index";
	}
	
	@RequestMapping("/admin")
	public String admin()
	{
		return "/admin/admin_login";
	}
	
	@RequestMapping("/ect/tos")
	public String tos()
	{
		return "/ect/tos";
	}
	

}

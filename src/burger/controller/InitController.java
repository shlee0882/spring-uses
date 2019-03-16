package burger.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import burger.service.BurgerService;
import burger.vo.AdminVO;
import burger.vo.AuthInfo;
import burger.vo.BurgerVO;
import burger.vo.DivisionVO;

@Controller
public class InitController {

	@Autowired
	BurgerService burgerService;

	private static final Logger logger = LoggerFactory.getLogger(InitController.class);

	@RequestMapping("/")
	public String getDivision(Model model) {

		List<DivisionVO> divisionList = burgerService.getDivisionList();
		System.out.println(divisionList);
		List<DivisionVO> brandList = new ArrayList<>();
		List<DivisionVO> menuList = new ArrayList<>();
		List<DivisionVO> priceList = new ArrayList<>();
		List<DivisionVO> caloryList = new ArrayList<>();
		for (DivisionVO divisionVO : divisionList) {
			if ("brand".equals(divisionVO.getItem())) {
				brandList.add(divisionVO);
			} else if ("menu".equals(divisionVO.getItem())) {
				menuList.add(divisionVO);
			} else if ("price".equals(divisionVO.getItem())) {
				priceList.add(divisionVO);
			} else if ("calory".equals(divisionVO.getItem())) {
				caloryList.add(divisionVO);
			}
		}
		model.addAttribute("brandList", brandList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("priceList", priceList);
		model.addAttribute("caloryList", caloryList);
		return "index";
	}

	// @RequestMapping("login")
	// public String getLoginForm(Model model) {
	// return "loginForm.jsp";
	// }

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView loginForm(AdminVO adminVo,
			@CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie) throws Exception {

		ModelAndView mv = new ModelAndView();
		if (rememberCookie != null) {
			adminVo.setId(rememberCookie.getValue());
			adminVo.setRememberId(true);
		}else {
			mv = new ModelAndView("loginForm","adminVo",adminVo);
		}

		return mv;
	}

	@RequestMapping(value = "loginRequest", method = RequestMethod.POST)
	public ModelAndView loginSuccess(@RequestParam Map<String, Object> dataMap, HttpSession session, HttpServletResponse response)
			throws Exception {

		try {
			AuthInfo authInfo = burgerService.loginRequest(dataMap);
			System.out.println(authInfo);
			session.setAttribute("authInfo", authInfo);
			String id = (String) authInfo.getId();
			Cookie rememberCookie = new Cookie("REMEMBER", id );
			rememberCookie.setPath("/");
			// ºê¶ó¿ìÀú ²ô¸é ÄíÅ° »ç¶óÁü
			rememberCookie.setMaxAge(-1);
			response.addCookie(rememberCookie);

		} catch (Exception e) {
			ModelAndView mv = new ModelAndView("loginForm");
			return mv;
		}
		ModelAndView mv = new ModelAndView("adminPage");
		return mv;
	}

	@RequestMapping("registPage")
	public String getRegistPage(Model model) {
		return "registPage";
	}

	// @RequestMapping(value="loginRequest", method=RequestMethod.POST)
	// public String getLoginRequest(@RequestParam Map<String, Object> dataMap,
	// Model model) throws Exception {
	// AdminVO result = burgerService.getLoginRequest(dataMap);
	//
	// List<BurgerVO> allBurgerList = burgerService.getAllBurgerList();
	// model.addAttribute("allBurgerList", allBurgerList);
	// model.addAttribute("result", result);
	//
	// return "adminPage.jsp";
	// }

	@RequestMapping("getBurgerList")
	public String getUserList(Model model) {
		List<BurgerVO> allBurgerList = burgerService.getAllBurgerList();
		model.addAttribute("allBurgerList", allBurgerList);
		return "adminPage";
	}

	@RequestMapping(value = "updateBurger", method = RequestMethod.POST)
	@ResponseBody
	public BurgerVO updateBurger(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
		BurgerVO result = burgerService.updateBurger(dataMap);
		model.addAttribute("result", result);
		return result;
	}

	@RequestMapping(value = "insertBurger", method = RequestMethod.POST)
	public String insertBurger(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
		BurgerVO result = burgerService.insertBurger(dataMap);
		model.addAttribute("result", result);
		return "adminPage";
	}

}

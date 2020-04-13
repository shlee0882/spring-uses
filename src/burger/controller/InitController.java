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
import burger.vo.DisplayVO;
import burger.vo.DivisionVO;

@Controller
public class InitController {

	@Autowired
	BurgerService burgerService;

	private static final Logger logger = LoggerFactory.getLogger(InitController.class);

	@RequestMapping("/")
	public String getDivision(AdminVO adminVo, @CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie,
			HttpSession session, HttpServletResponse response, Model model) {
		AuthInfo authInfo = new AuthInfo();
		
		List<DisplayVO> displayList = burgerService.getDisplayList();
		List<DivisionVO> divisionList = burgerService.getDivisionList();
		
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
		if (rememberCookie != null) {
			adminVo.setId(rememberCookie.getValue());
			adminVo.setRememberId(true);
		} else {
		}
		if (session.getAttribute("authInfo") != null) {
			authInfo = (AuthInfo) session.getAttribute("authInfo");
		}
		model.addAttribute("adminVo", authInfo);
		// model.addAttribute("adminVo", adminVo);
		model.addAttribute("brandList", brandList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("priceList", priceList);
		model.addAttribute("caloryList", caloryList);
		model.addAttribute("displayList", displayList);
		return "index";
	}

	@RequestMapping("logOut")
	public String logOut(AdminVO adminVo, @CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie,
			HttpSession session, HttpServletResponse response, Model model) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView loginForm(AdminVO adminVo,
			@CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie) throws Exception {

		ModelAndView mv = new ModelAndView();
		if (rememberCookie != null) {
			adminVo.setId(rememberCookie.getValue());
			adminVo.setRememberId(true);
		} else {
		}
		mv = new ModelAndView("view/admin/loginForm", "adminVo", adminVo);

		return mv;
	}
	
	@RequestMapping(value = "loginRequest", method = RequestMethod.POST)
	public ModelAndView loginSuccess(@RequestParam Map<String, Object> dataMap, HttpSession session,
			HttpServletResponse response) throws Exception {

		try {
			AuthInfo authInfo = burgerService.loginRequest(dataMap);
			System.out.println(authInfo);
			session.setAttribute("authInfo", authInfo);
			String id = (String) authInfo.getId();
			Cookie rememberCookie = new Cookie("REMEMBER", id);
			rememberCookie.setPath("/");
			if ("on".equals(dataMap.get("rememberMe")) && dataMap.get("rememberMe") != null) {
				rememberCookie.setMaxAge(24*60*60);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);

		} catch (Exception e) {
			ModelAndView mv = new ModelAndView("view/admin/loginForm");
			return mv;
		}
		ModelAndView mv = new ModelAndView("redirect:/getBurgerList");
		return mv;
	}

	@RequestMapping("registPage")
	public String getRegistPage(Model model) {
		return "view/admin/registPage";
	}
	
	@RequestMapping("registDisplayPage")
	public String registDisplayPage(Model model) {
		return "view/admin/registDisplayPage";
	}

	@RequestMapping("getDisplayList")
	public String getDisplayList(HttpSession session, HttpServletResponse response, Model model) {
		
		if (session.getAttribute("authInfo") != null) {
			List<DisplayVO> allDisplayList = burgerService.getAllDisplayList();
			model.addAttribute("allDisplayList", allDisplayList);
			return "view/admin/adminDisplayList";
		}else {
			return "redirect:/login";
		}
		
	}
	


	@RequestMapping("getBurgerList")
	public String getUserList(HttpSession session, HttpServletResponse response, Model model) {
		
		if (session.getAttribute("authInfo") != null) {
			List<BurgerVO> allBurgerList = burgerService.getAllBurgerList();
			model.addAttribute("allBurgerList", allBurgerList);
			return "view/admin/adminPage";
		}else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "updateBurger", method = RequestMethod.POST)
	@ResponseBody
	public BurgerVO updateBurger(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
		BurgerVO result = burgerService.updateBurger(dataMap);
		model.addAttribute("result", result);
		return result;
	}

	@RequestMapping(value = "updateDisplay", method = RequestMethod.POST)
	@ResponseBody
	public DisplayVO updateDisplay(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
		DisplayVO result = burgerService.updateDisplay(dataMap);
		model.addAttribute("result", result);
		return result;
	}

	@RequestMapping(value = "insertBurger", method = RequestMethod.POST)
	public String insertBurger(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
		BurgerVO result = burgerService.insertBurger(dataMap);
		model.addAttribute("result", result);
		return "view/admin/adminPage";
	}

	@RequestMapping(value = "insertDisplay", method = RequestMethod.POST)
	public String insertDisplay(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
		DisplayVO result = burgerService.insertDisplay(dataMap);
		model.addAttribute("result", result);
		return "registDisplayPage";
	}

}

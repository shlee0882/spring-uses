package burger.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import burger.service.BurgerService;
import burger.vo.AdminVO;
import burger.vo.BurgerVO;
import burger.vo.DivisionVO;

@Controller
public class InitController {
	
	@Autowired
	BurgerService burgerService;

	@RequestMapping("/")
	public String getDivision(Model model) {
		
		List<DivisionVO> divisionList = burgerService.getDivisionList();
		System.out.println(divisionList);
		List<DivisionVO> brandList = new ArrayList<>();
		List<DivisionVO> menuList = new ArrayList<>();
		List<DivisionVO> priceList = new ArrayList<>();
		List<DivisionVO> caloryList = new ArrayList<>();
		for (DivisionVO divisionVO : divisionList) {
			if("brand".equals(divisionVO.getItem())) {
				brandList.add(divisionVO);
			}else if("menu".equals(divisionVO.getItem())) {
				menuList.add(divisionVO);
			}else if("price".equals(divisionVO.getItem())) {
				priceList.add(divisionVO);
			}else if("calory".equals(divisionVO.getItem())) {
				caloryList.add(divisionVO);
			}
		}
		model.addAttribute("brandList", brandList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("priceList", priceList);
		model.addAttribute("caloryList", caloryList);
		return "index.jsp";
	}

	@RequestMapping("login")
	public String getLoginForm(Model model) {
		return "loginForm.jsp";
	}
	
	@RequestMapping(value="loginRequest", method=RequestMethod.POST)
	public String getLoginRequest(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
		AdminVO result = burgerService.getLoginRequest(dataMap);
		
		List<BurgerVO> allBurgerList = burgerService.getAllBurgerList();
		model.addAttribute("allBurgerList", allBurgerList);
		model.addAttribute("result", result);
		
		return "adminPage.jsp";
	}
	
	
	@RequestMapping("getBurgerList")
	public String getUserList(Model model) {
		List<BurgerVO> allBurgerList = burgerService.getAllBurgerList();
		model.addAttribute("allBurgerList", allBurgerList);
		return "adminPage.jsp";
	}
	
	@RequestMapping(value="updateBurger", method=RequestMethod.POST)
	@ResponseBody
	public BurgerVO updateBurger(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
		BurgerVO result =  burgerService.updateBurger(dataMap);
		model.addAttribute("result", result);
		return result;
	}

	@RequestMapping(value="insertBurger", method=RequestMethod.POST)
	@ResponseBody
	public BurgerVO insertBurger(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
//		BurgerVO result =  burgerService.insertBurger(dataMap);
//		model.addAttribute("result", result);
		System.out.println("123");
		return null;
	}
	
}

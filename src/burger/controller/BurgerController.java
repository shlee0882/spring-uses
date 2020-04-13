package burger.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import burger.service.BurgerService;
import burger.vo.AdminVO;
import burger.vo.BurgerJsonVO;
import burger.vo.BurgerVO;

@RestController
@RequestMapping("/burgers")
public class BurgerController {
	
	@Autowired
	BurgerService burgerService;
	
	@RequestMapping(method=RequestMethod.GET)
	public List<BurgerJsonVO> getJsonBurgerList() {
		List<BurgerJsonVO> burgerList = burgerService.getJsonAllBurgerList();
	    return burgerList;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	@ResponseBody
	public List<BurgerVO> getBurgerList(@RequestBody Map<String, Object> dataMap) {
		List<BurgerVO> burgerList = burgerService.getBurgerList(dataMap);
		return burgerList;
	}

	@RequestMapping(value="/totalCount", method=RequestMethod.POST)
	@ResponseBody
	public BurgerVO getBurgerTotalCount(@RequestBody Map<String, Object> dataMap) {
		BurgerVO totalCount = burgerService.getBurgerTotalCount(dataMap);
		return totalCount;
	}
	
	@RequestMapping(value="/loginRequest", method=RequestMethod.POST)
	@ResponseBody
	public AdminVO getLoginRequest(@RequestBody Map<String, Object> dataMap, Model model) throws Exception {
		AdminVO result = burgerService.getLoginRequest(dataMap);
		return result;
	}
	
	
}

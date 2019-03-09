package burger.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import burger.service.BurgerService;
import burger.vo.BurgerVO;

@RestController
@RequestMapping("/burgers")
public class BurgerController {
	
	@Autowired
	BurgerService burgerService;
	
	@RequestMapping(method=RequestMethod.POST)
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
}

package burger.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public List<BurgerVO> getBurgerList() {
		List<BurgerVO> burgerList = burgerService.getBurgerList();
		return burgerList;
	}
}

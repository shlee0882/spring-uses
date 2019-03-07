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
@RequestMapping("/init")
public class InitController {
	
	@Autowired
	BurgerService burgerService;
	
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	
	// 테이블 division 컬럼 no(primary key autoincrement), item, contents 
	// brand		
	// category 
	// price
	// calory
	
	// 브랜드
	// 맥도날드
	// 롯데리아
	// 버거킹
	// 맘스터치
	
	// 메뉴
	// 햄버거, 치킨, 사이드
	
	// 가격
	// 0 ~ 3000
	// 3000 ~ 5000
	// 5000 ~ 7000
	// 7000 ~ 9000
	// 11000 ~ 
	
	// 칼로리
	// 0 to less than 300
	// 300 to less than 500
	// 500 to less than 700
	// 700 to less than 900
	// 900 to less than 1100
	// 1100 or more
	
	public List<BurgerVO> getBurgerList() {
		
		List<BurgerVO> burgerList = burgerService.getBurgerList();
		return burgerList;
	}
}

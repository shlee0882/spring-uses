package test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import burger.service.BurgerService;
import burger.vo.BurgerVO;
import burger.vo.DivisionVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/beans.xml")
public class MyBatisTest {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	BurgerService burgerService;
	
	@Test @Ignore
	public void getMenu() {
		BurgerVO burger = burgerService.getBurger("");
		System.out.println(burger);
	}
	
	@Test @Ignore
	public void getMenuList() {
//		List<BurgerVO> burgerList = burgerService.getBurgerList();
//		System.out.println(burgerList);
	}
	
	@Test
	public void getDivisionList() {
		List<DivisionVO> divisionList = burgerService.getDivisionList();
		System.out.println(divisionList);
	}
	
}

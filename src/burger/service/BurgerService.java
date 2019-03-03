package burger.service;

import java.util.List;

import burger.vo.BurgerVO;

public interface BurgerService {

	public BurgerVO getBurger(String menuName);

	public List<BurgerVO> getBurgerList();
}

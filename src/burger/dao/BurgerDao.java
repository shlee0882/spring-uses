package burger.dao;

import java.util.List;

import burger.vo.BurgerVO;

public interface BurgerDao {
	public BurgerVO getBurger(String menuName);

	public List<BurgerVO> getBurgerList();
}

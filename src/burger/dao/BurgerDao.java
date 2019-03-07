package burger.dao;

import java.util.List;

import burger.vo.BurgerVO;
import burger.vo.DivisionVO;

public interface BurgerDao {
	public BurgerVO getBurger(String menuName);

	public List<BurgerVO> getBurgerList();

	public List<DivisionVO> getDivisionList();
}

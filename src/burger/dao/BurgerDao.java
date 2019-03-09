package burger.dao;

import java.util.List;
import java.util.Map;

import burger.vo.BurgerVO;
import burger.vo.DivisionVO;

public interface BurgerDao {
	public BurgerVO getBurger(String menuName);

	public List<BurgerVO> getBurgerList(Map<String, Object> dataMap);

	public List<DivisionVO> getDivisionList();
}

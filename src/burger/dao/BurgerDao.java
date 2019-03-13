package burger.dao;

import java.util.List;
import java.util.Map;

import burger.vo.AdminVO;
import burger.vo.BurgerVO;
import burger.vo.DivisionVO;

public interface BurgerDao {
	public BurgerVO getBurger(String menuName);

	public List<BurgerVO> getBurgerList(Map<String, Object> dataMap);

	public List<DivisionVO> getDivisionList();

	public BurgerVO getBurgerTotalCount(Map<String, Object> dataMap);

	public AdminVO getLoginRequest(Map<String, Object> dataMap) throws Exception;

	public List<BurgerVO> getAllBurgerList();

	public BurgerVO updateBurger(Map<String, Object> dataMap);

	public BurgerVO insertBurger(Map<String, Object> dataMap);
}

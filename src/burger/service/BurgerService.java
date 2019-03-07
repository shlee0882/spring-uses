package burger.service;

import java.util.List;

import burger.vo.BurgerVO;
import burger.vo.DivisionVO;

public interface BurgerService {

	public BurgerVO getBurger(String menuName);

	public List<BurgerVO> getBurgerList();

	public List<DivisionVO> getDivisionList();
}

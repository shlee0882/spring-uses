package burger.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import burger.vo.AdminVO;
import burger.vo.AuthInfo;
import burger.vo.BurgerVO;
import burger.vo.DisplayVO;
import burger.vo.DivisionVO;

public interface BurgerService {

	public BurgerVO getBurger(String menuName);

	public List<BurgerVO> getBurgerList(Map<String, Object> dataMap);

	public List<DivisionVO> getDivisionList();

	public BurgerVO getBurgerTotalCount(Map<String, Object> dataMap);

	public AdminVO getLoginRequest(Map<String, Object> dataMap) throws Exception;

	public List<BurgerVO> getAllBurgerList();

	public BurgerVO updateBurger(Map<String, Object> dataMap);

	public BurgerVO insertBurger(Map<String, Object> dataMap);

	public AuthInfo loginRequest(Map<String, Object> dataMap);

	public List<DisplayVO> getDisplayList();


}

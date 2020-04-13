package burger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import burger.vo.AdminVO;
import burger.vo.AuthInfo;
import burger.vo.BurgerJsonVO;
import burger.vo.BurgerVO;
import burger.vo.DisplayVO;
import burger.vo.DivisionVO;

@Repository("burgerDao")
public class BurgerDaoImpl implements BurgerDao {

	@Autowired
    private SqlSession session;
	
	@Override
	public BurgerVO getBurger(String menuName) {
		BurgerVO burger = session.selectOne("burgerNS.selectBurger",menuName);
		return burger;
	}

	@Override
	public List<BurgerVO> getBurgerList(Map<String, Object> dataMap) {
		List<BurgerVO> burgerList = session.selectList("burgerNS.selectBurgerList", dataMap);
		return burgerList;
	}
	
	@Override
	public List<DivisionVO> getDivisionList() {
		List<DivisionVO> divisionList = session.selectList("burgerNS.selectDivisionList");
		return divisionList;
	}

	@Override
	public BurgerVO getBurgerTotalCount(Map<String, Object> dataMap) {
		BurgerVO getBurgerTotalCount = session.selectOne("burgerNS.selectBurgerTotalCount", dataMap);
		return getBurgerTotalCount;
	}

	@Override
	public AdminVO getLoginRequest(Map<String, Object> dataMap) throws Exception {
		AdminVO getLoginRequest = session.selectOne("burgerNS.selectLoginRequest", dataMap);
		if(getLoginRequest == null) {
			throw new Exception("");
		}
		if(!"Y".equals(getLoginRequest.getUse_active())) {
			throw new Exception("");
		}
		return getLoginRequest;
	}

	@Override
	public List<BurgerVO> getAllBurgerList() {
		List<BurgerVO> allBurgerList = session.selectList("burgerNS.selectAllBurgerList");
		return allBurgerList;
	}

	@Override
	public BurgerVO updateBurger(Map<String, Object> dataMap) {
		BurgerVO burgerVO = new BurgerVO();
		int result = session.update("burgerNS.updateBurger",dataMap);
		System.out.println(" : "+result);
		return burgerVO;
		
	}

	@Override
	public BurgerVO insertBurger(Map<String, Object> dataMap) {
		BurgerVO burgerVO = new BurgerVO();
		int result = session.insert("burgerNS.insertBurger", dataMap);
		System.out.println(" : "+result);
		return burgerVO;
		
	}

	@Override
	public AuthInfo loginRequest(Map<String, Object> dataMap) {
		AuthInfo getLoginRequest = session.selectOne("burgerNS.loginRequest", dataMap);
		return getLoginRequest;
	}

	@Override
	public List<DisplayVO> getDisplayList() {
		// TODO Auto-generated method stub
		List<DisplayVO>  displayList = session.selectList("burgerNS.getDisplayList");
		return displayList;
	}

	@Override
	public List<DisplayVO> getAllDisplayList() {
		List<DisplayVO>  allDisplayList = session.selectList("burgerNS.getAllDisplayList");
		return allDisplayList;
	}

	@Override
	public DisplayVO updateDisplay(Map<String, Object> dataMap) {
		DisplayVO displayVO = new DisplayVO();
		int result = session.update("burgerNS.updateDisplay",dataMap);
		System.out.println(" : "+result);
		return displayVO;
	}

	@Override
	public DisplayVO insertDisplay(Map<String, Object> dataMap) {
		DisplayVO displayVO = new DisplayVO();
		int result = session.insert("burgerNS.insertDisplay", dataMap);
		System.out.println(" : "+result);
		return displayVO;
	}

	@Override
	public List<BurgerJsonVO> getJsonAllBurgerList() {
		List<BurgerJsonVO> allBurgerList = session.selectList("burgerNS.selectJsonAllBurgerList");
		return allBurgerList;
	}






	
}

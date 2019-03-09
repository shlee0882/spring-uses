package burger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import burger.vo.BurgerVO;
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


	
}

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
		String prStartVal ="";
		String prEndVal ="";
		String calStartVal ="";
		String calEndVal ="";
		
		if(!"".equals(dataMap.get("priceSelect"))) {
			String priceDivide = (String) dataMap.get("priceSelect");
			prStartVal = priceDivide.substring(0, priceDivide.indexOf("~"));
			prEndVal= priceDivide.substring(priceDivide.indexOf("~")+1);
		}

		if(!"".equals(dataMap.get("calorySelect"))) {
			String caloryDivide = (String) dataMap.get("calorySelect");
			calStartVal = caloryDivide.substring(0, caloryDivide.indexOf("~"));
			calEndVal= caloryDivide.substring(caloryDivide.indexOf("~")+1);
		}
		
		dataMap.put("priceSt", prStartVal);
		dataMap.put("priceEnd", prEndVal);
		dataMap.put("calSt", calStartVal);
		dataMap.put("calEnd", calEndVal);
		
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


	
}

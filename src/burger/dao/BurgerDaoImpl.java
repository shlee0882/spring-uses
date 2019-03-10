package burger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import burger.vo.AdminVO;
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
		// {brandList=, menuSelect=, priceSelect=, calorySelect=, totalCount=7, pageSize=6, pageTotal=2, remainObj=1}
//		int startPage = 0;
		
		int startPage = (int) dataMap.get("pageNum");
		
		if(!"".equals(dataMap.get("pageNum"))) {
			startPage = startPage * 6;
		}
		
		dataMap.put("startPage", startPage);
		
		
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
			throw new Exception("로그인 실패");
		}
		if(!"Y".equals(getLoginRequest.getUse_active())) {
			throw new Exception("로그인 실패");
		}
		return getLoginRequest;
	}


	
}

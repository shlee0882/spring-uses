package burger.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import burger.dao.BurgerDao;
import burger.vo.AdminVO;
import burger.vo.AuthInfo;
import burger.vo.BurgerVO;
import burger.vo.DivisionVO;

@Service("burgerService")
public class BurgerServiceImpl implements BurgerService{

	@Autowired
	BurgerDao burgerdao;
	
	@Override
	public BurgerVO getBurger(String menuName) {
		return burgerdao.getBurger(menuName);
	}

	@Override
	public List<BurgerVO> getBurgerList(Map<String, Object> dataMap) {
		
		String prStartVal ="";
		String prEndVal ="";
		String calStartVal ="";
		String calEndVal ="";
		
		if(!"".equals(dataMap.get("priceSelect")) && dataMap.get("priceSelect") != null) {
			String priceDivide = (String) dataMap.get("priceSelect");
			prStartVal = priceDivide.substring(0, priceDivide.indexOf("~"));
			prEndVal= priceDivide.substring(priceDivide.indexOf("~")+1);
		}

		if(!"".equals(dataMap.get("calorySelect")) && dataMap.get("calorySelect") != null) {
			String caloryDivide = (String) dataMap.get("calorySelect");
			calStartVal = caloryDivide.substring(0, caloryDivide.indexOf("~"));
			calEndVal= caloryDivide.substring(caloryDivide.indexOf("~")+1);
		}
		
		dataMap.put("priceSt", prStartVal);
		dataMap.put("priceEnd", prEndVal);
		dataMap.put("calSt", calStartVal);
		dataMap.put("calEnd", calEndVal);
		// {brandList=, menuSelect=, priceSelect=, calorySelect=, totalCount=7, pageSize=6, pageTotal=2, remainObj=1}
		int startPage = 0;

		if(!"".equals(dataMap.get("pageNum")) && dataMap.get("pageNum") != null) {
			startPage = (int) dataMap.get("pageNum");
			startPage = startPage * 6;
		}
		
		dataMap.put("startPage", startPage);
		
		return burgerdao.getBurgerList(dataMap);
	}
	
	@Override
	public List<DivisionVO> getDivisionList() {
		// TODO Auto-generated method stub
		return burgerdao.getDivisionList();
	}

	@Override
	public BurgerVO getBurgerTotalCount(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		return burgerdao.getBurgerTotalCount(dataMap);
	}

	@Override
	public AdminVO getLoginRequest(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		return burgerdao.getLoginRequest(dataMap);
	}

	@Override
	public List<BurgerVO> getAllBurgerList() {
		// TODO Auto-generated method stub
		return burgerdao.getAllBurgerList();
	}

	@Override
	public BurgerVO updateBurger(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		return burgerdao.updateBurger(dataMap);
	}

	@Override
	public BurgerVO insertBurger(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		return burgerdao.insertBurger(dataMap);
	}

	@Override
	public AuthInfo loginRequest(Map<String, Object> dataMap) {
		// TODO Auto-generated method stub
		return burgerdao.loginRequest(dataMap);
	}




	
}

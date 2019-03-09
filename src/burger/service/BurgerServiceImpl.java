package burger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import burger.dao.BurgerDao;
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
		return burgerdao.getBurgerList(dataMap);
	}
	
	@Override
	public List<DivisionVO> getDivisionList() {
		// TODO Auto-generated method stub
		return burgerdao.getDivisionList();
	}


	
}

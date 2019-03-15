package burger.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import burger.service.BurgerService;
import burger.vo.AdminVO;
import burger.vo.BurgerVO;
import burger.vo.DivisionVO;


@Controller
public class InitController {
	
	@Autowired
	BurgerService burgerService;

	private static final Logger logger = LoggerFactory.getLogger(InitController.class);

	@RequestMapping("/")
	public String getDivision(Model model) {
		
		List<DivisionVO> divisionList = burgerService.getDivisionList();
		System.out.println(divisionList);
		List<DivisionVO> brandList = new ArrayList<>();
		List<DivisionVO> menuList = new ArrayList<>();
		List<DivisionVO> priceList = new ArrayList<>();
		List<DivisionVO> caloryList = new ArrayList<>();
		for (DivisionVO divisionVO : divisionList) {
			if("brand".equals(divisionVO.getItem())) {
				brandList.add(divisionVO);
			}else if("menu".equals(divisionVO.getItem())) {
				menuList.add(divisionVO);
			}else if("price".equals(divisionVO.getItem())) {
				priceList.add(divisionVO);
			}else if("calory".equals(divisionVO.getItem())) {
				caloryList.add(divisionVO);
			}
		}
		model.addAttribute("brandList", brandList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("priceList", priceList);
		model.addAttribute("caloryList", caloryList);
		return "index.jsp";
	}

	@RequestMapping("login")
	public String getLoginForm(Model model) {
		return "loginForm.jsp";
	}
	
	@RequestMapping(value="loginRequest", method=RequestMethod.POST)
	public String getLoginRequest(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
		AdminVO result = burgerService.getLoginRequest(dataMap);
		
		List<BurgerVO> allBurgerList = burgerService.getAllBurgerList();
		model.addAttribute("allBurgerList", allBurgerList);
		model.addAttribute("result", result);
		
		return "adminPage.jsp";
	}
	
	
	@RequestMapping("getBurgerList")
	public String getUserList(Model model) {
		List<BurgerVO> allBurgerList = burgerService.getAllBurgerList();
		model.addAttribute("allBurgerList", allBurgerList);
		return "adminPage.jsp";
	}
	
	@RequestMapping(value="updateBurger", method=RequestMethod.POST)
	@ResponseBody
	public BurgerVO updateBurger(@RequestParam Map<String, Object> dataMap, Model model) throws Exception {
		BurgerVO result =  burgerService.updateBurger(dataMap);
		model.addAttribute("result", result);
		return result;
	}

	@RequestMapping(value="upload", method=RequestMethod.POST)
	public ModelAndView insertBoard(MultipartFile file, ModelAndView mv) throws Exception{
		System.out.println( "파일이름 :"+file.getOriginalFilename());
		System.out.println( "파일크기 : "+file.getSize());
		System.out.println( "컨텐트 타입 : "+file.getContentType());
		
		
		// 이미지 imgur에 뭘 넘겨야 하는지 확인하고 값 넘기기
		// 업로드 되는지 확인
		
//        String savedName = file.getOriginalFilename();

//        File target = new File(uploadPath, savedName);

        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
        // FileCopyUtils.copy(바이트배열, 파일객체)
//        FileCopyUtils.copy(file.getBytes(), target);

//        mav.setViewName("upload/uploadResult");
//        mav.addObject("savedName", savedName);

	    return null;
	}


	
	
}

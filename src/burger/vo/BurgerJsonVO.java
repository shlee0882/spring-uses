package burger.vo;

import lombok.Data;

@Data
public class BurgerJsonVO {

	  private Integer product_no;			//	제품번호
	  private String chain_no;     			//	체인번호
	  private String chain_name;     	//	체인명
	  private String menu_name;      	//	메뉴명
	  private String single_price;			//	단품가격
	  private String set_price;				//	세트가격
	  private String calory;					//	칼로리
	  private String display_yn;     		//	전시여부
	  private String img_url;        		//	이미지 url
	
}

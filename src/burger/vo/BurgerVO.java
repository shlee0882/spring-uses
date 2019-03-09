package burger.vo;

import lombok.Data;

@Data
public class BurgerVO {

	  private Integer product_no;			//	제품번호
	  private String chain_name;     	//	체인명
	  private String menu_name;      	//	메뉴명
	  private String single_price;			//	단품가격
	  private String set_price;				//	세트가격
	  private String calory;					//	칼로리
	  private String display_yn;     		//	전시여부
	  private String store_no;       		//	점포번호
	  private String img_url;        		//	이미지 url
	  private String store_name;     		//	점포명
	  private String area_code;      		//	지역코드
	  private String total_count;      		//	제품 총 갯수
	  
	
}

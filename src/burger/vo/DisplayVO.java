package burger.vo;

import lombok.Data;

@Data
public class DisplayVO {

	  private Integer display_no;		//	전시번호
	  private String display_type;     //	전시타입
	  private String name;      			//	이름
	  private String img_url;      		//	이미지 경로
	  private String display_yn;      	//	전시유무
	  private String priority;      		//	전시우선순위
	  
}

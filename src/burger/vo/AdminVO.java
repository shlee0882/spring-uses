package burger.vo;

import lombok.Data;

@Data
public class AdminVO {

	  private Integer admin_no;		//	어드민번호
	  private String id;     				//	아이디
	  private String pass;      	//	패스워드
	  private String name;      			//	이름
	  private String use_active;      	//	활성여부
	  
}

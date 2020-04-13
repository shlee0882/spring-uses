package burger.vo;

import lombok.Data;

@Data
public class AdminVO {

	  private Integer admin_no;	
	  private String id;     	
	  private String pass;      
	  private String name;      
	  private String use_active;   
	  private boolean rememberId;
}

package vo;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {
	private String seq;
	private String title;
	private String writer;
	private Date regdate;
	private String fileSrc;
	private int hit;
	private String content;
	
	
	
}

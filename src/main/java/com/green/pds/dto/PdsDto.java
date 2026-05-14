package com.green.pds.dto;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data

@NoArgsConstructor
public class PdsDto {
// Board 자료
	private  int      idx;
	private  String   title;
	private  String   content;
	private  String   writer;
	private  String   regdate;
	private  int      hit;
	
// Files 자료 - > 파일 수
	private  int 	  filescount;
	
// Menus 자료
	private  String   menu_id;
	private	 String	  menu_name;
	private	 String	  menu_seq;
}

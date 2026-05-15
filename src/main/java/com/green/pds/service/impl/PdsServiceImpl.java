package com.green.pds.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.green.pds.dto.PdsDto;
import com.green.pds.mapper.PdsMapper;
import com.green.pds.service.PdsService;

@Service
public class PdsServiceImpl implements PdsService {
	
	@Value("${part1.upload-path}")
	private String uploadPath;
	
	@Autowired
	private PdsMapper pdsMapper;
	@Override
	public List<PdsDto> getPdsList(HashMap<String, Object> map) {
		
		List<PdsDto> pdsList = pdsMapper.getPdsList(map); 
		return 		 pdsList;
	}
	@Override
	public void setWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles) {
		//파일저장 + db저장
		// 1. 파일저장 : uploadfiles
		String uploadPath = "d:/mm/dev/springboot/data";
		map.put("uploadPath", uploadPath);
		
		System.out.println("이전 map:" + map);
		// 별도 클래스 생성해서 처리 : PdsFile
		PdsFile.save(map, uploadfiles );
		System.out.println("이후 map:" + map);
		// 2. db 저장 : 자료실 글 쓰기 <- map
		
	}
	//map:{menu_id=MENU01, nowpage=1, title=ㅎㅇㄹ, writer=admin11, content=ㅎㅇㄹ}
	//uploadFiles:[Lorg.springframework.web.multipart.MultipartFile;@667f8660
	//이전 map:{menu_id=MENU01, nowpage=1, title=ㅎㅇㄹ, writer=admin11, content=ㅎㅇㄹ, uploadPath=d:/mm/dev/springboot/data}
	//dateStr2026/05/15
	//이후 map:{menu_id=MENU01, nowpage=1, title=ㅎㅇㄹ, writer=admin11, content=ㅎㅇㄹ, uploadPath=d:/mm/dev/springboot/data, 
	//				fileList=[FilesDto(file_num=0, idx=0, filename=adInterceptor.txt, 
	//				fileext=.txt, sfilename=2026\05\15\36c4ecf2-2f2d-4257-b625-c6217735b7f8.adInterceptor.txt)]}
}

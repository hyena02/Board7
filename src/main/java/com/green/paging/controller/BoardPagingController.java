package com.green.paging.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.green.board.dto.BoardDto;
import com.green.config.WebMvcConfig;
import com.green.interceptor.AuthInterceptor;
import com.green.menus.dto.MenuDTO;
import com.green.menus.mapper.MenuMapper;
import com.green.paging.dto.Pagination;
import com.green.paging.dto.SearchDto;
import com.green.paging.mapper.BoardPagingMapper;

@Controller
@RequestMapping("/BoardPaging")
public class BoardPagingController {

    private final WebMvcConfig webMvcConfig;

    private final AuthInterceptor authInterceptor;
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private BoardPagingMapper boardPagingMapper;

    BoardPagingController(AuthInterceptor authInterceptor, WebMvcConfig webMvcConfig) {
        this.authInterceptor = authInterceptor;
        this.webMvcConfig = webMvcConfig;
    }

	//BoardPaging/List?menu_id=MENU01&nowpage=1
	@RequestMapping("/List")
	public ModelAndView list(BoardDto boardDto, int nowpage
			,String searchType, String keyword) { 
	
		// 메뉴목록 : menus.jsp 용
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		//게시물 목록 조회(페이징해서)
		// 해당 메뉴의 자료갯수 : 
		int totalCount 
				= boardPagingMapper.count(boardDto, searchType, keyword); // menu_id
		System.out.println("totalCount:" + totalCount);
		
		// 페이징을 위한 초기설정
  		SearchDto	searchDto = new SearchDto();
  		
		searchDto.setPageNo(nowpage);			// 현재 페이지 정보
		searchDto.setNumOfRows(10);				// 한 페이지에 출력할 페이지 수 
		searchDto.setPageSize(10);				// paging.jsp 에 한줄에 출력될 페이지 번호 수 : 처음 이전 1 2 3 ... 10 다음 마지막 

		// Pagination 설정
		Pagination pagination = new Pagination(totalCount, searchDto);
		searchDto.setPagination(pagination);
		
		// 검색 조건 추가
		// 추가된 검색조건
		
		String menu_id  = boardDto.getMenu_id();
		
		int offset 		= searchDto.getOffset();
		int numOfRows 	= searchDto.getNumOfRows();
		
		List<BoardDto> list = boardPagingMapper.getBoardPagingList(menu_id, searchType, keyword, offset, numOfRows );
	
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("boardpaging/list");		//jsp
		mv.addObject("menuList", menuList);
		
		mv.addObject("nowpage", nowpage);
		mv.addObject("menu_id",menu_id);		// 현재 메뉴정보
		
		mv.addObject("bList", list);
		mv.addObject("searchDto", searchDto);
		
		mv.addObject("searchType", searchType);
		mv.addObject("keyword", keyword);
		
		return mv;
	}//Mav list

	//BoardPaging/View?idx=107&menu_id=MENU01&nowpage=1
	@RequestMapping("/View")
	public ModelAndView view(BoardDto boardDto, int nowpage) {
		//메뉴목록 조회
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		// idx 에 해당하는 게시글 조회수 1증가
		boardPagingMapper.incHit( boardDto );
		//idx 로 게시글 한개를 조회
		BoardDto board = boardPagingMapper.getBoard(boardDto);
		
		//조회된 content의 "\n" -> "<br>"
		String content = board.getContent();
		if(content != null)
			board.setContent(content.replace("\n", "<br>") );
		
		String menu_id = board.getMenu_id();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("boardpaging/view");
		mv.addObject("menuList", menuList);
		
		mv.addObject("menu_id",menu_id);
		mv.addObject("nowpage",nowpage);
		
		mv.addObject("board",board);
		
		
		
		return null;
	}
	
	//BoardPaging/WriteForm?menu_id=MENU01&nowpage=1
	@RequestMapping("/WriteForm")
	public  ModelAndView  writeForm(BoardDto boardDto, int nowpage) {
		
		// 메뉴 목록 조회
		List<MenuDTO>  menuList  =  menuMapper.getMenuList();  
		// System.out.println("1:" + menuList);
		
		
		String     menu_id       =  boardDto.getMenu_id();
		ModelAndView   mv        =  new ModelAndView();
		mv.setViewName("boardpaging/write");
		mv.addObject("menuList", menuList);
		mv.addObject("menu_id",  menu_id );
		mv.addObject("nowpage",  nowpage );
	
		
		return  mv;
		
	}
	
	// /BoardPaging/Write
	// 넘어온 값들
	//   db 저장 : menu_id=MENU01, title=제목, writer=admin, content=내용,
	//   돌아가기위해 필요한 변수 : menu_id=MENU01, nowpage=1
	@RequestMapping("/Write")
	public  ModelAndView  write( BoardDto boardDto, int nowpage ) {
		
		// 새글 저장 -> db 저장
		boardPagingMapper.insertBoard(  boardDto  );		
		
		// 목록으로 돌아가기
		String   menu_id     =  boardDto.getMenu_id();				
		ModelAndView  mv     =  new ModelAndView();
		String        fmt    =  "redirect:/BoardPaging/List?menu_id=%s&nowpage=%d"; 
		String        loc    =  String.format(fmt, menu_id, 1 );
		mv.setViewName( loc  );
		return        mv;
		
	}
	// /BoardPaging/Delete?idx=207&menu_id=MENU01&nowpage=1
	@RequestMapping("/Delete")
	public  ModelAndView   delete( BoardDto boardDto, int nowpage  ) {
		
		// idx 로 board 삭제
		boardPagingMapper.deleteBoard( boardDto  );
		
		// 삭제후 목록으로 이동
		String        menu_id  =  boardDto.getMenu_id(); 
		ModelAndView  mv       =  new ModelAndView();
		String        loc      =  """
				redirect:/BoardPaging/List?menu_id=%s&nowpage=%d
				""".formatted(menu_id, nowpage);		
		mv.setViewName( loc );		
		return   mv;
		
	}
	
	//http://localhost:8080/Board/UpdateForm?idx=208&menu_id=MENU01&nowpage=1
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(BoardDto boardDto, int nowpage) {
	
		ModelAndView mv = new ModelAndView();
		//메뉴목록
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		// 수정할 페이지에 출력할 자료를 idx 로 조회
		BoardDto board = boardPagingMapper.getBoard(boardDto);
		
		//수정할 페이지로 이동
		String menu_id = boardDto.getMenu_id();
		
		mv.setViewName("boardpaging/update");
		
		mv.addObject("menu_id", menu_id);
		mv.addObject("nowpage", nowpage);
		mv.addObject("board", board);
		
		return mv;
		
	}
	
	@RequestMapping("/Update")
	public ModelAndView update(BoardDto boardDto , int nowpage) {
		
		// 넘어온 값으로 db 정보 수정
		boardPagingMapper.updateBoard(boardDto);
		
		String menu_id = boardDto.getMenu_id();
		ModelAndView mv = new ModelAndView();
		String loc = """ 
				redirect:/BoardPaging/List?menu_id=%s&nowpage=%d
				""".formatted(menu_id, nowpage);
		mv.setViewName(loc);
		
		// List
		return mv;
		
	}
	
	
	
}

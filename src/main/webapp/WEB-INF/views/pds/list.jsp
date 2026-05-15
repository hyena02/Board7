<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib  prefix="c"  uri="jakarta.tags.core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 목록</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet" />

<style>
	main {
	    padding: 30px;
	}
/* 메뉴 영역 */
	td {
	    padding: 12px;
	    text-align: center;
	}
	tr {
	    border-bottom: 1px solid #ddd;
	}
	tr:first-child td{
		padding:5px;
		font-weight:bold;
	}
	tr:nth-child(even) {
	    background-color: #fafafa;
	}
	tr:nth-of-type(2) td {
	    text-align: right;
	    background: #fff;
	    border-bottom: 2px solid #eee;
	}
	
	input[type="text"] {
		width : 50%;
	}
	input[type="submit"] {
	width : 5%;
	}

</style>
</head>

<body>
	<main>
	  <%@include file="/WEB-INF/include/menuspdspaging.jsp" %> 
	
	  <h2 class="h2"><b id="mname"></b>게시물 목록</h2>
	  <table id="list">
 
	    <tr class="list-header">
	      <td>번호</td>
	      <td>제목</td>
	      <td>글쓴이</td>
	      <td>날짜</td>
	      <td>조회수</td>	
	      <td>파일수</td>	
	      <td>삭제</td>	
	      <td>수정</td>	
	    </tr>

	    <tr>
	      <td  colspan="8">
	       |<a href="/Pds/WriteForm?menu_id=${map.menu_id}&nowpage=${map.nowpage}" class="btn-Box">
	       새 글 등록
	       </a>|&nbsp;&nbsp;&nbsp; 
	       |<a href="/" class="btn-Box">Home</a>| 
	      </td>
	    </tr>
	    
	    <c:forEach  var="pds"  items="${ pdsList }">
	    <tr>
	      <td> ${  pds.idx      }  </td>    <!-- menu.getMenu_id() -->
	      <td class="title"> 
	        <a href ="/Pds/View?idx=${map.idx}&menu_id=${map.menu_id}">
	        ${ pds.title    }
	        </a>  
	      </td>
	      <td> ${ pds.writer   }  </td>
	      <td> ${ pds.filescount   }  </td>
	      
	      <td> ${ pds.regdate  }  </td>
	      <td> ${ pds.hit      }  </td>
	      
	      <td> <a href="/Pds/Delete?idx=${map.idx}">삭제</a></td>
	      <td> <a href="/Pds/UpdateForm?idx=${map.idx}">수정</a></td>
	    </tr>
	    </c:forEach>
	  </table>
	  
	  <form action="/Pds/List" method="get">
		  <input type="hidden" name="menu_id" value="${ map.menu_id }" />	  
		  <input type="hidden" name="nowpage" value="${ map.nowpage }" />	  
		  <div id="search">
		    <select name="searchType">
		      <option value="title">제목</option> 
		      <option value="content">내용</option> 
		      <option value="writer">작성자</option> 
		    </select>
		    <input type="text" name="keyword" />
		    <input type="submit" value="검색" />	    
		  </div>
	  </form>	
	  
	  <div class="paging-box">
	  	<%@include file="/WEB-INF/include/pagingpds.jsp" %>
	  </div>	
	</main>
		<script>
	  const  mnameEl    =  document.querySelector('#mname');
	  let    menunameEl =  document.querySelector('.menu .active')
	  mnameEl.innerHTML =  menunameEl.innerHTML;
	  
	  
	  	// 검색한 후 searchType을 선택한 내용 변경
	 	
	  	let curSearchType = '${map.searchType}' 		// 서버변수
	  	let qry = "[value = " + curSearchType + "]"
	  	const optionEls = document.querySelectorAll("option")
	  	let index = 0;
	  	switch(curSearchType){
	  	
	  	case"";
	  	case "title" : index = 0; break;
	  	case "content" : index = 1;break;
	  	case "writer" : index = 2;break;
	  	
	  	}
	  	opionEls[index].selected = true;
	</script>
</body>
</html>










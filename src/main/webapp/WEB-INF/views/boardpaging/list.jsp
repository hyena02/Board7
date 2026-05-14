<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib  prefix="c"  uri="jakarta.tags.core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Paging 목록</title>
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
	  <%@include file="/WEB-INF/include/menuspaging.jsp" %> 
	
	  <h2 class="h2"><b id="mname">${ menu.menu_name }</b>게시물 목록</h2>
	  <table id="list">
 
	    <tr class="list-header">
	      <td>번호</td>
	      <td>제목</td>
	      <td>글쓴이</td>
	      <td>날짜</td>
	      <td>조회수</td>	
	      <td>삭제</td>	
	      <td>수정</td>	
	    </tr>

	    <tr>
	      <td  colspan="7">
	       |<a href="/BoardPaging/WriteForm?menu_id=${menu_id}&nowpage=${nowpage}" class="btn-Box">
	       새 글 등록
	       </a>|&nbsp;&nbsp;&nbsp; 
	       |<a href="/" class="btn-Box">Home</a>| 
	      </td>
	    </tr>
	    
	    <c:forEach  var="board"  items="${ bList }">
	    <tr>
	      <td> ${  board.idx      }  </td>    <!-- menu.getMenu_id() -->
	      <td class="title"> 
	        <a href ="/Board/View?idx=${board.idx}&menu_id=${menu_id}">
	        ${ board.title    }
	        </a>  
	      </td>
	      <td> ${ board.writer   }  </td>
	      <td> ${ board.regdate  }  </td>
	      <td> ${ board.hit      }  </td>
	      <td> <a href="/Board/Delete?idx=${board.idx}">삭제</a></td>
	      <td> <a href="/Board/UpdateForm?idx=${board.idx}">수정</a></td>
	    </tr>
	    </c:forEach>
	  </table>
	  
	  <form action="/BoardPaging/List" method="get">
		  <input type="hidden" name="menu_id" value="${ menu_id }" />	  
		  <input type="hidden" name="nowpage" value="${ nowpage }" />	  
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
	  	<%@include file="/WEB-INF/include/paging.jsp" %>
	  </div>	
	</main>
		<script>
	  const  mnameEl    =  document.querySelector('#mname');
	  let    menunameEl =  document.querySelector('.menu .active')
	  mnameEl.innerHTML =  menunameEl.innerHTML;
	</script>
</body>
</html>










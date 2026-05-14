<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib  prefix="c"  uri="jakarta.tags.core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 리스트</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" />

<style>
	main {
	    padding: 30px;
	}
/* 메뉴 영역 */
	td {
	    padding: 12px;
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



</style>

</head>
<body>
	<main>
	  <h2>메뉴 목록 ${msg} </h2>
	  <table>
	    <tr class="list-header">
	      <td>메뉴 아이디</td>
	      <td>메뉴 이름</td>
	      <td>메뉴 번호</td>
	      <td>삭제</td>
	      <td>수정</td>
	    </tr>
	    <tr>
	      <td  colspan="5">
	       |<a href="/Menus/WriteForm" class="btn-Box">메뉴등록</a>|&nbsp;&nbsp;&nbsp; 
	       |<a href="/Menus/WriteForm2" class="btn-Box">메뉴등록2</a>|&nbsp;&nbsp;&nbsp; 
	       |<a href="/" class="btn-Box">Home</a>|
	      </td>
	    </tr>
	    
	    <c:forEach  var="menu"  items="${ menuList }">
	    <tr>
	      <td> ${ menu.menu_id   }  </td>    <!-- menu.getMenu_id() -->
	      <td> ${ menu.menu_name }  </td>
	      <td> ${ menu.menu_seq  }  </td>
	      <td> <a href="/Menus/Delete?menu_id=${menu.menu_id}">삭제</a> </td>	      
	      <td> <a href="/Menus/UpdateForm?menu_id=${menu.menu_id}">수정</a>  </td>
	    </tr>
	    </c:forEach>
	  </table>	
	</main>
</body>
</html>










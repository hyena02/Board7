<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 수정</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" />

<style>
	main {
		
		text-align: center;
		border : 1px solid black;
		padding : 5px;
		margin : 10px auto;
	}
	table{
	border : 1px solid black;
	width : 100%;
	}
	td{
		padding : 5px;
		
		}
	table,th,td {
		border : 1px solid black;
		border-collapse: collapse;
	}
	td:first-child{
		background-color: gray;
		color:white;
		td {
			border : 1px solid black;
			}
		}
	tr:nth-of-type(2) td {
		padding-right: 10px;
	}
	a:hover {
		text-decoration: none;
		color : red;
		font-weight: bold;
	}
		
</style>
<body> 
  <main>
  <%@include file="/WEB-INF/include/menus.jsp" %>  
    <h2>메뉴 수정</h2>
    <form  action="/Menus/Update" method="get">
     <table>
      <tr>
        <td>메뉴 아이디</td>
        <td><input type="text" name="menu_id"  value="${ menu.menu_id }"  readonly /></td>
      </tr>
      <tr>
        <td>메뉴 이름</td>
        <td><input type="text" name="menu_name" value="${ menu.menu_name }" /></td>        
      </tr>
      <tr>
        <td>메뉴 순서</td>
        <td><input type="number" name="menu_seq" value="${ menu.menu_seq }" />
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit"  value="수정" />
          <input type="button"  value="목록" 
            onclick="window.location.href='/Menus/List'"
          />        
        </td>
      </tr>
     </table>    
    </form>
  
  </main>
</body>
</html>    
















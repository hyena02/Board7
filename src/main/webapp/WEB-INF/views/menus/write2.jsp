<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 생성2</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" />

<style>
	main {
		text-align: center;
		border : 1px solid black;
		padding : 5px;
		margin : 10px auto;
	}
	table,th,td {
		border : 1px solid black;
		border-collapse: collapse;
	}
	table {
		width : 100%
	}
	td {
		padding : 5px;
	}
	td:nth-of-type(1){
		background: gray;
		color : white;
		border : 1px solid black;
	}
	tr:last-child > td {
		background: white;
		border : 1px solid black;	
	}
	
	input[type=text],input[type=submit],input[type=number] {
		width : 90%;
	}
	input[type=button] {
		width : 90%;
	}

		
</style>
<body> 
  <main>
    <h2>메뉴 등록</h2>
    <form  action="/Menus/Write2" method="get">
     <table>      
      <tr>
        <td>메뉴 이름</td>
        <td><input type="text" name="menu_name" /></td>        
      </tr>      
      <tr>
        <td colspan="2">
          <input type="submit"  value="추가" />
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
















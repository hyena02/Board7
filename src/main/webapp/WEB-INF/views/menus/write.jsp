<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 생성1</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" />

<style>

	td:nth-of-type(1){
		background: gray;
		color : white;	
	}
	td{
		background:#eef1f4;
		 border-bottom: 2px solid #dcdfe4;
	}
	tr:last-child  td {
		padding : 14px 0;
		text-align:center;
		background: #eef1f4;
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
    <form  action="/Menus/Write" method="get">
     <table>
      <tr>
        <td>메뉴 아이디</td>
        <td><input type="text" name="menu_id"   /></td>
      </tr>
      <tr>
        <td>메뉴 이름</td>
        <td><input type="text" name="menu_name" /></td>        
      </tr>
      <tr>
        <td>메뉴 순서</td>
        <td><input type="number" name="menu_seq" /></td>
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
















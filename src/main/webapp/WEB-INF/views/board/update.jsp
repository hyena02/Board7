<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet"/>
<style>

 td {
    padding:5px 10px;
    text-align : center; 
 }
 
 tr > td:first-child {
 	background-color:gray;
 	color : white;
 }
 tr:last-child > td {
     background: #fafafa;
 
 }
 
	tr:last-child > td {
		background: white;
	}
	input[type="text"],input[type=email],input[type=password]{
		width : 100%;
	}
	input[type=submit],input[type=button] {
		width : 100px;
	}
</style>
</head>
<body> 
  <main>
    <%@include file="/WEB-INF/include/menus.jsp" %>  
  
    <h2>${ menu_name } 게시글 수정</h2>
    <form  action="/Board/Update?idx=${ board.idx }" method="post">
     <input type="hidden" name="menu_id" value="${ menu_id }" />
     <table id="table1">
      <tr>
        <td>글번호</td>
        <td>${ board.idx }</td>
        <td>조회수</td>
        <td>${ board.hit }</td>        
      </tr>
      <tr>
        <td>작성자</td>
        <td>${ board.writer }</td>
        <td>작성일</td>
        <td>${ board.regdate }</td>        
      </tr>
      <tr>        
        <td><span class="red">*</span>제목</td>
        <td colspan="3">
          <input type="text" name="title"  value="${ board.title }"  />
        </td>
      </tr>     
      <tr>
        <td>내용</td>
        <td  colspan="3">
          <textarea name="content">
            ${ board.content }
          </textarea>
        </td>        
      </tr>   
      <tr>
        <td colspan="4">
          <input type="submit"  value="수정" />
          <input type="button"  value="목록" 
            onclick="location.href='/Board/List?menu_id=${menu_id}'"
          />        
        </td>
      </tr>
     </table>    
    </form>
  
  </main>
  
  <script>
  
  </script>
  <!-- Javascript 코딩 : client validation -->
</body>
</html>    
















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 보기</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet"/>
<style>

	td {
		padding : 5px 10px;
	}
	td:first-child {
		background-color:gray;
	}
	tr:nth-of-type(2) td {	
		padding : 10px;
	}
	tr:last-child > td {
		background: white;
	}
	input[type="text"],input[type=email],input[type=password]{
		width : 100%;
		
	}
	input[type=submit],input[type=button] {
		width : 100px;
		background-color:gray;
	}
	input[name=userid] {
		width : 50%;
		float : left;
		margin-right:5px;
	}
	#dupCheck1,#dupCheck2{
		width : 16%;
		font-size:12px;
	}
	
	.red { 
		color:blue; 
		font-wheight : bold;
	}
	tr:last-child td {
		text-align: center;
		padding-top: 20px;
	}
</style>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<body> 
  <main>
    <!-- 메뉴 출력 -->
    <%@include file="/WEB-INF/include/menuspaging.jsp" %>
    
    <h2 class="h2"><b id="mname"></b>게시글 내용 보기</h2>
     <table id="table1">
      <tr>
        <td>글 번호</td>
        <td>${board.idx}</td>
        <td>조회수</td>
        <td>${board.hit}</td>      
      </tr>
      <tr>
        <td>작성자</td>
        <td>${board.writer}</td>
        <td>작성일</td>
        <td>${board.regdate}</td>      
      </tr>
      <tr>
        <td>제목</td>
        <td colspan="3">${ board.title }</td>
      </tr>
      <tr>
        <td>내용</td>
        <td colspan="3">${ board.content }</td>
      </tr>
     
      <tr>
        <td colspan="4">
          <a href="/BoardPaging/WriteForm?menu_id=${board.menu_id}&nowpage=${nowpage}" class="btn btn-primary">새글쓰기</a>
          
          <%--  <c:if test="${ sessionScope.login.userid eq board.writer }"> --%>
	          <a href="/BoardPaging/UpdateForm?idx=${board.idx}&menu_id=${board.menu_id}&nowpage=${nowpage}" class="btn btn-warning">수정</a>
	          <a href="/BoardPaging/Delete?idx=${board.idx}&menu_id=${board.menu_id}&nowpage=${nowpage}" class="btn btn-danger">삭제</a>
          <%--  </c:if> --%>
          
          <a href="/BoardPaging/List?menu_id=${board.menu_id}&nowpage=${nowpage}" class="btn btn-info">목록</a>
          <a href="/" class="btn btn-success">Home</a>
        </td>
      </tr>
      
     </table>    
  </main>
  <script>
	  const  mnameEl    =  document.querySelector('#mname');
	  let    menunameEl =  document.querySelector('.menu .active')
	  mnameEl.innerHTML =  menunameEl.innerHTML;
  </script>
	
  </body>
 </html>    
















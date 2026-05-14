<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" />

<style>
 
 	#table1 td {
		border-bottom: 1px solid #dcdfe4;
	}
 tr > td:first-child {
 	background:#eef1f4;
 	
 }
 #table1 tr > td:nth-of-type(2){
 		background:white;
 }
 #table1 tr:last-child > td {
     background: #eef1f4;
     border-bottom: 1px solid white;
 }
   
  input[type="text"], input[type=number], input[type=password]  {
     width : 100%;
  }
  input[type=submit], input[type=button] {
     width : 100px;
  }
  input[name=userid] {
     width : 100%;
  }   
  #table1 input[type="text"] {
	width: 100%;
	height: 40px;
	padding: 8px 12px;
	border: 1px solid #cfd6dd;
	border-radius: 6px;
	box-sizing: border-box;
}

#table1 textarea {
	width: 100% !important;
	height: 300px !important;
	min-height: 300px;
	padding: 12px;
	box-sizing: border-box;
	border: 1px solid #cfd6dd;
	border-radius: 6px;
	font-size: 16px;
	line-height: 1.5;
	resize: vertical;
}

#table1 td {
	padding: 12px;
	vertical-align: middle;
}

</style>
<body> 
  <main>
    <%@include file="/WEB-INF/include/menuspaging.jsp" %>  
  
    <h2 class="h2"><b id="mname">${ menu_name }</b> 게시글 수정</h2>
    <form  action="/BoardPaging/Update?idx=${ board.idx }" method="post">
     <input type="hidden" name="board.idx" value="${ board.idx }" />
     <input type="hidden" name="menu_id" value="${ menu_id }" />
     <input type="hidden" name="nowpage" value="${ nowpage }" />
     <table id="table1">
	     <tr>
	     	<td>글번호</td>
	     	<td>${board.idx}</td>
	     	<td>조회수</td>
	     	<td>${board.hit }</td>
	     </tr>
	     <tr>
	     	<td>작성자</td>
	     	<td>${board.writer}</td>
	     	<td>작성일</td>
	     	<td>${board.regdate }</td>
	     </tr>
      <tr>
        <td><span class="red">*</span>제목
        </td>
        <td>
          <input type="text"  name="title" value="${ board.title }"  />
        </td>
      </tr>   
      <tr>
        <td>내용</td>
        <td colspan="3">
        	<textarea name="content">${ board.content }</textarea>
        </td>        
      </tr>   
      <tr>
        <td colspan="4">
          <input type="submit"  value="수정" />
          <input type="button"  value="목록" 
            onclick="location.href='/BoardPaging/List?menu_id=${menu_id}'"/>        
        </td>
      </tr>
     </table>    
    </form>
  </main>
  <script>
	  const  mnameEl    =  document.querySelector('#mname');
	  let    menunameEl =  document.querySelector('.menu .active')
	  mnameEl.innerHTML =  menunameEl.innerHTML;
	  
	  // Javascript 코딩 : client validation
	  
	</script>
</body>
</html>    
















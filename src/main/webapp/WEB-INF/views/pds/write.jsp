<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 파일 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" />

<style>
 
 	#table1 td {
		border-bottom: 1px solid #dcdfe4;
	}
 #table1 tr > td:first-child {
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
	textarea{
		width:100%;
		height:300px;
		resize:none;
	}
	#btnAddFile{
		width:auto;
		padding:6px 12px;
	}
	.upfile {
		margin-top:10px;
	}
</style>
<body> 
  <main>
    <%@include file="/WEB-INF/include/menuspaging.jsp" %>  
  
    <h2 class="h2"><b id="mname"></b>새 글 쓰기</h2>
    <form  action="/Pds/Write" method="post"
    				enctype="multipart/form-data">
     <input type="hidden" name="menu_id" value="${ map.menu_id }" />
     <input type="hidden" name="nowpage" value="${ map.nowpage }" />
     <table id="table1">
      <tr>
        <td><span class="red">*</span>제목</td>
        <td>
          <input type="text"  name="title"   />
        </td>
      </tr>
      <tr>
        <td><span class="red">*</span>작성자</td>
        <td><input type="text" name="writer" 
        				value="${sessionScope.login.userid}" readonly /></td>        
      </tr>    
      <tr>
        <td>내용</td>
        <td><textarea name="content"></textarea></td>        
      </tr>   
      <tr>
      	<td>파일</td>
      	<td>
      		<input type="button" id="btnAddFile" value="파일추가(최대 100MByte)" />
      		<div id = "tdfile">
      			<input type="file" name="upfile" class="upfile" multiple/><br>
      		</div>
      	</td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit"  value="추가" />
          <input type="button"  value="목록" id="goList" />        
        </td>
      </tr>
     </table>    
    </form>
  </main>
  <script>
  // 메뉴제목 출력
	  const  mnameEl    =  document.querySelector('#mname');
	  let    menunameEl =  document.querySelector('.menu .active')
	  mnameEl.innerHTML =  menunameEl.innerHTML;
	// 목록으로 이동
		const goListEl = document.querySelector('#goList')
		goListEl.onclick = function(){
			location.href='/Pds/List?menu_id=${map.menu_id}&nowpage=${map.nowpage}'
		}
	// 파일 입력창 추가
		const btnAddFileEl = document.querySelector('#btnAddFile')
		const tdfileEl		 = document.querySelector('#tdfile')
		
	  let    tag           =  '<input type="file" name="upfile" class="upfile" multiple /><br>'  
	  let    html          =  tdfileEl.innerHTML 
		
		btnAddFileEl.addEventListener('click', function(){
			  html               +=  tag
			  alert(html)
			  tdfileEl.innerHTML = html 
		})
	// 입력항목 체크
	  
	</script>
</body>
</html>    
















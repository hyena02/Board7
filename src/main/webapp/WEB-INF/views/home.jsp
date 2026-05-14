<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어서오고~</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet" />

<style>

	main {
		width: 450px;
		margin: 100px auto;
	}

	h2 {
		margin-bottom: 30px;
		color: black;
		font-weight : bold;
	}

	a {
		display: block;
		margin: 10px 0;
		padding: 10px;	
		color: white;	
		background: gray;
		font-weight: bold;
	}
	a:hover {
		text-decoration:none;
		background: #2f3b52;
		color:white;
	}

</style>
</head>

<body>

	<main>
		<h2>HOME</h2>
		<a href="/test"> 테스트 </a>
		<div><a href="/Menus/WriteForm"> 새 메뉴 추가 </a></div>
		<div><a href="/Menus/WriteForm2"> 새 메뉴2 추가 </a></div>
		<div>&nbsp;</div>
		
		<div><a href="/Menus/List"> 메뉴 목록 </a></div>	
		<div><a href="/Users/List"> 사용자 목록 </a></div>	
		<div>&nbsp;</div>
		
		<div><a href="/Users/WriteForm"> 사용자 추가 </a></div>	
		<div><a href="/Users/IdDupCheck2?userid=aaa" target="_blank"> 아이디 중복 테스트 </a></div>	
		<div>&nbsp;</div>
		
		<div><a href="/Board/List?menu_id=MENU01"> 게시글 목록 </a></div>	
		<div><a href="/Board/WriteForm?menu_id=MENU01"> 게시글 작성 </a></div>	
    <div>&nbsp;</div>
		
		<div><a href="/BoardPaging/List?menu_id=MENU01&nowpage=1">게시글 목록(Paging)</a></div>
    <div><a href="/BoardPaging/WriteForm?menu_id=MENU01&nowpage=1">게시글 추가(Paging)</a></div>
    <div>&nbsp;</div>

		<div><a href="/Pds/List?menu_id=MENU01&nowpage=1">자료실</a></div>
    <div><a href="/Pds/WriteForm?menu_id=MENU01&nowpage=1">자료실 등록</a></div>
    <div>&nbsp;</div>
		
		<div>
			${sessionScope.login.username} 님 환영합니다<br>
			당신의 가입일은 ${sessionScope.login.regdate}입니다 <br>
			<c:choose>
				<c:when test="${sessionScope.login ne null}">
					<a href="/Users/Logout">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="/Users/LoginForm">로그인</a>
				</c:otherwise>
			</c:choose>				
		</div>
		<input type="text" id ="num" value="1" />
		<div>
			<a id="btnNate" href="https://www.nate.com" class="btn btn-dark">Click</a>
		</div>
	</main>
	
	<script>
		const btnNateEl 	= document.querySelector('#btnNate')
		const msgEl 	= document.querySelector('#num')
		btnNateEl.onclick = function( e ){
			
			e.preventDefault()					// 기본 이벤트를 취소
			e.stopPropagation()					// 
			if( numEl.value == "2" ){
						location.href = this.href; 	// this.href == e.target.href
				} 
		}
	</script>
</body>
</html>
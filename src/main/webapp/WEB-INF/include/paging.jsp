<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="jakarta.tags.core" %>
    
<c:set var="startnum" value="${searchDto.pagination.startPage }" />
<c:set var="endnum" value="${searchDto.pagination.endPage }" />
<c:set var="totalpagecount" value="${searchDto.pagination.totalPageCount }" />

<div class="paging-box">
	<table>
		<tr>
<!-- 처음/이전 -->
			<c:if test="${startnum gt 1 }">
				<td>
					<a href="/BoardPaging/List?menu_id=${menu_id}&nowpage=1&searchType=${searchType}&keyword=${keyword}" >&nbsp;처음</a>
				</td>
				<td>
				|
				</td>
				<td>
					<a href="/BoardPaging/List?menu_id=${menu_id}&nowpage=${startnum-1}&searchType=${searchType}&keyword=${keyword}" >이전</a>
				</td>
				<td>
				|
				</td>
			</c:if>
<!--  -->			
			<c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1">
       <c:if test="${ pagenum le totalpagecount }"> 
        <td>
          <a href="/BoardPaging/List?menu_id=${menu_id}&nowpage=${pagenum}&searchType=${searchType}&keyword=${keyword}"  
            class="${pagenum eq nowpage ? 'active' : ''}" >
          	${ pagenum }
          </a>
        </td>        
       </c:if>
      </c:forEach>
			
<!-- 다음/마지막 버튼 -->
			<c:if test="${endnum lt totalpagecount}">
				<td>
				|
				</td>
				<td>
					<a href="/BoardPaging/List?menu_id=${menu_id}&nowpage=${endnum+1}&searchType=${searchType}&keyword=${keyword}">다음</a>
				</td>
				<td>
				|
				</td>
				<td>
					<a href="/BoardPaging/List?menu_id=${menu_id}&nowpage=${totalpagecount}&searchType=${searchType}&keyword=${keyword}">마지막 &nbsp;</a>
				</td>
			</c:if>
		</tr>
	</table>
</div>
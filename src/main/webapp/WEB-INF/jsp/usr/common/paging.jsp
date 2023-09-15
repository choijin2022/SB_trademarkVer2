<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
// 페이징 처리
function pageUrl(pageNo) {
 	numOfRows = ${patents[0].numOfRows};
//  	numOfRows = 10;
 	searchString = "${patents[0].searchString}";
	
	
	$('input[name=numOfRows]').val(numOfRows);
	$('input[name=searchString]').val(searchString);
	$('input[name=pageNo]').val(pageNo);
	console.log(pageNo);
	$('form[name=paging-form]').submit();
	
	
}


</script>


<form name="paging-form" action="searchPatent" method="POST" >
	<input type="hidden" name="numOfRows" value="">
	<input type="hidden" name="searchString" value="">
	<input type="hidden" name="pageNo" value="">
</form>

<section>
	<div class="page-menu mt-3 flex justify-center">
			<div class="btn-group">
				<c:set var="pageNo" value="${patents[0].pageNo}" />
				<c:set var="pagesCount" value="${patents[0].pagesCount}" />
				<c:set var="pageMenuLen" value="5" />
				
				<c:set var="startPage" value="${pageNo - pageMenuLen >= 1 ? pageNo - pageMenuLen : 1}" />
				<c:set var="endPage" value="${pageNo + pageMenuLen <= pagesCount ? pageNo + pageMenuLen : pagesCount}" />
				<c:set var="numOfRows" value="${patents[0].numOfRows}" />
				<c:set var="searchString" value="${patents[0].searchString}" />
				
				<c:set var="pageBaseUri" value="&searchString=${searchString}" />
			
				<c:if test="${patents[0].totalCount != 0 }">
					<c:if test="${pageNo == 1 }">
						<a class="btn btn-sm btn-disabled">«</a>
						<a class="btn btn-sm btn-disabled">&lt;</a>
					</c:if>
					<c:if test="${pageNo > 1 }">
						<a class="btn btn-sm" onclick="pageUrl(1)">«</a>
						<a type="button" class="btn btn-sm" onclick="pageUrl(${pageNo-1})">&lt;</a>
<%-- 						<a class="btn btn-sm" onclick="${pageBaseUri }&pageNo=${pageNo-1}">&lt;</a> --%>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<a class="btn btn-sm ${pageNo == i ? 'btn-active' : ''}" onclick="pageUrl(${i })">${i }</a>
					</c:forEach>
					<c:if test="${pageNo < pagesCount }">
						<a class="btn btn-sm" onclick="pageUrl(${pageNo + 1 })">&gt;</a>
						<a class="btn btn-sm" onclick="pageUrl(${pagesCount })">»</a>
					</c:if>
					<c:if test="${pageNo == pagesCount }">
						<a class="btn btn-sm btn-disabled">&gt;</a>
						<a class="btn btn-sm btn-disabled">»</a>
					</c:if>
				</c:if>
			</div>
		</div>
	
</section>
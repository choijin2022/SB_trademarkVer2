<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="List" />
<%@ include file="../common/head.jsp"%>
<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="mb-2 flex justify-between items-center">
			<div>
				<span>${trademarkCount }개</span>
			</div>
			<form>
				<input type="hidden" name="boardId" value="${boardId }" />
				<select data-value="${searchKeywordTypeCode }" class="select select-bordered" name="searchKeywordTypeCode">
						<option value="title">제목</option>
						<option value="body">내용</option>
						<option value="title,body">제목 + 내용</option>
				</select>
				<input class="ml-2 w-84 input input-bordered" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요" maxlength="20" value="${searchKeyword }" />
				<button class="ml-2 btn btn-active btn-ghost">검색</button>
			</form>
		</div>
		<c:choose>
			<c:when test="${trademarkCount == 0 }">
				<div class="text-center mt-4">조건에 일치하는 검색결과가 없습니다</div>
			</c:when>
			<c:otherwise>
				<div class="table-box-type-1">
					<table class="table w-full">
						<colgroup>
							<col width="60" />
							<col />
							<col width="150" />
							<col width="180" />
							<col width="180" />
							<col width="50" />
							<col width="180" />
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>이미지</th>
								<th>상표명</th>
								<th>출원번호</th>
								<th>출원날짜</th>
								<th>법적상태</th>
								<th>날짜</th>
							</tr>
						</thead>
		
						<tbody>
							<c:forEach var="article" items="${articles}">
								<tr class="hover">
									<td>${article.id}</td>
									<td>${article.regDate.substring(2,16)}</td>
									<td><a class="hover:underline" href="detail?id=${article.id}">${article.title}</a></td>
									<td>${article.writerName}</td>
									<td>${article.hitCount}</td>
									<td>${article.sumReactionPoint}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</section>
<%@ include file="../common/foot.jsp"%>
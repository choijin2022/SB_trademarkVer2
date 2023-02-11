<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MyWork" />
<%@ include file="../common/head.jsp"%>

<!-- <div class="side-bar"> -->
<!-- 	<div class="status-icon"> -->
<!-- 		<div>▶</div> -->
<!--     	<div>▼</div> -->
<!-- 	</div> -->
<!-- 	<nav class="manu-box-1"> -->
<!-- 	<input id="check-menu-btn" type="checkbox" /> -->
<!--     <label for="check-menu-btn">프로젝트 이름</label> -->
<!-- 		<ul class="menubars"> -->
<!-- 			<li><a href="list?boardId=3">테스트 1</a></li> -->
<!-- 			<li><a href="">테스트 2</a></li> -->
<!-- 		</ul> -->
	
<!-- 	</nav> -->
<!-- </div> -->

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="project-box-1">
			<input id="project-name" type="checkbox" />
		    <label for="project-name">프로젝트 이름</label>
			<ul class="project-sub-name">
				<li><a class="bold" href="list?boardId=3">프로젝트 이름</a></li>
				<li><a href="list?boardId=3&subBoardId=1">테스트 1</a></li>
				<li><a href="">테스트 2</a></li>
			</ul>
		</div>
	</div>
</section>


<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1 show-project-list">
			<c:choose>
				<c:when test="${projectCount == 0 }">
					<div class="text-center mt-4">프로젝트가 없습니다</div>
				</c:when>
				<c:otherwise>
					<div class="table-box-type-1 ">
						<table class="table w-full">
							<colgroup>
								<col width="60" />
								<col />
								<col width="150" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>프로젝트</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody >
								<tr class="hover" id="\${value.id}">
									<td>\${thisIndexNum}</td>
									<td><span id="\${value.id}" class="hover:underline select-project-td">\${value.name}</span></td>
									<td>\${value.regDate.substring(0,11)}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>


<%@ include file="../common/foot.jsp"%>
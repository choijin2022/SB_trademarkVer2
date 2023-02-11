<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="list" />
<%@ include file="../common/head.jsp"%>

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


<%@ include file="../common/foot.jsp"%>
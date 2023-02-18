<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="WorkMain" />
<%@ include file="../common/head.jsp"%>




<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		
		<div>
			<span> 전체 프로젝트 </span> 
<%-- 			<c:if test="${projectCount } > 0"> --%>
				<span> ${projectCount } 개</span>
<%-- 			</c:if> --%>
		</div>
		<div class="mb-2 flex justify-between items-center">
			<div class="folder-list-btn-wrapper m-2 flex">
				<div id="btn-modal"  class="btn btn-grey btn-new-folder btn-modal mr-3" title="새 폴더" style="width:70%; min-height:2rem; height:2rem;">
					<i class="fas fa-plus mr-10"></i>
					새폴더
				</div>
				<div class="btn btn-grey btn-sync btn-reload" title="새로 고침" style="min-height:2rem; height:2rem;">
					<i class="fas fa-sync"></i>
				</div>
			</div>
			
			<form>
				<input type="hidden" name="boardId" value="${boardId }" />
				
				<select data-value="${searchKeywordTypeCode }" class="select select-bordered" name="searchKeywordTypeCode">
					<option value="name">제목</option>
					<option value="body">내용</option>
					<option value="name,body">제목 + 내용</option>
				</select>
				
				<input class="ml-2 w-84 input input-bordered" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요" maxlength="20" value="${searchKeyword }" />

				<button class="ml-2 btn btn-active btn-ghost">검색</button>
			</form>
		</div>
		<c:choose>
			<c:when test="${projectCount == 0 }">
				<div class="text-center mt-4">조건에 일치하는 검색결과가 없습니다</div>
			</c:when>
			<c:when test="null">
				<section>
					<div><span> 서버 또는 DB 연결 확인!!</span></div>
				</section>				
			</c:when>
			<c:otherwise>
				<c:forEach var="project" items="${projects}">
					<section>
						<div class="projectCard">
							<header>
								<div class="title">
									<div class="editableInputWrap notHoverEdit undefined">
										<div class="editable__input">
											<div class="input-comp-wrapper">
												<input class="form-input-comp" type="hidden" value="${project.name}"/>
											</div>
										</div>
										<div class="editable__label">
											<a target="_blank" href="myWork?projectId=${project.id}"><span class="project-title-link">${project.name }</span></a>
										</div>
									</div>
								</div>
								<div class="projectCard__btnGroup text-right">
									<div title="수정" class="btn-icon mr-2"><i aria-hidden="true" class="fas fa-pencil-alt"></i></div>
									<div title="삭제" class="btn-icon mr-5"><i aria-hidden="true" class="fas fa-trash-alt"></i></div>
								</div>
							</header>
							<div class="projectCard-cts">
								<div class="row mb-2 flex">
									<div class="cts_infos col-sm-7 col-xs-7">
										<div class="info-item-wrapper">
											<span class="info-item-label">관리번호</span>
											<div class="editableInputWrap notHoverEdit"></div>
										</div>
										<div class="info-item-wrapper">
											<span class="info-item-label">업체명</span>
											<div class="editableInputWrap notHoverEdit"></div>
										</div>
										<div class="info-item-wrapper">
											<span class="info-item-label">생성일</span>
											<div>${project.regDate}</div>
										</div>
										<div class="info-item-wrapper">
											<span class="info-item-label">최종수정일</span>
											<div>${project.updateDate}</div>
										</div>
										<div class="info-item-wrapper">
											<span class="info-item-label">상표수</span>
											<div></div>
										</div>
									</div>
									<div class="col-sm-5 col-xs-5">
										<div class="clearfix cts__memo">
											<div class="projectMemo">
												<div class="memo__header">메모장</div>
				<!-- 								<textarea name="" id="" cols="33" rows="5" style="display: none; opacity: 0; z-index: 0;"></textarea> -->
												<textarea name="" id="projectTextarea" cols="40" rows="5" ></textarea>
				<!-- 								<div class="contents" style="opacity: 1; z-index: 999; overflow: hidden auto;"></div> -->
												<div class="contents" style="opacity: 1; overflow: hidden auto;"></div>
												
												<div class="project-memo-btn-wrapper">
													<span style="float: right; font-size: 11px; margin-top: 3px;"></span>
													<div class="btn-project-memo"><a href="" class="fas fa-pencil-alt"></a>
													</div>
													<div class="btn-project-memo"><a href="" class="fas fa-trash-alt"></a>
													</div>
													<div class="btn-text"><span>저장</span></div>
													<div class="btn-text"><span>취소</span></div>
												</div>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</section>
				</c:forEach>
			</c:otherwise>
			
		</c:choose>
		
		

		
		
	</div>
</section>












<!--  표
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
-->

<script>
// 새로고침 버튼 클릭 이벤트
$(document).on('click', '.btn-reload', function(){
	location.reload();
});


</script>

<%@ include file = "../common/projectCreateModal.jsp" %>
<%@ include file="../common/foot.jsp"%>
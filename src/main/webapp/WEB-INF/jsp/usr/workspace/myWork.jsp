<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <c:set var="pageTitle" value="MyWork" /> --%>
<%@ include file="../common/fullTypeHead.jsp"%>

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
<script>



</script>



<section class="text-xl">
	<div class="container">
		<div class="requireAuthentication">
			<div id="warp" class="blankWrap myWork" style="height: 100%; padding-bottom: 0px;">
				<div class="blankContents project-manage-page" style="height: calc(100% - 60px); padding: 0px;">
					<div class="fullTypeCntWrap" style="height: 100%; min-height: 770px;">
						<div class="myWorkFrameSetA FrameSplitter flex" style="min-height: 100%; height: 612.4px;">
							
							<div class="splitter_panel" style="width: 280px;top: 0px;">
								<div id="MYWORK-FOLDER-LIST-SECTION" style="overflow: hidden;">
									<div class="ltCnt myWorkSideBar side-bar " style="margin: 0px; height: 100%; overflow: auto; box-sizing: border-box; position: fixed;">
										<div class="folder-list-btn-wrapper m-2 flex justify-evenly">
											<div id="btn-modal"  class="btn btn-grey btn-new-folder btn-modal" title="새 폴더" style="width:60%; min-height:2rem; height:2rem;">
												<i class="fas fa-plus mr-10"></i>
<!-- 												<button id="btn-modal" class="btn btn-outline btn-accent container w-1/6 flex mt-5 btn-modal" >새폴더</button> -->
												새폴더
											</div>
											<div class="btn btn-grey btn-sync btn-reload" title="새로 고침" style="min-height:2rem; height:2rem;">
												<i class="fas fa-sync"></i>
											</div>
										</div>
										<div class="loader" style="display: none;">
											<div class="loader-img fixed">
												<img width="50" height="50" src="https://item.kakaocdn.net/do/c5c470298d527ef65eb52883f0f186c48f324a0b9c48f77dbce3a43bd11ce785" />
											</div>
										</div>
										<div class="tree-wrapper hierarchyWrapper">
											<dl class="projTechWrap" style="padding: 0px; height: calc(100% - 50px);">
												<dt style="color: rgb(0, 153, 153); font-weight: bold; font-size: 14px;"></dt>
												<dd>
													<ul>
														<li>
															<div class="project-title project-link active">
																<a href="myWork?projectId=${project.id}">
																	<span class="items project_item"> ${project.name }</span>
																</a>
															</div>
 															<!--프로젝트 리스트 -->
 															<c:choose>
																<c:when test="${subProjectCount == 0}">
																	<ul class="inTree hover" >
																		<li><a href="list?projectId=${project.id}">${subProjectName}</a></li>
																	</ul>
																</c:when>
																<c:otherwise>
		 															<c:forEach var="subProjectName" items="${subProjectName}">
																	<ul class="inTree hover" >
																		<li><a href="list?projectId=${project.id}">${subProjectName}</a></li>
																	</ul>
																	</c:forEach>
																</c:otherwise>
															</c:choose>
														</li>
													</ul>
												
												</dd>
											</dl>
										</div>
									</div>
							
								</div>
							</div>
							<div class="splitter_panel" style="width: calc(100% - 300px);">
								<div id="MYWORK-CONTENT-SECTION" class="project-manage contents rtCnt" style="padding-bottom: 0px;"></div>
<!-- 									<div class="project-info-section " style="position: relative; z-index: -1;"> -->
									<div class="project-info-section " style="position: relative; z-index: 0;">
										<section>
											<div class="projectCard" style="border-width: 0px;">
												<header style="padding: 10px 0px; border-bottom: 0px">
													<div class="title"><span> ${project.name } </span></div>
													<div class="projectCard__btnGroup text-right">
														<div title="수정" class="btn-icon mr-2"><i aria-hidden="true" class="fas fa-pencil-alt"></i></div>
														<div title="삭제" class="btn-icon mr-5"><i aria-hidden="true" class="fas fa-trash-alt"></i></div>
													</div>
												</header>
												<div class="projectCard-cts" >
													<div class="row mb-2 flex flex justify-between">
														<div class="cts_infos project_info_width_40" style="border:1px solid #e4e7ea;">
															<div class="m-3">
																<div class="info-item-wrapper">
																	<span class="info-item-label">관리번호</span>
																	<div class="editableInputWrap notHoverEdit">${project.projectCode }</div>
																</div>
																<div class="info-item-wrapper">
																	<span class="info-item-label">업체명</span>
																	<div class="editableInputWrap notHoverEdit">${project.company}</div>
																</div>
																<div class="info-item-wrapper">
																	<span class="info-item-label">생성일</span>
																	<div>${project.regDate.substring(0,11)}</div>
																</div>
																<div class="info-item-wrapper">
																	<span class="info-item-label">최종수정일</span>
																	<div>${project.updateDate.substring(0,11)}</div>
																</div>
																<div class="info-item-wrapper">
																	<span class="info-item-label">상표수</span>
																	<div> ${allTrademarkCount} </div>
																</div>
															</div>
														</div>
														<div class="project_memo_width_55_left" >
															<div class="clearfix cts__memo">
																<div class="projectMemo">
																	<div class="memo__header">메모장</div>
																	<textarea name="" id="projectTextarea" cols="40" rows="5" ></textarea>
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
									</div>
<!-- 									<div class="project-trademark-search-container" style="position: relative; z-index: -1;"> -->
									<div class="project-trademark-search-container" style="position: relative; z-index: 0;">
										<section >
											<div class="mb-2 flex justify-between items-center">
												<div>
													<c:if test="${subProjectCount > 0}" >
														<span>${subProjectCount} 개</span>
													</c:if>
												</div>
												<form>
													<input type="hidden" name="boardId" value="${boardId }" />
													
													<select data-value="${searchKeywordTypeCode }" class="select select-bordered" name="searchKeywordTypeCode">
														<option value="title">상표명</option>
														<option value="body">내용</option>
														<option value="title,body">상표명 + 내용</option>
													</select>
													
													<input class="ml-2 w-84 input input-bordered" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요" maxlength="20" value="${searchKeyword }" />
									
													<button class="ml-2 btn btn-active btn-ghost">검색</button>
												</form>
											</div>
										</section>
									
									</div>
									<div>
										<section>
											<div class="sub-project-menu-box-1">
												<input id="project-name" type="checkbox" />
											    <label for="project-name">프로젝트 이름</label>
												<ul class="project-sub-name">
													<li><a class="bold" href="list?boardId=3">프로젝트 이름</a></li>
													<li><a href="list?boardId=3&subBoardId=1">테스트 1</a></li>
													<li><a href="">테스트 2</a></li>
												</ul>
											</div>
										</section>
									</div>
							
							</div>
							
						
						</div>
					</div>
					
				</div>
			</div>
		</div>					
	</div>
</section>	
	


<script>
// 새로고침 버튼 클릭 이벤트
$(document).on('click', '.btn-reload', function(){
	location.reload();
});


</script>









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


<%@ include file = "../modal/projectCreate.jsp" %>
<%@ include file="../common/foot.jsp"%>
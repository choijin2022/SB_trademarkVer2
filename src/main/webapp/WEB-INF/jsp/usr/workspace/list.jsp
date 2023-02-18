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
							
<!-- 							<div class="splitter_panel hide-panel"> -->
<!-- 								<div class="splitter_handle"> -->
<!-- 									<em class="fa fa-caret-right" style="color: rgb(255, 255, 255); line-height: 195px;"></em> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="splitter_panel show-panel"> -->
<!-- 								<div id="MYWORK-FOLDER-LIST-SECTION" style="overflow: hidden;"> -->
<!-- 									<div class="ltCnt myWorkSideBar"> -->
<!-- 									<div id="projectTreeHandle" class="projectTreeHandle"></div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
							
							<div class="splitter_panel" style="width: 280px;top: 0px;">
								<div id="MYWORK-FOLDER-LIST-SECTION" style="overflow: hidden;">
									<div class="ltCnt myWorkSideBar side-bar " style="margin: 0px; height: 100%; overflow: auto; box-sizing: border-box; position: fixed;">
										<div class="folder-list-btn-wrapper m-2 flex justify-evenly">
											<div class="btn btn-grey btn-new-folder btn-modal" title="새 폴더" style="width:60%; min-height:2rem; height:2rem;">
												<i class="fas fa-plus mr-10"></i>
												새폴더
											</div>
											<div class="btn btn-grey btn-sync" title="새로 고침" style="min-height:2rem; height:2rem;">
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
													<div class="title"> <span style="font-size:30px">${project.name } </span></div>
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
												<c:if test="${trademarks.size() > 0}" >
														<span>${trademarks.size()} 개</span>
												</c:if>
												<form>
													<input type="hidden" name="boardId" value="${boardId }" />
													
													<select data-value="${searchKeywordTypeCode }" class="select select-bordered" name="searchKeywordTypeCode">
														<option value="name">상표명</option>
														<option value="body">내용</option>
														<option value="name,body">상표명 + 내용</option>
													</select>
													
													<input class="ml-2 w-84 input input-bordered" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요" maxlength="20" value="${searchKeyword }" />
									
													<button class="ml-2 btn btn-active btn-ghost">검색</button>
												</form>
											</div>
										</section>
									
									</div>
									<div class="project-trademard-list-container">
										<section>
											<c:choose>
												<c:when test="${trademarkCount == 0}">
													<div class="text-center py-2">조건에 일치하는 검색결과가 없습니다</div>
												</c:when>
												<c:otherwise>
													<div class="table-box-type-1">
														<table class="table w-full">
															<thead>
																<tr>
																	<th style="width :2px"><input type="checkbox" class="checkbox-all-member-id" /></th>
																	<th style="width :2.5px">No</th>
																	<th style="width:150px;">이미지</th>
																	<td>이름</td>
																	<th>출원번호</th>
																	<th>출원일자</th>
																	<th>상품분류</th>
																	<th style="width :1px">유사군</th>
																	<th>법적상태</th>
																	<th>출원인 이름</th>
																</tr>
															</thead>
											
															<tbody style="font-size: 1rem;">
																<c:forEach var="trademark" items="${trademarks}">
																	<tr class="hover">
																		<td style="width :2px"><input type="checkbox" class="checkbox-member-id" value="${trademark.id }" /></td>
																		<td style="width :2.5px">${trademark.indexNo}</td>
																		<td><img style="width:200px;" src="${trademark.bigDrawing}"/></td>
																		<td>${trademark.title}</td>
																		<td>${trademark.applicationNumber}</td>
																		<td>${trademark.applicationDate}</td>
																		<td>${trademark.classificationCode}</td>
																		<td>${trademark.similarityCode}</td>
																		<td>${trademark.applicationStatus}</td>
																		<td>${trademark.applicantName}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</c:otherwise>
											</c:choose>
											
											
											
											<div class="mt-2 flex justify-between">
												<button class="btn-text-link btn btn-active btn-ghost btn-create-word-file">워드 생성</button>
<!-- 												<button class="btn-text-link btn btn-active btn-ghost btn-download-selected-trademark">상표 다운로드</button> -->
												<button class="btn-text-link btn btn-active btn-ghost btn-delete-selected-trademark">상표 삭제</button>
											</div>
<!-- 											생성 : api/word  -->
											<form method="GET" name="do-create-word-form" action="/api/word">
												<input type="hidden" name="ids" value="" />
											</form>
<!-- 											다운로드 workspace/download -->
<!-- 											<form method="POST" name="do-download-trademarks-form" action="/usr/workspace/download"> -->
<!-- 											<form method="get" name="do-download-trademarks-form" action="/api/word"> -->
<!-- 												<input type="hidden" name="ids" value="" /> -->
<!-- 											</form> -->
											
											<form method="POST" name="do-delete-trademarks-form" action="/usr/trademark/doDeleteTrademarks">
												<input type="hidden" name="ids" value="" />
											</form>
																						
											<div class="page-menu mt-2 flex justify-center">
												<div class="btn-group">
													<c:set var="pageMenuLen" value="5" />
													<c:set var="startPage" value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1}" />
													<c:set var="endPage" value="${page + pageMenuLen <= pagesCount ? page + pageMenuLen : pagesCount}" />
													
													<c:set var="pageBaseUri" value="?searchKeywordTypeCode=${searchKeywordTypeCode }&searchKeyword=${searchKeyword }" />
									
													<c:if test="${membersCount != 0 }">
														<c:if test="${page == 1 }">
															<a class="btn btn-sm btn-disabled">«</a>
															<a class="btn btn-sm btn-disabled">&lt;</a>
														</c:if>
														<c:if test="${page > 1 }">
															<a class="btn btn-sm" href="${pageBaseUri }&page=1">«</a>
															<a class="btn btn-sm" href="${pageBaseUri }&page=${page - 1 }">&lt;</a>
														</c:if>
														<c:forEach begin="${startPage }" end="${endPage }" var="i">
															<a class="btn btn-sm ${page == i ? 'btn-active' : ''}" href="${pageBaseUri }&page=${i }">${i }</a>
														</c:forEach>
														<c:if test="${page < pagesCount }">
															<a class="btn btn-sm" href="${pageBaseUri }&page=${page + 1 }">&gt;</a>
															<a class="btn btn-sm" href="${pageBaseUri }&page=${pagesCount }">»</a>
														</c:if>
														<c:if test="${page == pagesCount }">
															<a class="btn btn-sm btn-disabled">&gt;</a>
															<a class="btn btn-sm btn-disabled">»</a>
														</c:if>
													</c:if>
												</div>
											</div>
										</section>
										
										
										
										<script>
										// 삭제
										$('.btn-delete-selected-trademark').click(function() {
											
											const values = $('.checkbox-member-id:checked').map((index, el) => el.value).toArray();
											if (values.length == 0) {
												alert('선택한 상표가 없습니다');
												return;
											}
											if (confirm('선택한 상표를 삭제하시겠습니까?') == false) {
												return;
											}
											
											console.log(values);
											
											$('input[name=ids]').val(values.join(','));
											$('form[name=do-delete-trademarks-form]').submit();
											
											console.log($('form[name=do-delete-trademarks-form]'));
										})
										
										// 다운로드
										$('.btn-download-selected-trademark').click(function() {
											
											const values = $('.checkbox-member-id:checked').map((index, el) => el.value).toArray();
											if (values.length == 0) {
												alert('선택한 상표가 없습니다');
												return;
											}
											if (confirm('선택한 상표를 다운로드하시겠습니까?') == false) {
												return;
											}
											
											console.log(values);
											
											
											$('input[name=ids]').val(values.join(','));
											$('form[name=do-download-trademarks-form]').submit();
											
										console.log($('form[name=do-download-trademarks-form]'));
										})
										
										// word생성
										$('.btn-create-word-file').click(function() {
											const values = $('.checkbox-member-id:checked').map((index, el) => el.value).toArray();
											if (values.length == 0) {
												alert('선택한 상표가 없습니다');
												return;
											}
											if (confirm('word를 생성하겠습니까?') == false) {
												return;
											}
											
											console.log(values);
											
											$('input[name=ids]').val(values.join(','));
											$('form[name=do-create-word-form]').submit();
											
											console.log($('form[name=do-delete-trademarks-form]'));
										})
									
										//체크박스 선택
											$('.checkbox-all-member-id').change(function() {
											const allCheck = $(this);
											const allChecked = allCheck.prop('checked');
											$('.checkbox-member-id').prop('checked', allChecked);
											$('.checkbox-member-id:is(:disabled)').prop('checked', false)
										})
										
										$('.checkbox-member-id').change(function() {
											const checkboxMemberIdCount = $('.checkbox-member-id').length;
											const checkboxMemberIdCheckedCount = $('.checkbox-member-id:checked').length;
											const checkboxDisabledCount = $('.checkbox-member-id:is(:disabled)').length;
											const allChecked = (checkboxMemberIdCount - checkboxDisabledCount) == checkboxMemberIdCheckedCount;
											$('.checkbox-all-member-id').prop('checked', allChecked);
										})
										</script>
										
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>					
	</div>
</section>	










<%@ include file = "../modal/projectSubCreate.jsp" %>
<%@ include file="../common/foot.jsp"%>
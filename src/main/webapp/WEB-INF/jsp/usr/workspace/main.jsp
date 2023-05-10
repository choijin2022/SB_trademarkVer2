<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="workMain" />
<%@ include file="../common/head.jsp"%>

<script>
/*  
const params = {};
params.id = parseInt('${param.id}');
console.log(params);
function mainPage__getMemo() {
	
	$.get('../memo/getMemo', {
		loginedMemberId : params.id,
		relTypeCode : "workMain",
		ajaxMode : 'Y'
	}, function(data){
		let mainPageMemo = $('#main-page-memo');
		mainPageMemo.val(data);
// 		if(!data){
// 		}
		
	}, 'json');
}

$(function(){
//		실전코드
	mainPage__getMemo();
	
})

*/
</script>



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
			
<!-- 			검색 기능 -->
			<form>
				<input type="hidden" name="boardId" value="${boardId }" />
				
				<select data-value="${searchKeywordTypeCode }" class="select select-bordered" name="searchKeywordTypeCode">
					<option value="name">제목</option>
					<option value="body">업체명</option>
					<option value="name,body">제목 + 업체명</option>
				</select>
				
				<input class="ml-2 w-84 input input-bordered" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요" maxlength="20" value="${searchKeyword }" />

				<button class="ml-2 btn btn-active btn-ghost">검색</button>
			</form>
		</div>
		<c:choose>
			<c:when test="${projectCount == 0 }">
				<div class="text-center mt-4">조건에 일치하는 검색결과가 없습니다</div>
				<c:when test="null">
					<section>
						<div><span> 서버 또는 DB 연결 확인 필요!!</span></div>
					</section>				
				</c:when>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="project" items="${projects}">
					<section>
						<div class="projectCard">
							<header>
								<div class="title">
									<div class="editableInputWrap notHoverEdit undefined">
										<div class="editable__label flex">
											<div class ="project-name-for-input hidden" ><input type="text" id="${project.id}" value="${project.name}"/></div>
											<button class="rename-project-update-btn hidden ml-3">수정</button>
											<a target="_blank" href="myWork?projectId=${project.id}"><span class="project-title-link">${project.name }</span></a>
										</div>
									</div>
								</div>
								<div class="projectCard__btnGroup text-right">
									<div id="${project.id}" title="수정" class="btn-icon mr-2 rename-project-btn"><i aria-hidden="true" class="fas fa-pencil-alt"></i></div>
									<div id="${project.id}" title="삭제" class="btn-icon mr-5 delete-project-btn"><i aria-hidden="true" class="fas fa-trash-alt"></i></div>
								</div>
							</header>
							<div class="projectCard-cts">
								<div class="row mb-2 flex">
									<div class="cts_infos col-sm-7 col-xs-7">
										<div class="info-item-wrapper">
											<span class="info-item-label">관리번호</span>
											<div class="editableInputWrap notHoverEdit">${project.projectCode}</div>
										</div>
										<div class="info-item-wrapper">
											<span class="info-item-label">업체명</span>
											<div class="editableInputWrap notHoverEdit">${project.company}</div>
										</div>
										<div class="info-item-wrapper">
											<span class="info-item-label">생성일</span>
											<div>${project.regDate}</div>
										</div>
										<div class="info-item-wrapper">
											<span class="info-item-label">최종수정일</span>
											<div>${project.updateDate}</div>
										</div>
<!-- 										<div class="info-item-wrapper"> -->
<!-- 											<span class="info-item-label">상표수</span> -->
<!-- 											<div></div> -->
<!-- 										</div> -->
									</div>
									<div class="col-sm-5 col-xs-5">
										<div class="clearfix cts__memo">
											<div class="projectMemo">
												<form id="memoForm" action="/usr/memo/doWrite" method="post">
													<input type="hidden" name="memoCode" value="" />
													<input type="hidden" name="projectId" value="" />
													<div class="memo__header">메모장</div>
													<textarea name="body" form="memoForm" id="main-page-memo" cols="40" rows="5" >${project.memoBody}</textarea>
													<div class="contents" style="opacity: 1; overflow: hidden auto;"></div>
													
													<div class="project-memo-btn-wrapper">
														<span style="float: right; font-size: 11px; margin-top: 3px;"></span>
	<!-- 													<div class="btn-project-memo"><a href="" class="fas fa-pencil-alt"></a></div> -->
	<!-- 													<div class="btn-project-memo"><a href="" class="fas fa-trash-alt"></a></div> -->
														<div id="${project.id}" class="btn-mainpage-memo-save btn-text"><span>저장</span></div>
	<%-- 													<div id="${project.id}" class="btn-mainpage-memo-retraction btn-text"><span>취소</span></div> --%>
													</div>
												</form>
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


<script>
// 새로고침 버튼 클릭 이벤트
$(document).on('click', '.btn-reload', function(){
	location.reload();
});

// 메모 저장 클릭 이벤트
$('.btn-mainpage-memo-save').click(function(){
	let projectId = parseInt($(this).attr('id'));
	let memoCode = "${pageTitle}";
	let body = $("#main-page-memo").val();
	console.log("projectId ",projectId );
	console.log("memoCode ",memoCode );
	console.log("body ",body );
	$('input[name=projectId]').val(projectId);
	$('input[name=memoCode]').val(memoCode);
	//ajax 시작
	$.ajax({
		url : "/usr/memo/doWrite",
		type : 'post',
		data : {
			memoCode : memoCode,
			projectId : projectId,
			body : body,
		},
		async : false,
		beforeSend : function(xhr, opts) {
	        // when validation is false
	        if (false) {
	            xhr.abort();
	        }
	    },
		success : function(data) {
			console.log(data);	
			location.reload();
	     },
		error : function(e) {
			alert(e.responseText);
		}
	});
	
	
});

</script>

<script>
<!-- // 클릭시 프로젝트 네임 수정 -->
 $('.rename-project-btn').click(function(){
	 
	console.log("이름 바꾸기");
	
	let renameText = $(this).parent().siblings().children().children().children('.project-name-for-input');
 	let nameText = $(this).parent().siblings().children().children().children().children('.project-title-link');
 	let nameTextInput = renameText.children().first();
 	let renameButton  = $(this).parent().siblings().children().children().children('.rename-project-update-btn');
 	
 	let projectId = $(this).attr('id');
 	
 	renameText.removeClass("hidden");
 	renameButton.removeClass("hidden");
 	nameText.addClass("hidden");
	
 	console.log(projectId);
 	console.log(renameText);
 	console.log(nameText);
 	console.log(nameTextInput);
 	$('.rename-project-update-btn').click(function(){
//  	$(document).on('click', '.rename-project-update-btn', function(){	
 		let newName = nameTextInput.val();	
		rename_update(projectId, newName);
		
		location.reload();
		
 	 });
 	
 	$(document).mouseup(function (e){
		if( renameText.has(e.target).length === 0){
			let newName = nameTextInput.val();
			console.log(newName);
		
			renameText.addClass("hidden");
			renameButton.addClass("hidden");
			nameText.removeClass("hidden");
		}
 	});
 	
 	 
 	
 });

//프로젝트 이름 업데이트 버튼 클릭 후, 프로젝트 이름 업데이트
 function rename_update(projectId, rename){
 	console.log(projectId);
 	
  	let params="projectId="+projectId+"&rename="+rename;
  	console.log(rename);
  	
 	//ajax 시작
 	xhr = $.ajax({
 		url : "/usr/project/renameProject",
 		type : 'GET',
 		data : params,
 		success : function(data) {
 			console.log(data);	
 			
 	     },
 		error : function(e) {
 			alert(e.responseText);
 		}
 	});
 	
 	return;
 	
 }
 
 
 
//클릭시 프로젝트 삭제
 $('.delete-project-btn').click(function(){
	 let projectId = $(this).attr('id');
	 delete_project(projectId);
 })

 function delete_project(projectId){
 	console.log(projectId);
 	let projectParams="projectId="+projectId;
 	if (confirm('선택한 프로젝트를 삭제하시겠습니까?') == false) {
 		return;
 	}
 	
 	//ajax 시작
 	$.ajax({
 		url : "/usr/project/deleteProject",
 		type : 'GET',
 		data : projectParams,
 		success : function(data) {
 			console.log(data);	
 			
 			alert("프로젝트 삭제 성공")
 	     },
 		error : function(e) {
 			alert(e.responseText);
 		}
 	});
 	
 	
 	return;
 };

 
 // 새로고침
  function doReload(){
	  location.reload();
 }
 </script>







<%@ include file = "../modal/projectCreate.jsp" %>
<%@ include file="../common/foot.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Search" />
<%@ include file="../common/head.jsp"%>


<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
			<form>
			<div class="table-box-type-1">
				<table class="table table-zebra w-full">
<%-- 					<colgroup> --%>
<%-- 						<col width="200" /> --%>
<%-- 					</colgroup> --%>

					<tbody>
						<tr>
							<th>보기</th>
							<td>
								<select name="numOfRows" class="select select-bordered w-full">
									<option value="${trademarks[0].numOfRows}">${trademarks[0].numOfRows}개씩 보기</option>
<!-- 									<option value="50">50개씩 보기</option> -->
								</select>
							</td>
						</tr>
						<tr>
							<th>단어</th>
							<td>
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="searchString" placeholder="단어" value="${trademarks[0].searchString}"/>
								<div></div>
							</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<th>년도</th> -->
<!-- 							<td><input maxlength="4" class="input input-ghost w-full text-lg border-gray-400" type="text" name="searchRecentYear" placeholder="년도" /></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th>제목</th> -->
<%-- 							<td><input maxlength="800" class="input input-ghost w-full text-lg border-gray-400" type="text" name="title" placeholder="제목" value="${title}" /></td> --%>
<!-- 						</tr> -->
						<tr>
							<td colspan="2"><button class="btn btn-outline btn-accent w-full ">검색</button></td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</form>
	</div>
</section>


<script>
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
function selectAllTrademark(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
}
</script>


<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<table class="table table-zebra w-full">
			<thead>
				<tr>
					<th class="text-sm"><input type="checkbox" class="checkbox-all-member-id" onclick='selectAllTrademark(this)'></th>
					<th class="text-sm">No</th>
					<th class="text-sm">이미지</th>
					<th class="text-sm">출원번호</th>
					<th class="text-sm">출원일자</th>
					<th class="text-sm">상품분류</th>
					<th class="text-sm">법적상태</th>
					<th class="text-sm">출원인 이름</th>
				</tr>
			</thead>

			<tbody id="product">
				<c:if test="${trademarks[0].itemsTotalCount != 0 }">
					<h2><span class="ml-2 text-base hitCount"> total ${trademarks[0].itemsTotalCount} </span ></h2>
					<c:forEach var="trademark" items="${trademarks}" begin="0" end="${trademarks[0].numOfRows}" step="1" varStatus="status">
<%-- 								<input type="hidden" name="${trademark.indexNo}" value="${trademark}"/> --%>
							
						<tr class="hover">
							<td><input name="checkbox-member-id" type="checkbox" class="checkbox-member-id" value="${trademark.indexNo},${trademark.title},${trademark.applicantName},${trademark.applicationNumber},${trademark.applicationDate},${trademark.publicationNumber},${trademark.publicationDate},${trademark.registrationNumber},${trademark.registrationDate},${trademark.registrationPublicNumber},${trademark.registrationPublicDate},${trademark.priorityNumber},${trademark.priorityDate},${trademark.internationalRegisterNumber},${trademark.internationalRegisterDate},${trademark.applicationStatus},${trademark.classificationCode},${trademark.viennaCode},${trademark.agentName},${trademark.regPrivilegeName},${trademark.fullText},${trademark.drawing},${trademark.bigDrawing}" /></td>
							<td>${trademark.indexNo}</td>
							<td><img style="width:150px;" src="${trademark.bigDrawing}"/></td>
							<td>${trademark.applicationNumber}</td>
							<td>${trademark.applicationDate}</td>
							<td>${trademark.classificationCode}</td>
							<td>${trademark.applicationStatus}</td>
							<td>${trademark.applicantName}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="storeButton mt-2 flex justify-end justify-right">
<!-- 			<input class="btn-outline btn-accent container w-1/6 flex justify-right mt-5 btn-modal" type='button' value='폴더생성' onclick='setClassName()'/> -->
			<button id="btn-modal" class="btn btn-outline btn-accent container w-1/6 flex mt-5 btn-modal" >저장</button>
<!-- 			<button class="btn btn-outline btn-accent container w-1/6 flex justify-left mt-5 btn-stored-selected-trademark" >저장</button> -->
		</div>	
<!-- 		</form> -->
	</div>
	

	
	<div class="pageNav flex justify-center mt-5">
		<div class="btn-group">
			<c:set var="maxPageNum" value="5" />
		</div>
	</div>
		
</section>

<section>
<!-- 	<div id="modal" class="modal"> -->
<!--       <div id="modal_body" class="modal_body">Modal ?????????</div> -->
<!--     </div> -->
   
	<div id="modal_test" class="modal_test"> 
		<div id="modal_body" class="modal_body">
			<div id="project-list" class="project-list">
				<div>프로젝트 리스트</div>
				<div class="table-box-type-1 show-project-list">
					<c:choose>
						<c:when test="${projectCount == 0 }">
							<div class="text-center mt-4">프로젝트가 없습니다</div>
						</c:when>
						<c:otherwise>
							<div class="table-box-type-1 of-y-scroll">
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
									<tbody id="product-modal" class="">
										
									</tbody>
								</table>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		
			<div id="project-create" class="project-create">
				<div>프로젝트 이름</div>
					<div><input class="input input-bordered w-full max-w-xs" type="text" name="name" placeholder="프로젝트 이름을 입력해주세요" /></div>
				<div>파일이름</div>
				<div>
					<input class="input input-bordered w-full max-w-xs" type="text" name="subProjectName" placeholder="제목을 입력해주세요" value="새파일"/>
				</div>
			</div>
			
			<div class="storeButton flex justify-center container mt-3">
				<div id="control-tri-btn" class="flex justify-between items-center mt-2 mb-2">
					<div class="change-btn mr-2" id="change-btn">
						<button id="show-creat-project-btn" class="btn btn-outline btn-accent flex show-creat-project-btn" >새프로젝트</button>
						<button id="creat-project-btn" class="btn btn-outline btn-accent flex creat-project-btn" >프로젝트 저장</button>
					</div>
					<button class="mr-2 btn btn-outline btn-accent btn-stored-selected-trademark" >저장</button>
					<button id="modal-close-btn" type="button" class="modal-close-btn">CLOSE</button>
				</div>
			</div>
		</div>
	</div>
	
</section>

<section>


</section>

<!-- <form method="POST" name="do-stored-trademark-form" action="../trademark/storedTrademark" onsubmit="return false;"> -->
<form method="POST" name="do-stored-trademark-form" action="../trademark/storedTrademark" >
<!-- <form id = "checkedTd" name="do-stored-trademark-form"  > -->
	
	<input type="hidden" name="test" value="" />
	<input type="hidden" name="projectId" value="" />
	
</form>


<script>
let setProjectId;
const modal = document.getElementById("modal_test")
const modal_body =document.getElementById("modal_body")
const btnModal = document.getElementById("btn-modal")

btnModal.addEventListener("click", function(event){
	let testStatus = false;
	let projectIdStatus = false;
	
	checkboxMemberIdCheckedCount = $('.checkbox-member-id:checked').length;
	
	if(checkboxMemberIdCheckedCount != 0){
		testStatus = true;
	}
	
	if(testStatus == false || !projectIdStatus){
		$('.btn-stored-selected-trademark').prop("disabled", true);
	}
	console.log(checkboxMemberIdCheckedCount);
	
	$('.project-list').show();
	$('.show-creat-project-btn').show();
	$('.creat-project-btn').hide();
	
	
	
	$.get('../project/getProject', {
		
		ajaxMode : 'Y'
	}, function(data){
		console.log("data---------------",data);
		let projectLitHtml = ""
		
		if(data == null){
			projectLitHtml = `
				<tr class="hover" >
					<td colspan="3">프로젝트가 없습니다.</td>
				</tr>
			`
			$("#product-modal").html(projectLitHtml);
		
		}else{
		console.log(data);
		
// 		console.log(data.data1[0].id);
// 		console.log(data.data1[0]);
		//$("#product-modal").empty();
		
		
// 		 $.each(data,function(index, value) { 
// // 			 console.log(value.data1); 
// // 			 console.log(index);
// // 			 console.log(value.id); 
// // 			 console.log(value.name);
// 			{index, value.id},
// 			{index, value.name}
			 
// 		 }); 
		 //리스트 생성
		let thisIndexNum = 1;
		console.log($('input[name=checkbox-member-id]').val());
		 $.each(data,function(index, value) { 
			let thisIndex = $(this).find("index");
			console.log(thisIndex);
			console.log(data);
			console.log(index);
			console.log(value.id);
			projectLitHtml += `
				<tr class="hover" id="\${value.id}">
					<td>\${thisIndexNum}</td>
					<td><span id="\${value.id}" class="hover:underline select-project-td">\${value.name}</span></td>
					<td>\${value.regDate.substring(0,11)}</td>
				</tr>
			
			`
			thisIndexNum++;
			console.log(projectLitHtml);
		 }); 
		 
		$("#product-modal").html(projectLitHtml);
		
		
// 		$(document).ready(function(){
// 		    //스크롤 발생 이벤트 처리
// 		    $('#product-modal').scroll(function(){
// 		        var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
// 		        var scrollH = $(this).height(); //스크롤바를 갖는 div의 높이
// 		        var contentH = $('#product-modal').height(); //문서 전체 내용을 갖는 div의 높이
// 		        if(scrollT + scrollH +1 >= contentH) { // 스크롤바가 아래 쪽에 위치할 때
// 		            $('#product-modal').append(projectLitHtml);
// 		        }
// 		    });
// 		}); 
		
		
// 		$('#product-modal').scroll(function(){
// 		    //product-modal 에서 스크롤변화가 발생할때 호출
// 		});
		
		
		//리스트 생성 연습
// 		let projectLitHtml = `
// 			<c:forEach var="project" items="${projects}">
// 			<tr class="hover">
// 				<td>${project.id}</td>
// 				<td><a class="hover:underline" href="detail?id=${project.id}">${project.name}</a></td>
// 				<td>${project.regDate.substring(2,16)}</td>
// 			</tr>
// 		</c:forEach>
		
// 		`;
//     	console.log(projectLitHtml);
//     	$("#product-modal").append(projectLitHtml);
       		
       	
	//1	
// 		let html = `
// 			<c:forEach var="project" items="${projects}">
// 			<tr class="hover">
// 				<td>${project.id}</td>
// 				<td><a class="hover:underline" href="detail?id=${project.id}">${project.name}</a></td>
// 				<td>${project.regDate.substring(2,16)}</td>
// 			</tr>
// 		</c:forEach>
// 		`
// 		$(".show-project-list").empty();
//     	$(".show-project-list").append(html);
		
		//2
//        	let html = `
//    			<tr class="hover" id="\${$(this).find("id")}">
//    				<td>
//    					<input type="checkbox" name="test" class="test" />
//    				</td>
// 				<td >\${$(this).find("id")}</td>
// 				<td >\${ $(this).find("name") }</td>
// 				<td >\${ $(this).find("regDate") }</td>
// 			</tr>
//    		`

			
			
// 			//  style 제거
// 			if(selectId != 0){
// // 				parStyle.removeProperty("background");
// // 				sibStyle.removeProperty("background");

// 				$("#parStyle").css("background", "");
// 				$("#sibStyle").css("background", "");

				
// 			}
			
			console.log(testStatus);
			
			console.log(projectIdStatus);
			
			
			// 특정 프로젝트 클릭시 프로젝트 id input
			$('.select-project-td').click(function() {
				
				
				let projectId = parseInt($(this).attr('id'));
				let selectId = projectId;
				
				if (projectId == 0) {
					alert('선택한 프로젝트가 없습니다');
					return;
				}
				
				
				console.log(testStatus);
				
				console.log(projectIdStatus);
				//$('.btn-stored-selected-trademark').removeAttr("disabled");
			
// 			let parStyle = $('this').parent().prop("style");
// 			let sibStyle = $('.select-project-td').siblings().prop("style");
// 			console.log(parStyle);
// 			console.log(sibStyle);
			
			
			
			// 선택한 프로젝트 style 변화
// 			let parStyle = $(this).parent().css("background", "grey");
// 			let sibStyle = $(this).parent().siblings().css("background", "grey");
			// $(.btn-stored-selected-trademark.prop("disabled", true);
// 			console.log($(this).closest('td').prop('tagName'));
			//console.log($(this).closest('td').prop('style'));
			
            if($(this).hasClass("active")){
            	$(this).parent().removeClass("active");
            	$(this).parent().siblings().removeClass("active");
                $(this).removeClass("active");
            } else{
            	if($('.select-project-td').hasClass("active")){
                    $('.select-project-td').removeClass("active");
                    $('.select-project-td').parent().removeClass("active");
                    $('.select-project-td').parent().siblings().removeClass("active");
                }
                $(this).addClass("active");
                $(this).parent().addClass("active");
            	$(this).parent().siblings().addClass("active");
            }
            
            let isActive = $('.select-project-td').hasClass("active");
            console.log("isActive");
            console.log(isActive);
            
            projectIdStatus = isActive;
			if(testStatus && projectIdStatus){
				$('.btn-stored-selected-trademark').removeAttr("disabled");
			}else{
				$('.btn-stored-selected-trademark').prop("disabled", true);
			}
			
// 			.css("background", "grey");
// 			('span').closest('div').prop('tagName');
			
			 
			console.log(projectId);
			setProjectId = projectId;
			$('input[name=projectId]').val(setProjectId);
			//$('input[name=project-set-id]').val(projectId);
			console.log(setProjectId);
			console.log($('input[name=checkbox-member-id]').val());
			console.log($('input[name=projectId').val());
			
			
			
			
			//$('form[name=do-stored-trademark-form]').submit();
			
			})
			
		}	
	 
// 	alert('Hello world, '+event.target.value);
		$('.modal_test').show();
		$('.modal_body').show();
		$('.project-create').hide();
		
	// 	$('.modal_test').css('display', 'block');
	// 	$('.modal_body').css('display', 'block');
	//  	document.getElementById('modal').className += '_block';
	//  	document.getElementById('modal_body').className += '_block';
	// 	document.getElementById('modal').className = 'show';
	// 	alert(document.getElementById('modal').className);
		let btnClose = document.getElementById("modal-close-btn")
		btnClose.addEventListener("click", function(event){
			$('.modal_test').hide();
			$('.modal_body').hide();
// 			if(!xhr){
// 				xhr.abort();
// 			}
		});
		
		let btnCreatProject = document.getElementById('show-creat-project-btn');
		btnCreatProject.addEventListener("click", function(event){
			$('.project-list').hide();
			$('.project-create').show();
			$('.show-creat-project-btn').hide();
			$('.creat-project-btn').show();
		});
	});
});


//

	
	
	
// 체크박스에 선택한 상표 저장 
$('.btn-stored-selected-trademark').click(function() {
	const values = $('.checkbox-member-id:checked').map((index, el) => el.value).toArray();
	if (values.length == 0) {
		alert('선택한 상표가 없습니다');
		return;
	}
	let projectIdVal = $('input[name=projectId]').val();
	if (projectIdVal.length == 0) {
		alert('선택한 프로젝트가 없습니다');
		return;
	}
	
	if (confirm('선택한 상표를 저장하시겠습니까?') == false) {
		return;
	}
	
	console.log(values);
	

	let valuesArr = values.join('!');
	console.log(valuesArr)
	
	$('input[name=test]').val(valuesArr);
	
	$('form[name=do-stored-trademark-form]').submit();
	
})


function pageUrl(pageNo) {
 	let numOfRows = ${trademarks[0].numOfRows};
 	let searchString = "${trademarks[0].searchString}";
	
	
	$('input[name=numOfRows]').val(numOfRows);
	$('input[name=searchString]').val(searchString);
	$('input[name=pageNo]').val(pageNo);
	console.log(pageNo);
	$('form[name=paging-form]').submit();
	
	
}





// 클릭시 프로젝트 생성 실행
$('.creat-project-btn').click(function() {
	let projectName = $('input[name=name]').val();
	let subProjectName = $('input[name=subProjectName]').val();
	
	if (projectName.length == 0) {
		alert('생성할 프로젝트 이름을 입력해주세요');
		return;
	}
	if (subProjectName.length == 0) {
		$('input[name=subProjectName]').val("새파일");
	}
	
	console.log(projectName);
	console.log(subProjectName);
	
	
	//ajax 시작
	let xhr = $.ajax({
		url : "/usr/project/createProject",
		type : 'post',
		data : {
			name : projectName,
			subProjectName : subProjectName,
			
		},
		success : function(data) {
			console.log(data);	
			
			$('.project-list').show();
			$('.show-creat-project-btn').show();
			$('.creat-project-btn').hide();
			$('.project-create').hide();
			alert("프로젝트 생성 성공")
	     },
		error : function() {
			alert("error");
		}
	});
	
});
</script>



<form name="paging-form" action="searchTrademard" method="POST" >
	<input type="hidden" name="numOfRows" value="">
	<input type="hidden" name="searchString" value="">
	<input type="hidden" name="pageNo" value="">
</form>

<section>
	<div class="page-menu mt-3 flex justify-center">
			<div class="btn-group">
				<c:set var="pageNo" value="${trademarks[0].pageNo}" />
				<c:set var="pagesCount" value="${trademarks[0].pagesCount}" />
				<c:set var="pageMenuLen" value="5" />
				
				<c:set var="startPage" value="${pageNo - pageMenuLen >= 1 ? pageNo - pageMenuLen : 1}" />
				<c:set var="endPage" value="${pageNo + pageMenuLen <= pagesCount ? pageNo + pageMenuLen : pagesCount}" />
<%-- 				<c:set var="ServiceKey" value="WTh4nA6jgRy5Jxmw4vhBoRbWDJFex7P%2BNr1NnXssp1P6N6NDjsY5hEZnOLCS4NEOpS8SSkrREQp%2FqX%2BsrB42DQ%3D%3D" /> --%>
				<c:set var="numOfRows" value="${trademarks[0].numOfRows}" />
				<c:set var="searchString" value="${trademarks[0].searchString}" />
<%-- 				<c:set var="url" value="http://kipo-api.kipi.or.kr/openapi/service/trademarkInfoSearchService/getWordSearch" /> --%>
				
<%-- 				<c:set var="pageBaseUri" value="${url}?ServiceKey=${ServiceKey}&numOfRows=${numOfRows}&searchKeyword=${searchKeyword }" /> --%>
<%-- 				<c:set var="pageBaseUri" value="${url}?ServiceKey=${ServiceKey}&searchString=${searchString}" /> --%>
				<c:set var="pageBaseUri" value="&searchString=${searchString}" />
			
				<c:if test="${trademarks[0].totalCount != 0 }">
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

<%@ include file="../common/foot.jsp"%>
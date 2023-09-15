<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="search" />
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
						<tr>
							<td colspan="2"><button class="btn btn-outline btn-accent w-full ">검색</button></td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</form>
	</div>
</section>

<%-- <div>${subProjects}</div> --%>




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
				</tr>
				<tr>
					<th class="text-sm">이미지</th>
					<th class="text-sm">출원번호(출원일자)</th>
					<th class="text-sm">IPC</th>
					<th class="text-sm">법적상태</th>
					<th class="text-sm">출원인 이름</th>
				</tr>
				<tr>
					<th class="text-sm"> 요약</th>
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
						</tr>
						<tr>
							<td><img style="width:150px;" src="${trademark.bigDrawing}"/></td>
							<td>${trademark.applicationNumber} ${trademark.applicationDate}</td>
							<td>${trademark.classificationCode}</td>
							<td>${trademark.applicationStatus}</td>
							<td>${trademark.applicantName}</td>
						</tr>
						<tr>
							<td class="text-sm"> 요약</td>
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
							<div class="table-box-type-1 of-y-scroll" style="border: solid 1px #dfdfdf;">
								<table class="table w-full" >
									<colgroup>
										<col />
										<col width="60" />
										<col width="300"/>
										<col width="150" />
									</colgroup>
									<thead>
										<tr>
											<th ></th>
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
				<div> 새프로젝트 생성 </div>
				<hr style="border: solid 1px #dfdfdf;">
				<div class="modal-create-div mt-3"><span class="ml-0">프로젝트 이름</span>
					<span class="modal-create-span"><input class="input input-bordered w-full max-w-xs" type="text" name="name" placeholder="프로젝트 이름을 입력해주세요" /></span>
				</div>
				<div class="modal-create-div"><span >파일이름</span>
					<span class="modal-create-span"><input class="input input-bordered w-full max-w-xs" type="text" name="subProjectName" placeholder="제목을 입력해주세요" value="새파일"/></span>
				</div>
				<div class="modal-create-div">관리번호
					<span class="modal-create-span"><input class="input input-bordered w-full max-w-xs" type="text" name="projectCode" placeholder="관리번호를 입력해주세요" /></span>
				</div>
				<div class="modal-create-div">업체명
				<span class="modal-create-span"><input class="input input-bordered w-full max-w-xs" type="text" name="company" placeholder="업체명을 입력해주세요" /></span>
				</div>
				<hr style="border: solid 1px #dfdfdf;">
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



<!-- <form method="POST" name="do-stored-trademark-form" action="../trademark/storedTrademark" onsubmit="return false;"> -->
<form method="POST" name="do-stored-trademark-form" action="../trademark/storedTrademark" >
<!-- <form id = "checkedTd" name="do-stored-trademark-form"  > -->
	
	<input type="hidden" name="test" value="" />
	<input type="hidden" name="projectId" value="" />
	<input type="hidden" name="subProjectId" value="" />
	
	<c:if test="${subProjectId eq ''}">
		<input type="hidden" name="subProjectId" value="0" />
	</c:if>
	
</form>



<script>
let setProjectId;
let setSubProjectId;



// 저장 버튼 클릭 이벤트 - 모달창 활성화
$('#btn-modal').click(function() {
	if(${rq.getLoginedMemberId()} == 0){
		alert("로그인이 필요합니다.");
		return;
	}
	
	//모달창 내의 close 버튼 이벤트
	$('#modal-close-btn').click(function(){
			$('.modal_test').hide();
			$('.modal_body').hide();
	});
	
	//모달창 내의 프로젝트 생성 버튼 이벤트 
	$('#show-creat-project-btn').click(function(){
		$('.project-list').hide();
		$('.project-create').show();
		$('.show-creat-project-btn').hide();
		$('.creat-project-btn').show();
	});
		
	
	let isCheckedBox = false;
	let isCheckedProjectId = false;
	let isCheckedSubProjectId = false;
	
	// isCheckedBox - 체크박스에 선택된 상표가 있는지 체크
	checkboxMemberIdCheckedCount = $('.checkbox-member-id:checked').length;
	if(checkboxMemberIdCheckedCount != 0){
		isCheckedBox = true;
	}
	if(!isCheckedBox || !isCheckedProjectId || !isCheckedSubProjectId){
		$('.btn-stored-selected-trademark').prop("disabled", true);
	}
	console.log("checkboxMemberIdCheckedCount",checkboxMemberIdCheckedCount);
	
	
	$('.project-list').show();
	$('.show-creat-project-btn').show();
	$('.creat-project-btn').hide();
	
// 	$('.project-sub-name-tr').hide();
// 	$('.project-sub-name-td').hide();
	

// 	$('#project-sub-name-tr').attr('style', "display:none;");  //숨기기
// 	$('#project-sub-name-td').attr('style', "display:none;");
	
	
	if(!setProjectId){
		setProjectId = 0;
    }

    let projectParams="projectId="+setProjectId;
	
	 $.ajax({
		url:"/usr/project/getProject",      
        data : projectParams,      
	  	success:function(data){
		console.log("data---------------",data);
		
		//verseion 1 
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
			
			let thisIndexNum = 1;
			$.each(data,function(index, value) {
				let thisIndex = $(this).find("index");
				console.log("thisIndex : ",thisIndex);
				
				projectLitHtml += `
					<tr id="\${thisIndexNum}" class="hover project-tr">
						<td id="\${value.id}"  class="select-sub-project-icon-td project-td"><i class='fas fa-angle-double-right select-sub-project-icon' style='font-size:10px' ></i></td>
						<td class="project-td">\${thisIndexNum}</td>
						<td class="project-td project-name-td-select"><span id="\${value.id}" class="hover:underline select-project-name">\${value.name}</span></td>
						<td class="project-td">\${value.regDate.substring(0,11)}</td>
					</tr>	
					
					`
// 					<tr class="hover sub-project-tr hidden" id="\${value.id}">
// 						<td class="sub-project-td"></td>
// 						<td class="sub-project-td"></td>
// 						<td class="sub-project-td">subPorjectName</td>
// 						<td class="sub-project-td">subPorjectDate</td>
// 					</tr>
					
				thisIndexNum++;
						
				});
				
				$("#product-modal").html(projectLitHtml);
				
				
				// 특정 프로젝트 name 클릭시 프로젝트 id input
				$('.select-project-name').click(function() {
					
					let projectId = parseInt($(this).attr('id'));
					if (projectId == 0) {
						alert('선택한 프로젝트가 없습니다');
						return;
					}
					
					
					console.log(isCheckedBox);
					console.log(isCheckedProjectId);
					
	//					$('tr#' + projectId).removeClass("hidden");
	//					$('tr').removeClass("hidden");
	//					$(this).parent().closest("tr").removeClass("hidden");
					//$(this).parent().parent().siblings('#' + projectId).removeClass("hidden");
		           
					
					//$('.sub-project-tr').addClass("hidden");
					
					
		           if($(this).hasClass("active")){
		            	$(this).parent('.project-td').removeClass("active");
		            	$(this).parent('.project-td').siblings().removeClass("active");
		                $(this).removeClass("active");
// 		                $('.sub-project-tr').addClass("hidden");
		                
		            } else{
		            	if($('.select-project-name').hasClass("active")){
		                    $('.select-project-name').removeClass("active");
		                    $('.select-project-name').parent().removeClass("active");
		                    $('.select-project-name').parent().siblings().removeClass("active");
// 		                    $('.sub-project-tr').addClass("hidden");
		                }
		                $(this).addClass("active");
		                $(this).parent('.project-td').addClass("active");
		            	$(this).parent('.project-td').siblings().addClass("active");
		            	$(this).parent('.project-td').parent().siblings('#' + projectId).removeClass("hidden");
		            }
	            	
		           // 저장할 프로젝트가 선택되어 있는지 체크
		           let isProjectActive = $('.select-project-name').hasClass("active");
		            console.log("isProjectActive");
		            console.log(isProjectActive);
		            isCheckedProjectId = isProjectActive;
		            
// 					if(isCheckedBox && isCheckedProjectId){
// 						$('.btn-stored-selected-trademark').removeAttr("disabled");
// 					}else{
// 						$('.btn-stored-selected-trademark').prop("disabled", true);
// 					}
					
					 
					console.log(projectId);
					setProjectId = projectId;
					$('input[name=projectId]').val(setProjectId);
					//$('input[name=project-set-id]').val(projectId);
					console.log("setProjectId", setProjectId);
					console.log($('input[name=checkbox-member-id]').val());
					console.log($('input[name=projectId').val());
					
				//$('form[name=do-stored-trademark-form]').submit();
			
				})
				
				
			}
			$('.modal_test').show();
			$('.modal_body').show();
			$('.project-create').hide();
			
			
	 },   
	    error:function(e){  
	        alert(e.responseText);  
	   }
	});
	

	 
	 
	 
	// subProject 가져오기
	// projectName 클릭 이벤트 
// 	$(document).on('click', '.select-sub-project-icon-td', function(){
	$(document).on('click', '.select-project-name', function(){	
		// (version1)클릭한 요소의 프로젝트 아이디를 기반으로 서브 프로젝트를 출력.
		let projectId = parseInt($(this).attr('id'));
		let thisProjectIndexNum = parseInt($(this).parent().parent().attr('id'));
	   
		console.log("select-sub-project-icon-td 클릭시 projectId ",projectId );
	    console.log("select-sub-project-icon-td 클릭시 thisProjectIndexNum ",thisProjectIndexNum);
	    
	    // (version2)프로젝트 및 서브프로젝트 정보를 한꺼번에 가져올 경우 서브 프로젝트 hidden 
// 	    $(this).parent().siblings('#' + projectId).removeClass("hidden");
	    
// 	    if($('.sub-project-tr').attr('id') == projectId){
// 	    	 $(this).removeClass("hidden");
// 	    }
// 	    if(!projectId){
// 	    	projectId = 0;
// 	    }
// 		$('.sub-project-tr').removeClass("hidden");
// 	 	$('.sub-project-tr').attr('style', "display:none;");  //숨기기
// 	 	$('.sub-project-td').attr('style', "display:none;");



	   //version2 만약 프로젝트의 서브프로젝트가 액티브 상태이면 더이상 after()하지 않도록
	   //추후 수정하기
// 	   let isSubProjectShow = $(this).hasClass("subProject-show");
// 	   console.log("isSubProjectShow",isSubProjectShow);
	    //if 시작
// 	    if(isSubProjectShow == false){	   
	
	
	    let projectParams="projectId="+projectId;
	    

	    	
	    $.ajax({      
	        url:"/usr/project/getSubProject",      
	        data : projectParams,      
	        success:function(data){   
	        	
				console.log("subProjects")
	        	console.log(data)
				
	        	// (version1)
				$(".sub-project-tr").remove();
				$(".sub-project-tr").empty();
	        	
				let supProjectListHtml = ""
				
				
				let thisIndexNum = 1;
				$.each(data,function(index, value) {
					let thisIndex = $(this).find("index");
					
					supProjectListHtml += `
						<tr class="hover sub-project-tr">
							<td id="\${value.id}" class="select-sub-project-icon-td sub-project-td"><i class='select-sub-project-icon' style='font-size:10px' ></i></td>
							<td class="sub-project-td">\${thisIndexNum}</td>
							<td class="sub-project-td"><span id="\${value.id}" class="hover:underline select-seb-project-name">\${value.name}</span></td>
							<td class="sub-project-td">\${value.regDate.substring(0,11)}</td>
						</tr>	

						`
// 						<tr class="hover sub-project-tr hidden" id="\${value.id}">
// 							<td class="sub-project-td"></td>
// 							<td class="sub-project-td"></td>
// 							<td class="sub-project-td"></td>
// 							<td class="sub-project-td">subPorjectDate</td>
// 						</tr>
						
						
					thisIndexNum++;
							
					});
				
				
				// (version1)
// 					$('#' + projectId, 'project-tr').append(supProjectListHtml);
// 					$("#product-modal").append(supProjectListHtml);
					console.log(thisProjectIndexNum);
// 					$("tbody:nth-child(thisProjectIndexNum)").append(supProjectListHtml);
// 					console.log(tbody:nth-child(thisProjectIndexNum));
// 					console.log(tr:nth-child(thisProjectIndexNum));
// 					$(`#modal_body tr:nth-child(\${thisProjectIndexNum})`).after(supProjectListHtml);
					$(`#product-modal tr:nth-child(\${thisProjectIndexNum})`).after(supProjectListHtml);

					
					
					// 특정 서브 프로젝트 클릭시 이벤트
					$('.select-seb-project-name').click(function() {
						
						let thisSubProjectId = parseInt($(this).attr('id'));
						
						console.log("thisSubProjectId",thisSubProjectId);
						
// 						let projectId = parseInt($(this).attr('id'));
// 						let selectId = projectId;
						
						if (thisSubProjectId == 0) {
							alert('선택한 서브 프로젝트가 없습니다');
							return;
						}
						
						console.log(isCheckedBox);
						console.log(isCheckedProjectId);
						console.log(isCheckedSubProjectId);
						
// 						$('tr#' + projectId).removeClass("hidden");
// 						$('tr').removeClass("hidden");
// 						$(this).parent().closest("tr").removeClass("hidden");
						//$(this).parent().parent().siblings('#' + projectId).removeClass("hidden");
						//$('.sub-project-tr').addClass("hidden");
						
						
						
			           if($(this).hasClass("active")){
			            	$(this).parent().removeClass("active");
			            	$(this).parent().siblings().removeClass("active");
			                $(this).removeClass("active");
// 			                $('.sub-project-tr').addClass("hidden");
			                
			            } else if($('.select-seb-project-name').hasClass("active")){
			                    $('.select-seb-project-name').removeClass("active");
			                    $('.select-seb-project-name').parent().removeClass("active");
			                    $('.select-seb-project-name').parent().siblings().removeClass("active");
// 			                    $('.sub-project-tr').addClass("hidden");
			            }else{
			            	$(this).addClass("subProject-show");
			                $(this).addClass("active");
			                $(this).parent().addClass("active");
			            	$(this).parent().siblings().addClass("active");
// 			            	$(this).parent().parent().siblings('#' + projectId).removeClass("hidden");
			            }
		            
			       		 // 저장할 서브 프로젝트가 선택되어 있는지 체크
			            let isSubProjectActive = $('.select-seb-project-name').hasClass("active");
			            isCheckedSubProjectId = isSubProjectActive;
			            
			       		console.log("isSubProjectActive", isSubProjectActive);
			            console.log("isCheckedSubProjectId", isCheckedSubProjectId);
			            
						if(isCheckedBox && isCheckedProjectId && isCheckedSubProjectId){
							$('.btn-stored-selected-trademark').removeAttr("disabled");
						}else{
							$('.btn-stored-selected-trademark').prop("disabled", true);
						}
						 
						setSubProjectId = thisSubProjectId;
						console.log("setSubProjectId ",setSubProjectId);
						$('input[name=subProjectId]').val(setSubProjectId);
						//$('input[name=project-set-id]').val(projectId);
						console.log(setProjectId);
						console.log($('input[name=checkbox-member-id]').val());
						console.log($('input[name=projectId').val());
						console.log($('input[name=subProjectId').val());
					//$('form[name=do-stored-trademark-form]').submit();
					
					})
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });  
	// if 끝
// 	}	
	
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






// 클릭시 프로젝트 생성 실행
$('.creat-project-btn').click(function() {
	let projectName = $('input[name=name]').val();
	let subProjectName = $('input[name=subProjectName]').val();
	let projectCode = $('input[name=projectCode]').val();
	let company = $('input[name=company]').val();
	
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
			projectCode : projectCode,
			company : company
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


<script>
// 페이징 처리
function pageUrl(pageNo) {
 	numOfRows = ${trademarks[0].numOfRows};
//  	numOfRows = 10;
 	searchString = "${trademarks[0].searchString}";
	
	
	$('input[name=numOfRows]').val(numOfRows);
	$('input[name=searchString]').val(searchString);
	$('input[name=pageNo]').val(pageNo);
	console.log(pageNo);
	$('form[name=paging-form]').submit();
	
	
}


</script>



<form name="paging-form" action="searchTrademark" method="POST" >
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
				<c:set var="numOfRows" value="${trademarks[0].numOfRows}" />
				<c:set var="searchString" value="${trademarks[0].searchString}" />
				
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

<%-- <%@ include file="../modal/projectCreate.jsp"%> --%>
<%@ include file="../common/foot.jsp"%>
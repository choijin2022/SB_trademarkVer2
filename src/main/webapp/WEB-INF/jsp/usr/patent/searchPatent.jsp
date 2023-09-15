<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="search" />
<%@ include file="../common/head.jsp"%>

<script type=”text/javascript”>
var win;
function create(){
	win = open(”,‘w’,‘width=600,height=800’);
}
</script>



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
									<option value="${patents[0].numOfRows}">${patents[0].numOfRows}개씩 보기</option>
<!-- 									<option value="50">50개씩 보기</option> -->
								</select>
							</td>
						</tr>
						<tr>
							<th>단어</th>
							<td>
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="searchString" placeholder="단어" value="${patents[0].searchString}"/>
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
function selectAllContents(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
}
</script>


<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
<!-- 		<form name="descOpen-form" action="../patent/openPatentDesc" method="POST"> -->
		<table style="table-layout:fixed;" class="table w-full">
			<thead>
				<tr>
					<th class="text-sm"><input type="checkbox" class="checkbox-all-member-id" onclick='selectAllContents(this)'></th>
					<th class="text-sm">No</th>
<!-- 					<th class="text-sm">이미지</th> -->
<!-- 					<th class="text-sm">출원번호(출원일자)</th> -->
					<th class="text-sm">법적상태</th>
					<th class="text-sm">IPC</th>
<!-- 					<th class="text-sm">출원인 이름</th> -->
				</tr>
<!-- 				<tr> -->
<!-- 					<th style="width:800px; word-wrap: break-word;" class="text-sm"> 요약</th> -->
<!-- 				</tr> -->
				
			</thead>

			<tbody id="product">
				<c:if test="${patents[0].itemsTotalCount != 0 }">
					<h2><span class="ml-2 text-base hitCount"> total ${patents[0].itemsTotalCount} </span ></h2>
					<c:forEach var="patent" items="${patents}" begin="0" end="${patents[0].numOfRows}" step="1" varStatus="status">
<%-- 						<input type="hidden" name="${patents.indexNo}" value="${patents}"/> --%>
							
						<tr class="hover">
							<td><input name="checkbox-member-id" type="checkbox" class="checkbox-member-id" value="${patent.indexNo},${patent.inventionTitle},${patent.applicantName},${patent.applicationNumber},${patent.applicationDate},
										${patent.publicationNumber},${patent.publicationDate},${patent.astrtCont},${patent.ipcNumber},${patent.registerNumber},${patent.registerDate},${patent.openNumber},${patent.openDate},
										${patent.registerStatus},${patent.drawing},${patent.bigDrawing}" /></td>
							<td class="text-sm">${patent.indexNo}</td>
							<td class="text-sm">${patent.registerStatus}</td>
							<td class="text-sm">${patent.ipcNumber}</td>
						</tr>
						<tr >
							<td rowspan="3" ><img style="width:300px; height:auto;" src="${patent.bigDrawing}"/></td>
							<td colspan="3"><a href="javascript:void(0);" type="button" class="title-desc btn btn-sm" onclick="descUrl(${patent.applicationNumber});" ><span style=" white-space: pre-line;"> ${patent.inventionTitle} </span></a></td>
						</tr>
						<tr>
							<td class="text-sm">출원인 </td>
							<td class="text-sm">출원번호(날짜)</td>	
							<td class="text-sm">등록번호(날짜)</td>
							
						</tr>
						<tr>
							<td ><span style=" white-space: pre-line;">${patent.applicantName}</span> </td>
							<td>${patent.applicationNumber} (${patent.applicationDate})</td>	
							<td>${patent.publicationNumber} (${patent.publicationDate})</td>
							
						</tr>
						<tr>
							<td colspan ="4" class="text-sm"><span style=" white-space: pre-line;">${patent.astrtCont} </span></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="storeButton mt-2 flex justify-end justify-right">
			<button id="btn-modal" class="btn btn-outline btn-accent container w-1/6 flex mt-5 btn-modal" >저장</button>
		</div>	
	</div>
	

	
	<div class="pageNav flex justify-center mt-5">
		<div class="btn-group">
			<c:set var="maxPageNum" value="5" />
		</div>
	</div>
		
</section>


<!-- 모달 include -->
<%@ include file="../modal/modalTest.jsp"%>





<form method="POST" name="do-stored-trademark-form" action="../trademark/storedTrademark" >
	
	<input type="hidden" name="test" value="" />
	<input type="hidden" name="projectId" value="" />
	<input type="hidden" name="subProjectId" value="" />
	
	<c:if test="${subProjectId eq ''}">
		<input type="hidden" name="subProjectId" value="0" />
	</c:if>
	
</form>


<script>
// 특허 제목 클릭 함수 - 상세한 설명 연동
function descUrl(applicationNum) {
	
	console.log("클릭??")
	console.log(applicationNum)
	applicationNumber = applicationNum;
 	searchString = "${patents[0].searchString}";
 	

 	
 	$('input[name=applicationNumber]').val(applicationNumber);
	$('form[name=desc-pdf-form]').submit();
	
	
}


</script>


<!-- pdf 상세한 설명 열기 -->
<form name="desc-pdf-form" action="openPatentDesc" method="POST" target=”w” onsubmit=”create();“>
	<input type="hidden" name="applicationNumber" value="">

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

						
						
					thisIndexNum++;
							
					});
				
				
					console.log(thisProjectIndexNum);
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


<%@ include file="../common/paging.jsp"%>




<%-- <%@ include file="../modal/projectCreate.jsp"%> --%>
<%@ include file="../common/foot.jsp"%>
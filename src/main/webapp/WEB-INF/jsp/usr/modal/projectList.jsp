<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>



<section>
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


<!--저장 -->
<form method="POST" name="do-stored-trademark-form" action="../workspace/storedTrademark" >
	<input type="hidden" name="ids" value="" />
	<input type="hidden" name="projectId" value="" />
	<input type="hidden" name="subProjectId" value="" />
	<c:if test="${subProjectId eq ''}">
		<input type="hidden" name="subProjectId" value="0" />
	</c:if>
</form>





<script>
let setProjectId;
let setSubProjectId;

let thisPageProjectId = ${project.id};

// 저장 버튼 클릭 이벤트 - 모달창 활성화
$('.btn-modal').click(function() {
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
				
				projectLitHtml += `
					<tr id="\${thisIndexNum}" class="hover project-tr">
						<td id="\${value.id}"  class="select-project-icon-td project-td " style="position: relative;">
							<i class='fas fa-angle-double-right select-project-icon' style='cursor:pointer; font-size:10px' ></i>
							<div class="folderOptView">
							<ul class="folderOptView-body hover">
								<li style="text-decoration: none">no : \${thisIndexNum}</li>
								<li ><a class="rename-project-opt" href='javascript:void(0);'><span >이름바꾸기</span></a></li>
								<li><a href='javascript:void(0);' onclick="delete_project(\${value.id});"><span>삭제</span></a></li>
							</ul>
						</div>
						</td>
						<td class="project-td">\${thisIndexNum}</td>
						<td class="project-td project-name-td-select"><span id="\${value.id}" class="hover:underline select-project-name">\${value.name}</span></td>
						<td style="bgcolor:grey;" class ="project-name-for-input-td hidden" ><input type="text" id="\${value.id}" value="\${value.name}"/></td>
						<td class="project-td">\${value.regDate.substring(0,11)}</td>
					</tr>	
	 					
						`
// 					<tr id="\${thisIndexNum}" class="project-td project-name-tr-input hidden">
// 						<td colspan='4'><input type="text" id="\${value.id}" value="\${value.name}"/></td>
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
					
					
					
					
		           if($(this).hasClass("active")){
		            	$(this).parent('.project-td').removeClass("active");
		            	$(this).parent('.project-td').siblings().removeClass("active");
		                $(this).removeClass("active");
		                
		            } else{
		            	if($('.select-project-name').hasClass("active")){
		                    $('.select-project-name').removeClass("active");
		                    $('.select-project-name').parent().removeClass("active");
		                    $('.select-project-name').parent().siblings().removeClass("active");
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
			
				});
				
				 // 모달창 내의 아이콘 클릭 이벤트	 
				 $('.select-project-icon').click(function() {
						//let icon = $(this);
						$(this).siblings('.folderOptView').attr('style', "display:inline-block;");
						console.log("아이콘 클릭!!!")
					// 모달창 닫기
						
						$(document).mouseup(function (e){
							let container = $('.folderOptView');
							if( container.has(e.target).length === 0){
							container.css('display','none');
							}

						});
						let obj = $('.folderOptView').offset();
// 						let obj = $(this).offset({ top: 0, left: 0 });
						let projectId = parseInt($(this).parent().attr('id'));
						let thisProjectIndexNum = parseInt($(this).parent().parent().attr('id'));
						    console.log("projectId : ", projectId);
						    console.log("thisProjectIndexNum : ", thisProjectIndexNum);
						if(thisProjectIndexNum == 1){
							$(this).siblings('.folderOptView').css('top',10);
						
						}else if(thisProjectIndexNum > 4){
							$(this).siblings('.folderOptView').css('top', obj.top + 54*4);    
						}else{
							$(this).siblings('.folderOptView').css('top', obj.top + 54*(thisProjectIndexNum-1));    
							
						}

					});
				 
				// 클릭시 프로젝트 네임 수정
				 $('.rename-project-opt').click(function(){
					 
					console.log("이름 바꾸기");
					let renameTextTd = $(this).parent().parent().parent().parent().siblings('.project-name-for-input-td');
				 	let nameTextTd = $(this).parent().parent().parent().parent().siblings('.project-name-td-select');
				 	let nameTextInput = renameTextTd.children().first();
				 	
				 	let projectId = $(this).parent().parent().parent().parent().attr('id');
				 	console.log(projectId);

				 	
				 	
				 	
				 	nameTextTd.addClass("hidden");
				 	renameTextTd.removeClass("hidden");
				 	 
				 	$(document).mouseup(function (e){
						if( renameTextTd.has(e.target).length === 0){
							let newName = nameTextInput.val();
							console.log(newName);
							rename_update(projectId,newName);
							
						
							renameTextTd.addClass("hidden");
							nameTextTd.removeClass("hidden");
// 							$(this).parent().parent().parent().parent().siblings('.project-name-td-select').removeClass("hidden");
						}
// 						xhr.abort();
				 	});
				 	
				 	
				 	/*
				 	//ajax 시작
				 	$.ajax({
				 		url : "/usr/project/modifyProjectName",
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
				 	*/
				 	
				 });
				
				
				
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
							<td id="\${value.id}" class="sub-project-td"><i style='font-size:10px' ></i></td>
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
	
	$('input[name=ids]').val(valuesArr);
	
	console.log($('input[name=ids]').val())
	
	$('form[name=do-stored-trademark-form]').submit();
	
});






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

// 마우스가 외부에 한번이라도 클릭될 시, 프로젝트 이름 업데이트
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


// 클릭시 프로젝트 삭제
function delete_project(projectId){
	console.log(projectId);
	let projectParams="projectId="+projectId;
	if (confirm('선택한 프로젝트를 삭제하시겠습니까?') == false) {
		return;
	}
// 	$('input[name=projectId]').val(projectId);
	
	
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
</script>




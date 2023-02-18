<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<section>
<!-- 	<div id="modal" class="modal"> -->
<!--       <div id="modal_body" class="modal_body">Modal ?????????</div> -->
<!--     </div> -->
   
	<div id="modal_test" class="modal_test"> 
		<div id="modal_body" class="modal_body">
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
<!-- 						<button id="show-creat-project-btn" class="btn btn-outline btn-accent flex show-creat-project-btn" >새프로젝트</button> -->
						<button id="creat-project-btn" class="btn btn-outline btn-accent flex creat-project-btn" >프로젝트 저장</button>
					</div>
<!-- 					<button class="mr-2 btn btn-outline btn-accent btn-stored-selected-trademark" >저장</button> -->
					<button id="modal-close-btn" type="button" class="modal-close-btn">CLOSE</button>
				</div>
			</div>
		</div>
	</div>
	
</section>




<script>

let setProjectId;
const modal = document.getElementById("modal_test")
const modal_body =document.getElementById("modal_body")
const btnModal = document.getElementById("btn-modal")

$(document).on('click', '.btn-modal', function(){
	//console.log(${subProjects[0]});
	
	/*
	let testStatus = false;
	let projectIdStatus = false;
	
	checkboxMemberIdCheckedCount = $('.checkbox-member-id:checked').length;
	
	if(checkboxMemberIdCheckedCount != 0){
		testStatus = true;
	}
	*/
	/*
	if(testStatus == false || !projectIdStatus){
		$('.btn-stored-selected-trademark').prop("disabled", true);
	}
	console.log(checkboxMemberIdCheckedCount);
	
	$('.project-list').show();
	$('.show-creat-project-btn').show();
	$('.creat-project-btn').hide();
	*/
// 	$('.project-sub-name-tr').hide();
// 	$('.project-sub-name-td').hide();
	
	

// 	$('#project-sub-name-tr').attr('style', "display:none;");  //숨기기
// 	$('#project-sub-name-td').attr('style', "display:none;");
	
	
// 	if(!setProjectId){
// 		setProjectId = 0;
//     }

//     let params="projectId="+setProjectId;
	
// 	 $.ajax({
// 		url:"/usr/project/getProject",      
//         data : params,      
// 	  	success:function(data){
// 		console.log("data---------------",data);
// 		let projectLitHtml = ""
		
// 		if(data == null){
// 			projectLitHtml = `
// 				<tr class="hover" >
// 					<td colspan="3">프로젝트가 없습니다.</td>
// 				</tr>
// 			`
// 			$("#product-modal").html(projectLitHtml);
		
// 			}else{
// 			console.log(data);
			
// 			let supProjectListHtml = ""
			
// 			let thisIndexNum = 1;
// 			$.each(data,function(index, value) {
// 				let thisIndex = $(this).find("index");
				
// 				supProjectListHtml += `
// 					<tr class="hover">
// 						<td id="\${value.id}" class="select-sub-project-icon-td"><i class='fas fa-angle-double-right select-sub-project-icon' style='font-size:10px' ></i></td>
// 						<td >\${thisIndexNum}</td>
// 						<td class="project-name-td-select"><span id="\${value.id}" class="hover:underline select-project-td">\${value.name}</span></td>
// 						<td>\${value.regDate.substring(0,11)}</td>
// 					</tr>	
// 					<tr class="hover sub-project-tr hidden" id="\${value.id}">
// 						<td class="sub-project-td"></td>
// 						<td class="sub-project-td"></td>
// 						<td class="sub-project-td">subPorjectName</td>
// 						<td class="sub-project-td">subPorjectDate</td>
// 					</tr>
					
// 					`
					
// 				thisIndexNum++;
						
// 				});
				
// 				$("#product-modal").html(supProjectListHtml);
				
				
				
				
				
// 				// 특정 프로젝트 클릭시 프로젝트 id input
// 				$('.select-project-td').click(function() {
					
// 					let projectId = parseInt($(this).attr('id'));
// 					let selectId = projectId;
					
// 					if (projectId == 0) {
// 						alert('선택한 프로젝트가 없습니다');
// 						return;
// 					}
					
					
					
// 					console.log(testStatus);
					
// 					console.log(projectIdStatus);
// 	//					$('tr#' + projectId).removeClass("hidden");
// 	//					$('tr').removeClass("hidden");
// 	//					$(this).parent().closest("tr").removeClass("hidden");
// 					//$(this).parent().parent().siblings('#' + projectId).removeClass("hidden");
		           
					
// 					//$('.sub-project-tr').addClass("hidden");
					
					
					
// 		           if($(this).hasClass("active")){
// 		            	$(this).parent().removeClass("active");
// 		            	$(this).parent().siblings().removeClass("active");
// 		                $(this).removeClass("active");
// 		                $('.sub-project-tr').addClass("hidden");
		                
// 		            } else{
// 		            	if($('.select-project-td').hasClass("active")){
// 		                    $('.select-project-td').removeClass("active");
// 		                    $('.select-project-td').parent().removeClass("active");
// 		                    $('.select-project-td').parent().siblings().removeClass("active");
// 		                    $('.sub-project-tr').addClass("hidden");
// 		                }
// 		                $(this).addClass("active");
// 		                $(this).parent().addClass("active");
// 		            	$(this).parent().siblings().addClass("active");
// 		            	$(this).parent().parent().siblings('#' + projectId).removeClass("hidden");
// 		            }
	            
// 		            let isActive = $('.select-project-td').hasClass("active");
// 		            console.log("isActive");
// 		            console.log(isActive);
		            
// 		            projectIdStatus = isActive;
// 					if(testStatus && projectIdStatus){
// 						$('.btn-stored-selected-trademark').removeAttr("disabled");
// 					}else{
// 						$('.btn-stored-selected-trademark').prop("disabled", true);
// 					}
					
					
					 
// 					console.log(projectId);
// 					setProjectId = projectId;
// 					$('input[name=projectId]').val(setProjectId);
// 					//$('input[name=project-set-id]').val(projectId);
// 					console.log(setProjectId);
// 					console.log($('input[name=checkbox-member-id]').val());
// 					console.log($('input[name=projectId').val());
// 				//$('form[name=do-stored-trademark-form]').submit();
			
// 				})
// 			}


			$('.modal_test').show();
			$('.modal_body').show();
			$('.project-create').show();
			
			let btnClose = document.getElementById("modal-close-btn")
			btnClose.addEventListener("click", function(event){
				$('.modal_test').hide();
				$('.modal_body').hide();
			});
			/*
			let btnCreatProject = document.getElementById('show-creat-project-btn');
			btnCreatProject.addEventListener("click", function(event){
				$('.project-list').hide();
				$('.project-create').show();
				$('.show-creat-project-btn').hide();
				$('.creat-project-btn').show();
			});
			
			*/
// 	 },   
// 	    error:function(e){  
// 	        alert(e.responseText);  
// 	   }
// 	});
			
	// subProject 가져오기
	//let projectId = 0;
	
// 	$(document).on('click', '.select-sub-project-icon-td', function(){
// 	    let projectId = parseInt($(this).attr('id'));
// 	    console.log("projectId");
// 	    console.log(projectId);
	    
// 	    $(this).parent().siblings('#' + projectId).removeClass("hidden");
	    
// 	    if($('.sub-project-tr').attr('id') == projectId){
// 	    	 $(this).removeClass("hidden");
// 	    }
	    
// 	    if(!projectId){
// 	    	projectId = 0;
// 	    }

// 		//$('.sub-project-tr').removeClass("hidden");
// 	    let params="projectId="+projectId;
// // 	 	$('.sub-project-tr').attr('style', "display:none;");  //숨기기
// // 	 	$('.sub-project-td').attr('style', "display:none;");
	   
	    
// 	    $.ajax({      
// 	        url:"/usr/project/getAllProject",      
// 	        data : params,      
// 	        success:function(data){   
	        	
// 	        	console.log(data)
	        	
// 				console.log("subProjects")
				
				
// 				let supProjectListHtml = ""
				
// 				let thisIndexNum = 1;
// 				$.each(data,function(index, value) {
// 					let thisIndex = $(this).find("index");
					
// 					supProjectListHtml += `
// 						<tr class="hover">
// 							<td id="\${value.id}" class="select-sub-project-icon-td"><i class='fas fa-angle-double-right select-sub-project-icon' style='font-size:10px' ></i></td>
// 							<td >\${thisIndexNum}</td>
// 							<td class="project-name-td-select"><span id="\${value.id}" class="hover:underline select-project-td">\${value.name}</span></td>
// 							<td>\${value.regDate.substring(0,11)}</td>
// 						</tr>	
// 						<tr class="hover sub-project-tr hidden" id="\${value.id}">
// 							<td class="sub-project-td"></td>
// 							<td class="sub-project-td"></td>
// 							<td class="sub-project-td">subPorjectName</td>
// 							<td class="sub-project-td">subPorjectDate</td>
// 						</tr>
						
// 						`
						
// 					thisIndexNum++;
							
// 					});
					
// 					$("#product-modal").html(supProjectListHtml);
					
					
					
					
					
// 					// 특정 프로젝트 클릭시 프로젝트 id input
// 					$('.select-project-td').click(function() {
						
// 						let projectId = parseInt($(this).attr('id'));
// 						let selectId = projectId;
						
// 						if (projectId == 0) {
// 							alert('선택한 프로젝트가 없습니다');
// 							return;
// 						}
						
						
						
// 						console.log(testStatus);
						
// 						console.log(projectIdStatus);
// // 						$('tr#' + projectId).removeClass("hidden");
// // 						$('tr').removeClass("hidden");
// // 						$(this).parent().closest("tr").removeClass("hidden");
// 						//$(this).parent().parent().siblings('#' + projectId).removeClass("hidden");
			           
						
// 						//$('.sub-project-tr').addClass("hidden");
						
						
						
// 			           if($(this).hasClass("active")){
// 			            	$(this).parent().removeClass("active");
// 			            	$(this).parent().siblings().removeClass("active");
// 			                $(this).removeClass("active");
// 			                $('.sub-project-tr').addClass("hidden");
			                
// 			            } else{
// 			            	if($('.select-project-td').hasClass("active")){
// 			                    $('.select-project-td').removeClass("active");
// 			                    $('.select-project-td').parent().removeClass("active");
// 			                    $('.select-project-td').parent().siblings().removeClass("active");
// 			                    $('.sub-project-tr').addClass("hidden");
// 			                }
// 			                $(this).addClass("active");
// 			                $(this).parent().addClass("active");
// 			            	$(this).parent().siblings().addClass("active");
// 			            	$(this).parent().parent().siblings('#' + projectId).removeClass("hidden");
// 			            }
		            
// 			            let isActive = $('.select-project-td').hasClass("active");
// 			            console.log("isActive");
// 			            console.log(isActive);
			            
// 			            projectIdStatus = isActive;
// 						if(testStatus && projectIdStatus){
// 							$('.btn-stored-selected-trademark').removeAttr("disabled");
// 						}else{
// 							$('.btn-stored-selected-trademark').prop("disabled", true);
// 						}
						
						
						 
// 						console.log(projectId);
// 						setProjectId = projectId;
// 						$('input[name=projectId]').val(setProjectId);
// 						//$('input[name=project-set-id]').val(projectId);
// 						console.log(setProjectId);
// 						console.log($('input[name=checkbox-member-id]').val());
// 						console.log($('input[name=projectId').val());
// 					//$('form[name=do-stored-trademark-form]').submit();
					
// 					})
// 	        },   
// 	        error:function(e){  
// 	            alert(e.responseText);  
// 	        }  
// 	    });  
	
	
// 	}); 
	
	
	/*
	// 다시 project 가져오기
	
	$(document).on('click', '.project-name-td-select', function(){
		projectId = parseInt($(this).attr('id'));
	    
		if(!projectId){
	    	projectId = 0;
	    }
	    
		let params="projectId="+projectId;
		$.get('/usr/project/getSubProject', {
			data : params,
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
						<td id="\${value.id}" class="select-sub-project-icon-td"><i class='fas fa-angle-double-right select-sub-project-icon' style='font-size:10px'></i></td>
						<td>\${thisIndexNum}</td>
						<td class="project-name-td-select"><span id="\${value.id}" class="hover:underline select-project-td">\${value.name}</span></td>
						<td>\${value.regDate.substring(0,11)}</td>
					</tr>
					<tr class="hover sub-project-tr hidden" id="\${value.id}">
						<td class="sub-project-td"></td>
						<td class="sub-project-td"></td>
						<td class="sub-project-td">subPorjectName</td>
						<td class="sub-project-td">subPorjectDate</td>
					</tr>
	
				`
				thisIndexNum++;
				console.log(projectLitHtml);
				
				
			 }); 
		 
			$("#product-modal").html(projectLitHtml);
			
			console.log(testStatus);
			
			console.log(projectIdStatus);
			
			// 특정 프로젝트 클릭시 프로젝트 id input
			$('.select-project-td').click(function() {
				
				projectId = parseInt($(this).attr('id'));
				let selectId = projectId;
				
				if (projectId == 0) {
					alert('선택한 프로젝트가 없습니다');
					return;
				}
				
				console.log(testStatus);
				console.log(projectIdStatus);
			
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
			console.log(projectId);
			setProjectId = projectId;
			$('input[name=projectId]').val(setProjectId);
			console.log(setProjectId);
			console.log($('input[name=checkbox-member-id]').val());
			console.log($('input[name=projectId').val());
			
			})
			
			}
	
		});
	
	});
	
	*/
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
			$('.modal_test').hide();
			$('.modal_body').hide();
	     },
		error : function() {
			alert("error");
		}
	});
	
	xhr.close();
});



</script>

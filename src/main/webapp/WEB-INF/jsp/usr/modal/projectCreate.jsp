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



			$('.modal_test').show();
			$('.modal_body').show();
			$('.project-create').show();
			
			let btnClose = document.getElementById("modal-close-btn")
			btnClose.addEventListener("click", function(event){
				$('.modal_test').hide();
				$('.modal_body').hide();
			});
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jsp"%>

<script>
	let validLoginId = '';
	
	function MemberJoin__submit(form) {
		form.loginId.value = form.loginId.value.trim();
		if (form.loginId.value.length == 0) {
			alert('아이디를 입력해주세요');
			form.loginId.focus();
			return;
		}
		/*
		if (form.loginId.value != validLoginId) {
			alert(form.loginId.value + '은(는) 사용할 수 없는 아이디 입니다');
			form.loginId.focus();
			return;
		}
		*/
		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length == 0) {
			alert('비밀번호를 입력해주세요');
			form.loginPw.focus();
			return;
		}
		
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
		if (form.loginPwConfirm.value.length == 0) {
			alert('비밀번호 확인을 입력해주세요');
			form.loginPwConfirm.focus();
			return;
		}
		if (form.loginPw.value != form.loginPwConfirm.value) {
			alert('비밀번호가 일치하지 않습니다');
			form.loginPw.focus();
			return;
		}
		
		form.name.value = form.name.value.trim();
		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요');
			form.name.focus();
			return;
		}
		
		form.nickname.value = form.nickname.value.trim();
		if (form.nickname.value.length == 0) {
			alert('닉네임을 입력해주세요');
			form.nickname.focus();
			return;
		}
		
		const maxSizeMb = 10;
		const maxSize = maxSizeMb * 1024 * 1024;
		
		const profileImgFileInput = form["file__member__0__extra__profileImg__1"];
		
		if (profileImgFileInput.value) {
			if (profileImgFileInput.files[0].size > maxSize) {
				alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요");
				profileImgFileInput.focus();
				return;
			}
		}
		
		form.cellphoneNum.value = form.cellphoneNum.value.trim();
		if (form.cellphoneNum.value.length == 0) {
			alert('전화번호를 입력해주세요');
			form.cellphoneNum.focus();
			return;
		}
		
		form.email.value = form.email.value.trim();
		if (form.email.value.length == 0) {
			alert('이메일을 입력해주세요');
			form.email.focus();
			return;
		}
		
		form.submit();
	}
	
	function checkLoginIdDup(el) {
		$(".loginId-msg").empty();
		const form = $(el).closest('form').get(0);
		
		if (form.loginId.value.length == 0) {
			return;
		}
		
		$.get('getLoginIdDup', {
			loginId : form.loginId.value,
			ajaxMode : 'Y'
		}, function(data){
			console.log(data);
			$(".loginId-msg").html(data.data1 + '은(는) ' + data.msg);
			if (data.success) {
				validLoginId = data.data1;
			}else {
				validLoginId = '';
			}
		}, 'json');
	}
	
	function requiredData(el) {
		$(".required-msg").empty();
		const form = $(el).closest('form').get(0);
		
		if (form.loginPw.value.length == 0) {
			$(".required-msg").html('필수 정보 입니다');
		}
	}
</script>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		
		<form action="doJoin"  method="POST" enctype="multipart/form-data" onsubmit="MemberJoin__submit(this); return false;">
			<div class="table-box-type-1">
				<table class="table table-zebra max-w-2xl m-auto">
<%-- 					<colgroup> --%>
<%-- 						<col width="200" /> --%>
<%-- 					</colgroup> --%>

					<tbody>
						<tr height="105">
							<th>아이디</th>
							<td class="">
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="loginId" placeholder="아이디를 입력하세요" onblur="checkLoginIdDup(this);"/>
								<div class="loginId-msg text-sm mt-2 h-5 text-red-500"></div>
							</td>
							
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="loginPw" placeholder="비밀번호를 입력하세요"/>
								<div class="required-msg text-sm mt-2 h-5 text-red-500"></div>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="" placeholder="비밀번호 확인" onblur="requiredData(this);"/>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="name" placeholder="이름을 입력하세요" value="${name}"/>
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="nickname" placeholder="닉네임을 입력하세요" value="${nickname}"/>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="cellphoneNum" placeholder="전화번호를 입력하세요" value="${loginPw}"/>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="email" placeholder="이메일을 입력하세요" value="${email}"/>
							</td>
						</tr>
						
<!-- 						<tr> -->
							
<!-- 						</tr> -->
						
					</tbody>
				</table>
				<div class="btn_area max-w-2xl">
					<button class="btn btn-accent w-full do-join-form">가입</button>
				</div>
			</div>
		</form>
		
			
	</div>
</section>




<%@ include file="../common/foot.jsp"%>
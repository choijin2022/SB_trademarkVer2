<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="login" />
<%@ include file="../common/head.jsp"%>

<script>
	let validLoginId = '';
	
	function MemberLogin__submit(form) {
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
		
	
		
		form.submit();
	}
	


</script>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		
		<form action="doLogin"  method="POST" enctype="multipart/form-data" onsubmit="MemberLogin__submit(this); return false;">
			<div class="table-box-type-1">
				<table class="table table-zebra max-w-2xl m-auto">
<%-- 					<colgroup> --%>
<%-- 						<col width="200" /> --%>
<%-- 					</colgroup> --%>

					<tbody>
						<tr>
							<th>아이디</th>
							<td class="">
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="loginId" placeholder="아이디를 입력하세요" onblur="checkLoginIdDup(this);"/>
							</td>
							
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input maxlength="38" class="input input-ghost w-full text-lg border-gray-400" type="text" name="loginPw" placeholder="비밀번호를 입력하세요"/>
							</td>
						</tr>
			
						
						
					</tbody>
				</table>
				<div class="btn_area max-w-2xl">
					<button class="btn btn-outline btn-accent w-full do-login-form">로그인</button>
				</div>
			</div>
		</form>
		
			
	</div>
</section>




<%@ include file="../common/foot.jsp"%>
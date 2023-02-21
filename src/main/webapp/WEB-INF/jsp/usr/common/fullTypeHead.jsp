<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>

<!-- 파비콘 불러오기 -->
<link rel="shortcut icon" href="/favicon.ico" />

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />
<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css" rel="stylesheet" type="text/css" />
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<!-- 커스텀 공통 CSS -->
<link rel="stylesheet" href="/resource/common.css" />
</head>
<body>

	<main>
	<div class="project-manage-header project-manage ">
					<header>
						<div class="h-16 flex container mx-auto text-3xl fixed">
							<a class="h-full px-16 flex items-center" href="/usr/home/main"><span>로고</span></a>
							<div class="flex-grow"></div>
							<ul class="flex ">
								<li class="hover:underline"><a class="h-full px-2 text-2xl flex items-center" href="/usr/trademark/trademarkApi"><span>상표검색</span></a></li>
								<li class="hover:underline"><a class="h-full px-2 text-2xl flex items-center" href="/usr/workspace/main"><span>work</span></a></li>
								<c:if test="${rq.getLoginedMemberId() == 0 }">
									<li class="hover:underline"><a class="h-full px-2 text-2xl flex items-center" href="/usr/member/login"><span>login</span></a></li>
									<li class="hover:underline"><a class="h-full px-2 text-2xl flex items-center" href="/usr/member/join"><span>join</span></a></li>
								</c:if>
								<c:if test="${rq.getLoginedMemberId() != 0 }">
<!-- 									<li class="hover:underline"><a class="h-full px-2 text-2xl flex items-center" href="/usr/member/myPage"><span>MYPAGE</span></a></li> -->
									<li class="hover:underline"><a class="h-full px-2 text-2xl flex items-center" href="/usr/member/doLogout"><span>logout</span></a></li>
								</c:if>
							</ul>
						</div>
					</header>
				</div>
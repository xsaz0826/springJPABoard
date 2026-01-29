<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BOARD | 상세보기 🔍</title>
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu:wght@400;700&family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">
<style>
:root {
	--bg-color: #fffaf0;
	--main-pink: #ffb7b2;
	--main-yellow: #fff9ae;
	--main-blue: #b2e2f2;
	--text-color: #4a4a4a;
	--border-style: 4px solid #5d5d5d;
}

body {
	background-color: var(--bg-color);
	font-family: 'Nanum Gothic', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
	padding: 20px;
	color: var(--text-color);
}

.detail-container {
	width: 100%;
	max-width: 650px;
	background: #ffffff;
	border: var(--border-style);
	border-radius: 25px;
	box-shadow: 12px 12px 0px #5d5d5d;
	overflow: hidden; /* 테두리 안쪽으로 내용 깔끔하게 */
	position: relative;
}

/* 상단 헤더 영역 - T1의 Header 기능을 계승 */
.detail-header {
	background: var(--main-yellow);
	padding: 35px 30px;
	border-bottom: var(--border-style);
}

.post-no {
	font-family: 'Gaegu', cursive;
	color: #ff6f61;
	font-weight: bold;
	font-size: 22px;
	display: block;
	margin-bottom: 5px;
}

.detail-header h1 {
	font-family: 'Gaegu', cursive;
	margin: 0;
	font-size: 38px;
	line-height: 1.2;
}

.post-info {
	margin-top: 15px;
	font-size: 14px;
	color: #777;
	display: flex;
	gap: 20px;
}

.post-info b {
	color: var(--text-color);
}

/* 본문 영역 - T1의 Content 기능을 계승 */
.detail-content {
	padding: 40px 30px;
	min-height: 250px;
	line-height: 1.8;
	font-size: 17px;
	white-space: pre-wrap;
	background-image: radial-gradient(#eee 1px, transparent 1px);
	/* 뽀짝한 도트 배경 */
	background-size: 20px 20px;
}

/* 하단 버튼 영역 - T1의 btn-area 기능을 계승 */
.btn-area {
	padding: 25px 30px;
	background: #fdfdfd;
	border-top: var(--border-style);
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.btn {
	padding: 10px 20px;
	font-family: 'Gaegu', cursive;
	font-size: 20px;
	font-weight: bold;
	border-radius: 12px;
	text-decoration: none;
	border: 3px solid #5d5d5d;
	transition: 0.1s;
	display: inline-flex;
	align-items: center;
	justify-content: center;
}

.btn-list {
	background: var(--main-blue);
	box-shadow: 0 4px 0 #88b7c5;
	color: var(--text-color);
}

.btn-group {
	display: flex;
	gap: 10px;
}

.btn-edit {
	background: var(--main-yellow);
	box-shadow: 0 4px 0 #d8d38b;
	color: var(--text-color);
}

.btn-delete {
	background: var(--main-pink);
	box-shadow: 0 4px 0 #d49a96;
	color: white;
}

.btn:active {
	transform: translateY(3px);
	box-shadow: none !important;
}

/* 푸터 데코레이션 */
.footer-deco {
	padding: 15px;
	text-align: center;
	font-family: 'Gaegu', cursive;
	font-size: 16px;
	color: #bbb;
	background: #fff;
	border-top: 2px dashed #eee;
}
</style>
</head>
<body>

	<div class="detail-container">
		<div class="detail-header">
			<span class="post-no">🎀 게시판번호 ${board.no}</span>
			<h1>
				<c:out value="${board.title}" />
			</h1>
			<div class="post-info">
				<span>WRITER: <b>${board.writer}</b></span> <span>DATE: <b><fmt:formatDate
							value="${board.regDate}" pattern="yyyy.MM.dd HH:mm" /></b></span>
			</div>
		</div>

		<div class="detail-content">${board.content}</div>

		<div class="btn-area">
			<a href="/board/boardList" class="btn btn-list">📋 게시판리스트</a>

			<div class="btn-group">
				<a href="/board/updateForm?no=${board.no}" class="btn btn-edit">✏️ 수정하기</a> 
				<a href="/board/delete?no=${board.no}" class="btn btn-delete"
					onclick="return confirm('정말 삭제하시겠습니까? ( •́ ̯ •̀ )')">🗑️ 삭제하기</a>
			</div>
		</div>

		<div class="footer-deco">✨ [ DATA ARCHIVE: BBO-JJAK SECURE
			TERMINAL ] ✨</div>
	</div>

</body>
</html>
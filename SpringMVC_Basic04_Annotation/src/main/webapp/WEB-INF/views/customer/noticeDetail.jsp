<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customer.css" />
</head>

<body>
    <div id="header">
        <div class="top-wrapper">
            <h1 id="logo">
                <a href="${pageContext.request.contextPath}/">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고" />
                </a>
            </h1>

            <ul id="loginmenu" class="block_hlist">
                <li><a href="${pageContext.request.contextPath}/">HOME</a></li>
                <li><a href="${pageContext.request.contextPath}/joinus/login">로그인</a></li>
                <li><a href="${pageContext.request.contextPath}/joinus/join">회원가입</a></li>
            </ul>

            <ul id="membermenu" class="clear">
                <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/menuMyPage.png" alt="마이페이지" /></a></li>
                <li><a href="${pageContext.request.contextPath}/customer/notice"><img src="${pageContext.request.contextPath}/resources/images/menuCustomer.png" alt="고객센터" /></a></li>
            </ul>
        </div>
    </div>

    <div id="visual" class="customer">
        <div class="top-wrapper"></div>
    </div>

    <div id="main">
        <div class="top-wrapper clear">
            <div id="content">
                <h2>공지사항</h2>
                <ul id="breadscrumb" class="block_hlist">
                    <li><a href="${pageContext.request.contextPath}/">HOME</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">공지사항</a></li>
                </ul>

                <div id="notice-article-detail" class="article-detail margin-large">
                    <dl class="article-detail-row">
                        <dt>제목</dt>
                        <dd>${notice.title}</dd>
                    </dl>
                    <dl class="article-detail-row">
                        <dt>작성일</dt>
                        <dd>${notice.regdate}</dd>
                    </dl>
                    <dl class="article-detail-row half-row">
                        <dt>작성자</dt>
                        <dd>${notice.writer}</dd>
                    </dl>
                    <dl class="article-detail-row half-row">
                        <dt>조회수</dt>
                        <dd>${notice.hit}</dd>
                    </dl>
                    <dl class="article-detail-row">
                        <dt>첨부파일</dt>
                        <dd>
                            <c:if test="${not empty notice.fileSrc}">
                                <a href="${pageContext.request.contextPath}/customer/download?file=${notice.fileSrc}">
                                    ${notice.fileSrc}
                                </a>
                            </c:if>
                            <c:if test="${empty notice.fileSrc}">첨부파일 없음</c:if>
                        </dd>
                    </dl>

                    <div class="article-content">${notice.content}</div>
                </div>

                <p class="article-comment margin-small">
                    <a class="btn-list button" href="${pageContext.request.contextPath}/customer/notice">목록</a>
                    <a class="btn-edit button" href="${pageContext.request.contextPath}/customer/notice/edit?seq=${notice.seq}">수정</a>
                    <a class="btn-del button" href="${pageContext.request.contextPath}/customer/notice/delete?seq=${notice.seq}">삭제</a>
                </p>
            </div>

            <div id="navi">
                <h2>고객센터</h2>
                <ul id="navi-menu">
                    <li><a href="#">소식</a></li>
                    <li><a href="#" class="current">공지사항</a></li>
                    <li><a href="#">1:1 고객문의</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div id="footer">
        <div class="top-wrapper">
            <h2><img src="${pageContext.request.contextPath}/resources/images/footerLogo.png" alt=""/></h2>
            <address>사업자등록번호<br/>주소 :</address>
            <p>Copyright ⓒ kosta.com All Right Reserved.</p>
        </div>
    </div>
</body>
</html>

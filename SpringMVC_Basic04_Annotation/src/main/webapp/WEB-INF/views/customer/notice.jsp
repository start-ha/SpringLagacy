<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>index</title>

    <!-- ✅ CSS 경로 수정 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/base.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css" />
</head>

<body>
    <div id="header">
        <div class="top-wrapper">
            <h1 id="logo">
                <a href="${pageContext.request.contextPath}/">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고" />
                </a>
            </h1>

            <h2 class="hidden">메인메뉴</h2>
            <ul id="mainmenu" class="block_hlist">
                <li><a href="#">kosa가이드</a></li>
                <li><a href="#">kosa과정</a></li>
                <li><a href="#">kosa</a></li>
            </ul>

            <form id="searchform" action="#" method="get">
                <fieldset>
                    <legend class="hidden">과정검색폼</legend>
                    <label for="query">과정검색</label>
                    <input type="text" name="query" />
                    <input type="submit" class="button" value="검색" />
                </fieldset>
            </form>

            <h3 class="hidden">로그인메뉴</h3>
            <ul id="loginmenu" class="block_hlist">
                <li><a href="${pageContext.request.contextPath}/index.jsp">HOME</a></li>
                <li><a href="${pageContext.request.contextPath}/joinus/login.jsp">로그인</a></li>
                <li><a href="${pageContext.request.contextPath}/joinus/join.jsp">회원가입</a></li>
            </ul>

            <h3 class="hidden">회원메뉴</h3>
            <ul id="membermenu" class="clear">
                <li>
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/resources/images/menuMyPage.png" alt="마이페이지" />
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/customer/notice">
                        <img src="${pageContext.request.contextPath}/resources/images/menuCustomer.png" alt="고객센터" />
                    </a>
                </li>
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
                <ul id="breadscrumb" class="block_hlist clear">
                    <li>HOME</li>
                    <li>고객센터</li>
                    <li>공지사항목록</li>
                </ul>

                <form id="content-searchform" class="article-search-form"
                      action="${pageContext.request.contextPath}/customer/notice" method="get">
                    <fieldset>
                        <legend class="hidden">목록 검색 폼</legend>
                        <input type="hidden" name="pg" value="${param.pg}" />
                        <label for="f" class="hidden">검색필드</label>
                        <select name="f">
                            <option value="TITLE">제목</option>
                            <option value="CONTENT">내용</option>
                        </select>
                        <label class="hidden" for="q">검색어</label>
                        <input type="text" name="p" value="${param.p}" />
                        <input type="submit" value="검색" />
                    </fieldset>
                </form>

                <table class="article-list margin-small">
                    <thead>
                        <tr>
                            <th class="seq">번호</th>
                            <th class="title">제목</th>
                            <th class="writer">작성자</th>
                            <th class="regdate">작성일</th>
                            <th class="hit">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="n" items="${list}">
                            <tr>
                                <td class="seq">${n.seq}</td>
                                <td class="title">
                                    <a href="${pageContext.request.contextPath}/customer/noticeDetail?seq=${n.seq}">
                                        ${n.title}
                                    </a>
                                </td>
                                <td class="writer">${n.writer}</td>
                                <td class="regdate"><fmt:formatDate value="${n.regdate}" pattern="yyyy-MM-dd"/></td>
                                <td class="hit">${n.hit}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <p class="article-comment margin-small">
                    <a class="btn-write button" href="${pageContext.request.contextPath}/customer/noticeReg">글쓰기</a>
                </p>
            </div>

            <div id="navi">
                <h2>고객센터</h2>
                <ul id="navi-menu">
                    <li><a href="#">소식</a></li>
                    <li><a href="#" class="current">공지사항</a></li>
                    <li><a href="#">1:1 고객문의</a></li>
                    <li><a href="#">학습도구</a></li>
                    <li><a href="#">학습안내</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div id="footer">
        <div class="top-wrapper">
            <h2><img src="${pageContext.request.contextPath}/resources/images/footerLogo.png" alt=""/></h2>
            <address>
                사업자등록번호 | 주소 :
            </address>
            <p>Copyright ⓒ kosta.com All Rights Reserved.</p>
        </div>
    </div>
</body>
</html>

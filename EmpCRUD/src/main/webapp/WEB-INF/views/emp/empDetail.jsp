<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<h2 class="text-center fw-bold">사원 상세 정보</h2>

<table class="table table-bordered shadow-sm bg-white mt-4">
  <tr><th>사번</th><td>${emp.EMPNO}</td></tr>
  <tr><th>이름</th><td>${emp.ENAME}</td></tr>
  <tr><th>직무</th><td>${emp.JOB}</td></tr>
  <tr><th>상사번호</th><td>${emp.MGR}</td></tr>
  <tr><th>입사일</th><td>${emp.HIREDATE}</td></tr>
  <tr><th>급여</th><td>${emp.SAL}</td></tr>
  <tr><th>커미션</th><td>${emp.COMM}</td></tr>
  <tr><th>부서번호</th><td>${emp.DEPTNO}</td></tr>
</table>

<div class="text-center mt-4">
  <a href="empEditForm.do?empno=${emp.EMPNO}" class="btn btn-warning">수정</a>
  <a href="empDelete.do?empno=${emp.EMPNO}" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
  <a href="empList.do" class="btn btn-secondary">목록으로</a>
</div>

<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

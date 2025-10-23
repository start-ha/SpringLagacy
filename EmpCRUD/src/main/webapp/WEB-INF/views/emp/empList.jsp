<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<div class="d-flex justify-content-between align-items-center mb-3">
  <h2>사원 목록</h2>
  <a href="empAddForm.do" class="btn btn-primary">사원 등록</a>
</div>

<table class="table table-hover table-bordered align-middle shadow-sm bg-white">
  <thead class="table-primary text-center">
    <tr>
      <th>사번</th>
      <th>이름</th>
      <th>직무</th>
      <th>입사일</th>
      <th>급여</th>
      <th>커미션</th>
      <th>부서</th>
      <th>관리</th>
    </tr>
  </thead>
  <tbody class="text-center">
    <c:forEach var="emp" items="${list}">
      <tr>
        <td>${emp.EMPNO}</td>
        <td>${emp.ENAME}</td>
        <td>${emp.JOB}</td>
        <td>${emp.HIREDATE}</td>
        <td>${emp.SAL}</td>
        <td>${emp.COMM}</td>
        <td>${emp.DEPTNO}</td>
        <td>
          <a href="empDetail.do?empno=${emp.EMPNO}" class="btn btn-sm btn-info text-white">조회</a>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<jsp:include page="/WEB-INF/views/inc/pagination.jsp" />

<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

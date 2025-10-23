<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<%
    // 현재 날짜를 "yyyy-MM-dd" 형식으로 포맷
    String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>

<div class="container mt-5">
  <h2 class="mb-4 text-center fw-bold">사원 정보 수정</h2>

  <form action="empEdit.do" method="post" class="border rounded-3 shadow-sm p-4 bg-light">
    <!-- ✅ 기본키 및 hiredate hidden 유지 (DB용) -->
    <input type="hidden" name="empno" value="${emp.EMPNO}">
    <input type="hidden" name="hiredate" value="${emp.HIREDATE}">

    <!-- ✅ 사번 -->
    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">사번</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" value="${emp.EMPNO}" readonly>
      </div>
    </div>

    <!-- ✅ 이름 -->
    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">이름</label>
      <div class="col-sm-10">
        <input type="text" name="ename" class="form-control" value="${emp.ENAME}" required>
      </div>
    </div>

    <!-- ✅ 직무 -->
    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">직무</label>
      <div class="col-sm-10">
        <input type="text" name="job" class="form-control" value="${emp.JOB}">
      </div>
    </div>

    <!-- ✅ 상사번호 -->
    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">상사번호</label>
      <div class="col-sm-10">
        <input type="number" name="mgr" class="form-control" value="${emp.MGR}">
      </div>
    </div>

    <!-- ✅ 입사일 + 수정일 표시 -->
    <div class="row mb-3 align-items-center">
      <label class="col-sm-2 col-form-label text-end">입사일</label>
      <div class="col-sm-4">
        <input type="text" class="form-control text-center" 
               value="${emp.HIREDATE}" readonly style="background-color:#f8f9fa;">
      </div>

      <label class="col-sm-2 col-form-label text-end">수정일</label>
      <div class="col-sm-4">
        <input type="text" class="form-control text-center" 
               value="<%= today %>" readonly style="background-color:#f8f9fa;">
      </div>
    </div>

    <!-- ✅ 급여 -->
    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">급여</label>
      <div class="col-sm-10">
        <input type="number" name="sal" class="form-control" value="${emp.SAL}">
      </div>
    </div>

    <!-- ✅ 커미션 -->
    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">커미션</label>
      <div class="col-sm-10">
        <input type="number" name="comm" class="form-control" value="${emp.COMM}">
      </div>
    </div>

    <!-- ✅ 부서번호 -->
    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">부서번호</label>
      <div class="col-sm-10">
        <input type="number" name="deptno" class="form-control" value="${emp.DEPTNO}">
      </div>
    </div>

    <div class="text-center mt-4">
      <button type="submit" class="btn btn-warning px-4">수정하기</button>
      <a href="empList.do" class="btn btn-secondary px-4 ms-2">목록으로</a>
    </div>
  </form>
</div>

<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

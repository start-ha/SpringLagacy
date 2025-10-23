<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<div class="container mt-5">
  <h2 class="mb-4 text-center fw-bold">사원 등록</h2>

  <c:if test="${not empty msg}">
    <div class="alert alert-danger text-center">${msg}</div>
  </c:if>

  <form action="empAdd.do" method="post" class="border rounded-3 shadow-sm p-4 bg-light">
    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">사번</label>
      <div class="col-sm-10">
        <input type="text" name="empno" class="form-control" required placeholder="예: 7788">
      </div>
    </div>

    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">이름</label>
      <div class="col-sm-10">
        <input type="text" name="ename" class="form-control" required placeholder="사원이름 입력">
      </div>
    </div>

    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">직무</label>
      <div class="col-sm-10">
        <input type="text" name="job" class="form-control" placeholder="예: SALESMAN">
      </div>
    </div>

    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">상사번호</label>
      <div class="col-sm-10">
        <input type="number" name="mgr" class="form-control" placeholder="예: 7839">
      </div>
    </div>

    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">급여</label>
      <div class="col-sm-10">
        <input type="number" name="sal" class="form-control" placeholder="예: 3000">
      </div>
    </div>

    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">커미션</label>
      <div class="col-sm-10">
        <input type="number" name="comm" class="form-control" placeholder="예: 500">
      </div>
    </div>

    <div class="row mb-3">
      <label class="col-sm-2 col-form-label text-end">부서번호</label>
      <div class="col-sm-10">
        <input type="number" name="deptno" class="form-control" placeholder="예: 10">
      </div>
    </div>

    <div class="text-center mt-4">
      <button type="submit" class="btn btn-primary px-4">등록하기</button>
      <a href="empList.do" class="btn btn-secondary px-4 ms-2">목록으로</a>
    </div>
  </form>
</div>

<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

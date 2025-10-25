<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>부서 관리</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body class="bg-light">

  <!-- 검색 / 등록 버튼 -->
  <div class="m-5">
    <table class="table table-striped">
      <thead>
        <tr>
          <th>
            부서번호 :
            <input type="text" id="deptnosearch">
            <button class="btn btn-secondary btn-sm" id="deptnosearchbtn">검색</button>
          </th>
          <th class="text-end">
            <button class="btn btn-primary" id="deptwritebtn">부서 등록</button>
          </th>
        </tr>
      </thead>
    </table>
  </div>

  <!-- ✅ 등록 모달 -->
  <div class="modal fade" id="writeModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <h5 class="modal-title">부서 등록</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <form id="writeForm">
            <div class="mb-3">
              <label for="formdeptno" class="form-label">DEPTNO</label>
              <input type="text" class="form-control" id="formdeptno" required>
            </div>
            <div class="mb-3">
              <label for="formdname" class="form-label">DNAME</label>
              <input type="text" class="form-control" id="formdname">
            </div>
            <div class="mb-3">
              <label for="formloc" class="form-label">LOC</label>
              <input type="text" class="form-control" id="formloc">
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-outline-success" id="deptwritesubmit">등록</button>
        </div>
      </div>
    </div>
  </div>

  <!-- ✅ 수정 모달 -->
  <div class="modal fade" id="updateModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header bg-primary text-white">
          <h5 class="modal-title">부서 수정</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <form id="updateForm">
            <div class="mb-3">
              <label for="formdeptno1" class="form-label">DEPTNO</label>
              <input type="text" class="form-control" id="formdeptno1" readonly>
            </div>
            <div class="mb-3">
              <label for="formdname1" class="form-label">DNAME</label>
              <input type="text" class="form-control" id="formdname1">
            </div>
            <div class="mb-3">
              <label for="formloc1" class="form-label">LOC</label>
              <input type="text" class="form-control" id="formloc1">
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-outline-primary" id="deptwritesubmit1">수정</button>
        </div>
      </div>
    </div>
  </div>

  <!-- ✅ 부서 목록 -->
  <div class="m-3">
    <table class="table table-striped">
      <thead>
        <tr>
          <th>DEPTNO</th>
          <th>DNAME</th>
          <th>LOC</th>
          <th>수정</th>
          <th>삭제</th>
        </tr>
      </thead>
      <tbody id="deptList"><!-- JS에서 채움 --></tbody>
    </table>
  </div>

  <!-- ✅ JS -->
  <script>
  window.onload = function() {

    // ✅ 1. 부서 전체 조회
    async function deptList() {
      const res = await fetch("${pageContext.request.contextPath}/dept");
      const data = await res.json();
      const tbody = document.getElementById("deptList");
      tbody.innerHTML = "";

      data.forEach(dept => {
        const row = `
          <tr>
            <td>\${dept.deptno}</td>
            <td>\${dept.dname}</td>
            <td>\${dept.loc}</td>
            <td><a class="btn btn-outline-primary deptupdate" data-deptno="\${dept.deptno}">수정</a></td>
            <td><a class="btn btn-outline-danger deptdelete" data-deptno="\${dept.deptno}">삭제</a></td>
          </tr>`;
        tbody.insertAdjacentHTML("beforeend", row);
      });
    }

    // ✅ 2. 특정 부서 조회
    async function searchByDeptno(deptno) {
      const res = await fetch(`\${"${pageContext.request.contextPath}"}/dept/\${deptno}`);
      const dept = await res.json();
      const tbody = document.getElementById("deptList");
      tbody.innerHTML = `
        <tr>
          <td>\${dept.deptno}</td>
          <td>\${dept.dname}</td>
          <td>\${dept.loc}</td>
          <td><a class="btn btn-outline-primary deptupdate" data-deptno="\${dept.deptno}">수정</a></td>
          <td><a class="btn btn-outline-danger deptdelete" data-deptno="\${dept.deptno}">삭제</a></td>
        </tr>`;
    }

    // ✅ 3. 부서 등록 (모달)
    async function insertDept() {
      const data = {
        deptno: document.getElementById("formdeptno").value,
        dname: document.getElementById("formdname").value,
        loc: document.getElementById("formloc").value
      };
      const res = await fetch("${pageContext.request.contextPath}/dept", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
      });
      alert(await res.text());
      // 모달 닫기
      const modalEl = document.getElementById("writeModal");
      const modalInstance = bootstrap.Modal.getInstance(modalEl);
      modalInstance.hide();
      deptList();
    }

    // ✅ 4. 부서 수정 (모달)
    async function updateDept() {
      const data = {
        deptno: document.getElementById("formdeptno1").value,
        dname: document.getElementById("formdname1").value,
        loc: document.getElementById("formloc1").value
      };
      const res = await fetch("${pageContext.request.contextPath}/dept", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
      });
      alert(await res.text());
      const modalEl = document.getElementById("updateModal");
      const modalInstance = bootstrap.Modal.getInstance(modalEl);
      modalInstance.hide();
      deptList();
    }

    // ✅ 5. 부서 삭제
    async function deleteDept(deptno) {
      if (!confirm(`\${deptno}번 부서를 삭제하시겠습니까?`)) return;
      const res = await fetch(`\${"${pageContext.request.contextPath}"}/dept/\${deptno}`, { method: "DELETE" });
      alert(await res.text());
      deptList();
    }

    // ✅ 6. 이벤트 바인딩
    document.getElementById("deptwritebtn").addEventListener("click", () => {
      document.getElementById("formdeptno").value = "";
      document.getElementById("formdname").value = "";
      document.getElementById("formloc").value = "";
      const modal = new bootstrap.Modal(document.getElementById("writeModal"));
      modal.show();
    });

    document.getElementById("deptwritesubmit").addEventListener("click", insertDept);
    document.getElementById("deptwritesubmit1").addEventListener("click", updateDept);

    document.getElementById("deptnosearchbtn").addEventListener("click", () => {
      const val = document.getElementById("deptnosearch").value;
      if (val === "") deptList(); else searchByDeptno(val);
    });

    // ✅ 수정/삭제 이벤트
    document.addEventListener("click", e => {
      if (e.target.classList.contains("deptdelete")) {
        const deptno = e.target.dataset.deptno;
        deleteDept(deptno);
      }
      if (e.target.classList.contains("deptupdate")) {
        const tr = e.target.closest("tr");
        document.getElementById("formdeptno1").value = tr.children[0].textContent;
        document.getElementById("formdname1").value = tr.children[1].textContent;
        document.getElementById("formloc1").value = tr.children[2].textContent;

        const modal = new bootstrap.Modal(document.getElementById("updateModal"));
        modal.show();
      }
    });

    // ✅ 초기 로딩
    deptList();
  };
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

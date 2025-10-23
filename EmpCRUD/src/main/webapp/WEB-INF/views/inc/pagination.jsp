<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${totalCount > 0}">
  <c:set var="pageCount" value="${(totalCount + pageSize - 1) / pageSize}" />
  <c:set var="pageBlock" value="5" />
  <c:set var="startPage" value="${((page - 1) / pageBlock) * pageBlock + 1}" />
  <c:set var="endPage" value="${startPage + pageBlock - 1}" />
  <c:if test="${endPage > pageCount}">
    <c:set var="endPage" value="${pageCount}" />
  </c:if>

  <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center mt-4">

      <!-- 🔹 첫 페이지로 이동 -->
      <c:if test="${page > 1}">
        <li class="page-item">
          <a class="page-link" href="empList.do?page=1" aria-label="First">
            &laquo;
          </a>
        </li>
      </c:if>

      <!-- 🔹 이전 페이지 블록 -->
      <c:if test="${page > 1}">
        <li class="page-item">
          <a class="page-link" href="empList.do?page=${page - 1}" aria-label="Previous">
            &lt;
          </a>
        </li>
      </c:if>

      <!-- 🔹 페이지 번호 -->
      <c:forEach var="p" begin="${startPage}" end="${endPage}">
        <li class="page-item ${page == p ? 'active' : ''}">
          <a class="page-link" href="empList.do?page=${p}">${p}</a>
        </li>
      </c:forEach>

      <!-- 🔹 다음 페이지 블록 -->
      <c:if test="${page < pageCount}">
        <li class="page-item">
          <a class="page-link" href="empList.do?page=${page + 1}" aria-label="Next">
            &gt;
          </a>
        </li>
      </c:if>

      <!-- 🔹 마지막 페이지로 이동 -->
      <c:if test="${page < pageCount}">
        <li class="page-item">
          <a class="page-link" href="empList.do?page=${pageCount}" aria-label="Last">
            &raquo;
          </a>
        </li>
      </c:if>

    </ul>
  </nav>
</c:if>

<c:if test="${totalCount == 0}">
  <div class="text-center text-muted mt-3">등록된 데이터가 없습니다.</div>
</c:if>

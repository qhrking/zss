<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<page:page model="${page}" pageUrl="" showPage="8">
  <div class="pageBox">
    <div class="pageLeft">
      <page:first><a class="toFirst" href="${pageUrl}"><span></span></a></page:first>
      <page:prev><a class="toUp" href="${pageUrl}"><span></span></a></page:prev>
    </div>
    <div class="pageNum">
      <span>${page.pageIndex}/${page.totalPage}</span>
    </div>
    <div class="pageRight">
      <page:next><a class="toDown" href="${pageUrl}"> <span></span></a></page:next>
      <page:last><a class="toLast" href="${pageUrl}"> <span></span></a></page:last>
    </div>
  </div>
</page:page>
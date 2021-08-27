<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	
<nav>
<ul>
<c:choose>
<c:when test="${side_menu=='admin_mode' }">
   <li>
		<H3>주요기능</H3>
		<ul>
			<li><a href="${contextPath}/admin/goods/adminGoodsMain.do">상품관리</a></li>
			<li><a href="${contextPath}/admin/order/adminOrderMain.do">주문관리</a></li>
			<li><a href="${contextPath}/admin/member/adminMemberMain.do">회원관리</a></li>

		</ul>
	</li>
</c:when>
<c:when test="${side_menu=='my_page' }">
	<li>
		<h3>주문내역</h3>
		<ul>
			<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역/배송 조회</a></li>
			<li><a href="${contextPath}/mypage/listMyOrderHistory.do">반품/교환 신청 및 조회</a></li>
		</ul>
	</li>
	<li>
		<h3>정보내역</h3>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">회원정보관리</a></li>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">나의 주소록</a></li>

		</ul>
	</li>
</c:when>
<c:otherwise>
	<li>
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;국내외 도서</h3>
		<ul>
			<li><a href="${contextPath}/goods/searchGoods.do?searchWord=자바&search=검+색">JAVA</a></li>
			<li><a href="${contextPath}/goods/searchGoods.do?searchWord=파이썬&search=검+색">Python</a></li>
			<li><a href="${contextPath}/goods/searchGoods.do?searchWord=리액트&search=검+색">React</a></li>
			<li><a href="${contextPath}/goods/searchGoods.do?searchWord=딥러닝&search=검+색">deep learning</a></li>
			<li><a href="${contextPath}/goods/searchGoods.do?searchWord=실기&search=검+색">practical technique</a></li>
		<li><a href="${contextPath}/goods/searchGoods.do?searchWord=따라하기&search=검+색">copy</a></li>
		</ul>
	</li>
	<li>
      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日本書籍</h3>
      <ul>
      <li><a href="${contextPath}/goods/searchGoods.do?searchWord=자바&search=검+색">JAVA</a></li>
       <li><a href="${contextPath}/goods/searchGoods.do?searchWord=파이썬&search=검+색">Python</a></li>
       <li><a href="${contextPath}/goods/searchGoods.do?searchWord=리액트&search=검+색">React</a></li>
         <li><a href="${contextPath}/goods/searchGoods.do?searchWord=딥러닝&search=검+색">deep learning</a></li>
         <li><a href="${contextPath}/goods/searchGoods.do?searchWord=실기&search=검+색">practical technique</a></li>
         	<li><a href="${contextPath}/goods/searchGoods.do?searchWord=따라하기&search=검+색">copy</a></li>
		</ul>
	</li>
 </c:otherwise>
</c:choose>	
</ul>
</nav>
<div class="clear"></div>
<div id="banner">
	<a href="#"><img width="190" height="163" src="${contextPath}/resources/image/n-pay.jpg"> </a>
</div>



<div id="banner">
	<a href="#"><img width="190" height="362" src="${contextPath}/resources/image/side_banner1.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="190" height="104" src="${contextPath}/resources/image/call_center_logo.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="190" height="69" src="${contextPath}/resources/image/QnA_logo.jpg"></a>
</div>
</html>
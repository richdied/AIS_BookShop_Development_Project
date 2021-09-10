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
		<H3>メーン機能</H3>
		<ul>
			<li><a href="${contextPath}/admin/goods/adminGoodsMain.do">商品管理</a></li>
			<li><a href="${contextPath}/admin/order/adminOrderMain.do">注文管理</a></li>
		</ul>
	</li>
</c:when>
<c:when test="${side_menu=='my_page' }">
	<li>
		<h3>注文内訳</h3>
		<ul>
			<li><a href="${contextPath}/mypage/listMyOrderHistory.do">注文内容/配送照会</a></li>
			<li><a href="${contextPath}/mypage/listMyOrderHistory.do">返品/交換申し込み及び照会</a></li>
		</ul>
	</li>
	<li>
		<h3>情報内訳</h3>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">会員情報管理</a></li>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">私の住所録</a></li>

		</ul>
	</li>
</c:when>
<c:otherwise>

	<li>
      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IT書籍</h3>
      <ul>
      <li><a href="${contextPath}/goods/searchGoods.do?searchWord=JAVA&search=検索">JAVA</a></li>
       <li><a href="${contextPath}/goods/searchGoods.do?searchWord=Python&search=検索">Python</a></li>
       <li><a href="${contextPath}/goods/searchGoods.do?searchWord=React&search=検索">React</a></li>
         <li><a href="${contextPath}/goods/searchGoods.do?searchWord=ディープラーニング&search=検索">ディープラーニング</a></li>
         <li><a href="${contextPath}/goods/searchGoods.do?searchWord=実技&search=検索">実技 </a></li>
         	<li><a href="${contextPath}/goods/searchGoods.do?searchWord=真似&search=検索">copy</a></li>
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
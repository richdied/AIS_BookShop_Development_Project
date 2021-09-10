<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta   charset="utf-8">
<script>
function search_order_history(fixedSearchPeriod){
	var formObj=document.createElement("form");
	var i_fixedSearch_period = document.createElement("input");
	i_fixedSearch_period.name="fixedSearchPeriod";
	i_fixedSearch_period.value=fixedSearchPeriod;
    formObj.appendChild(i_fixedSearch_period);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="${contextPath}/mypage/listMyOrderHistory.do";
    formObj.submit();
}

function fn_cancel_order(order_id){
	var answer=confirm("注文をキャンセルしますか。");
	if(answer==true){
		var formObj=document.createElement("form");
		var i_order_id = document.createElement("input"); 
	    
	    i_order_id.name="order_id";
	    i_order_id.value=order_id;
		
	    formObj.appendChild(i_order_id);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/mypage/cancelMyOrder.do";
	    formObj.submit();	
	}
}

</script>
</head>
<body>
	<H3>注文配送照会</H3>
	<form  method="post">	
		<table>
			<tbody>
				<tr>
					<td>
						<input type="radio" name="simple"  checked/> 簡単照会 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="simple" /> 近日  &nbsp;&nbsp;&nbsp;
						<input type="radio" name="simple" /> 月間
					</td>
				</tr>
				<tr>
					<td>
					  <select name="curYear">
					    <c:forEach   var="i" begin="0" end="5" >
					      <c:choose>
					        <c:when test="${endYear==endYear-i }">
					          <option value="${endYear}" selected>${endYear}</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${endYear-i }">${endYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 <select name="curMonth" >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>月
					
					 <select name="curDay">
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>日  &nbsp;以前&nbsp;&nbsp;&nbsp;&nbsp; 
					
					</td>
				</tr>
				<tr>
				  <td>
				    <select name="search_condition">
						<option value="2015" checked>全体</option>
						<option value="2014">受領者</option>
						<option value="2013">注文者</option>
						<option value="2012">注文番号</option>
					</select>
					<input  type="text"  size="30" />  
					<input   type="button"  value="照会"/>
				  </td>
				</tr>
				<tr>
				  <td>
					照会した期間:<input  type="text"  size="4" value="${beginYear}" />年
							<input  type="text"  size="4" value="${beginMonth}"/>月
							 <input  type="text"  size="4" value="${beginDay}"/>日
							 &nbsp; ~
							<input  type="text"  size="4" value="${endYear}" />年
							<input  type="text"  size="4" value="${endMonth}"/>月
							 <input  type="text"  size="4" value="${endDay}"/>日						 
				  </td>
				</tr>
			</tbody>
		</table>
		<div class="clear">
	</div>
</form>	
<div class="clear"></div>
<table class="list_view">
		<tbody align=center >
			<tr style="background:#33ff00" >
				<td class="fixed" >注文番号</td>
				<td class="fixed">注文日付</td>
				<td>注文内訳</td>
				<td>注文金額</td>
				<td>注文状態</td>
				<td>注文者</td>
				<td>受領者</td>
				<td>注文取り消し</td>
			</tr>
   <c:choose>
     <c:when test="${empty myOrderHistList }">			
			<tr>
		       <td colspan=8 class="fixed">
				  <strong>注文した商品がありません。</strong>
			   </td>
		     </tr>
	 </c:when>
	 <c:otherwise> 
     <c:forEach var="item" items="${myOrderHistList }" varStatus="i">
        <c:choose>
          <c:when test="${item.order_id != pre_order_id }">   
            <tr>       
				<td>
				  <a href="${contextPath}/mypage/myOrderDetail.do?order_id=${item.order_id }"><strong>${item.order_id }</strong>  </a>
				</td>
				<td >
				 <strong>${item.pay_order_time }</strong> 
				</td>
				<td> 
				    <strong>
					   <c:forEach var="item2" items="${myOrderHistList}" varStatus="j">
				          <c:if  test="${item.order_id ==item2.order_id}" >
				            <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item2.goods_id }">${item2.goods_title }</a><br>
				         </c:if>   
					 </c:forEach>
					 </strong>
				</td>
				<td>
				   <strong>
				      <c:forEach var="item2" items="${myOrderHistList}" varStatus="j">
				          <c:if  test="${item.order_id ==item2.order_id}" >
				             ${item.goods_sales_price*item.order_goods_qty }円/${item.order_goods_qty }<br>
				         </c:if>   
					 </c:forEach>
				   </strong>
				</td>
				<td>
				  <strong>
				    <c:choose>
					    <c:when test="${item.delivery_state=='delivery_prepared' }">
					       配送準備中
					    </c:when>
					    <c:when test="${item.delivery_state=='delivering' }">
					       配送中
					    </c:when>
					    <c:when test="${item.delivery_state=='finished_delivering' }">
					   　　 配送済み
					    </c:when>
					    <c:when test="${item.delivery_state=='cancel_order' }">
					       注文取り消し
					    </c:when>
					    <c:when test="${item.delivery_state=='returning_goods' }">
					       返品
					    </c:when>
				  </c:choose>
				  </strong>
				</td>
				<td>
				 <strong>${item.orderer_name }</strong> 
				</td>
				<td>
					<strong>${item.receiver_name }</strong>
				</td>
				<td>
			     <c:choose>
			   <c:when test="${item.delivery_state=='delivery_prepared'}">
			       <input  type="button" onClick="fn_cancel_order('${item.order_id}')" value="注文取り消し"  />
			   </c:when>
			   <c:otherwise>
			      <input  type="button" onClick="fn_cancel_order('${item.order_id}')" value="注文取り消し" disabled />
			   </c:otherwise>
			  </c:choose>
			    </td>
			</tr>
			<c:set  var="pre_order_id" value="${item.order_id }" />
		   </c:when>	
	  </c:choose>		
	</c:forEach>
	</c:otherwise>
  </c:choose>			   
		</tbody>
	</table>
     	
	<div class="clear"></div>
</body>
</html>
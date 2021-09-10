<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>


<body>
	<h1>新製品のイメージ登録ウィンドウ</h1>
	<br>
	<form action="${pageContext.request.contextPath}/admin/goods/addNewGoods.do" method="post"	enctype="multipart/form-data">
	<table  cellspacing="0" cellpadding="0">
		<tr>
			<td>メイン·イメージ</td>
			<td>
				<input type="file" name="main_image"><br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
		<tr>
			<td>詳細イメージ1</td>
			<td>
				<input type="file" name="detail_image1"><br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
		<tr>
			<td>詳細イメージ2:</td>
			<td>
				<input type="file" name="detail_image2"><br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
		<tr>
			<td>詳細イメージ3:</td>
			<td>
				<input type="file" name="detail_image3"><br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
		
		<tr colspan=2 >
			<td >
			  <br>
			   <input	type="submit" value="製品画像を登録する">
			</td>
		</tr>
	</table>
</form>
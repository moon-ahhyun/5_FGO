<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文確認</title>
<link rel="stylesheet" type="text/css" href="Order.css">
</head>
<body>
	<!-- 注文確定 -->
	<!-- フォーム -->
	<form action="/tsys" method="POST" name="inform">
		<!-- ボタンID用フィールド -->
		<input type="hidden" name="BUTTON_ID" value="">
	<div align="center">
		<h2>注文確定</h2>
		<h3>ありがとうございました！</h3>
	<br>
	<table>
		<tr>
			<td><h4>注文番号：</h4></td>
			<td><c:out value="${requestScope.orderNo}" /></td>
		</tr>
	</table>
		<h4>購入商品情報</h4>
	</div>
	<div align="center">
		<table border="0">
		<tr class="sample1">
			<td class="padding">ホテルコード</td>
			<td class="padding">ホテル名</td>
			<td class="padding">宿泊日</td>
			<td class="padding">宿泊料金</td>
			<td class="padding">部屋数</td>
			<td class="padding">小計</td>
		</tr>
		<c:forEach items="${sessionScope.cart}">
		<tr>
			<td><c:out value="${sessionScope.cart.hotel.hotelcode}" /></td>
			<td><c:out value="${sessionScope.cart.hotel.hotelName}" /></td>
			<td><c:out value="${sessionScope.cart.hotel.hotelDate}" /></td>
			<td><c:out value="${sessionScope.cart.hotel.price}" />円</td>
			<td  align="right"><c:out value="${sessionScope.cart.reservNo}" /></td>
			<td><c:out value="${sessionScope.cart.calcPrice()}" />円</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="right">合計<td>
			<td><c:out value="${sessionScope.cart.calcPrice()}" />円</td>
		</tr>
	</table>
	</div>
	<br>
	<div align="left">
		<h4>メンバー情報</h4>
	</div>
	<div align="left">
		<table border="0">
		<tr>
			<td class="sample1">メンバーコード</td>
			<td class="padding"><c:out value="${sessionScope.memberCode}" /></td>
		</tr>
		<tr>
			<td class="sample1">メンバー名</td>
			<td class="padding"><c:out value="${sessionScope.name}" /></td>
		</tr>
		<tr>
			<td class="sample1">送付先</td>
			<td class="padding"><c:out value="${requestScope.address}" /></td>
		</tr>
		<tr>
			<td class="sample1">決済方法<td>
			<td><c:out value="${requestScope.payment}" /></td>
		</tr>
	</table>
	</div>
	<div align="center">
			<span onclick="document.inform.BUTTON_ID.value='M_01';document.inform.submit()"
              class="button">メニューへ</span>
	</div>
	</form>
</body>
</html>
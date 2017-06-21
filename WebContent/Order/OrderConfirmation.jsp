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
	<!-- 注文確認 -->
	<!-- フォーム -->
	<form action="/tourSystem/tsys" method="POST" name="inform">
		<!-- ボタンID用フィールド -->
		<input type="hidden" name="BUTTON_ID" value="">
	<div align="center">
		<h2>注文確認</h2>
	</div>
	<br>
	<br>
	<br>
	<div align="left">
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
		<c:forEach var="hotel" items="${sessionScope.cart}">
		<tr>
			<td><c:out value="${hotel.hotelcode}" /></td>
			<td><c:out value="${hotel.hotelName}" /></td>
			<td><c:out value="${hotel.hotelDate}" /></td>
			<td><c:out value="${hotel.price}" />円</td>
			<td  align="right"><c:out value="${hotel.reservNo}" /></td>
			<td><c:out value="${hotel.calcPrice()}" />円</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="right">合計<td>
			<td class="sample2">
				<c:forEach var="hotel" items="${sessionScope.cart}">
				${totalPrice += hotel.price}$
				</c:forEach>
				<c:out value="${totalPrice}" />円
			</td>
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
			<td class="padding">
				〒<c:out value="${requestScope.member.zipCode}" />　　
				<c:out value="${requestScope.member.prefecture}" />
				<c:out value="${requestScope.member.address}" />
			</td>
		</tr>
		<tr>
			<td class="sample1">決済方法<td>
				<select name="PAYMENT">
					<option value="代金引換">代金引換</option>
					<option value="コンビに決済">コンビニ決済</option>
				</select>
		</tr>
	</table>
	</div>
	<div align="center">
			<span onclick="document.inform.BUTTON_ID.value='0201_01_01';document.inform.submit()"
              class="button">注文確定</span>
	</div>
	</form>
</body>
</html>
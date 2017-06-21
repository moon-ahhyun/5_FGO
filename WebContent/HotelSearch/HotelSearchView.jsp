<%-- pageディレクティブの使用 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- taglibディレクティブタグで、使用するタグライブラリを宣言 --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ホテル検索</title>
<link rel="stylesheet" type="text/css" href="/tourSystem/HotelSearch/Search.css">
</head>
<body>
	<%-- 定義済みオブジェクトの使用 --%>
	<%
		request.setCharacterEncoding("UTF8");
	%>


	<div align="center">
		<h2>ホテル検索</h2>
	</div>
	<br>
	<br>
	<br>
	<div align="center">
		<form id="form" method="post" action="/tourSystem/tsys">
			<table>
				<tr class="sample1">
					<td class="padding">宿泊日を選ぶ</td>
					<td class="padding">宿泊都市を選ぶ</td>
				</tr>
				<tr>
					<td class="padding"><select id="year" name="year">
							<option value="2017">2017</option>
							<option value="2018">2018</option>
					</select> 年 <select id="month" name="month">
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select> 月 <select id="date" name="date">
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
					</select> 日</td>
					<td class="padding"><select id="city" name="city">
							<option value="01">札幌</option>
							<option value="02">旭川</option>
							<option value="03">函館</option>
							<option value="04">福岡</option>
							<option value="05">鹿児島</option>
							<option value="06">那覇</option>

					</select></td>
				</tr>
			</table>
			<input type="hidden" name="BUTTON_ID" value=""> <input
				type="submit" value="検索"
				onclick="this.form.BUTTON_ID.value='0802_01_01';">
		</form>
	</div>
	<br>
	<br>
	<br>
	<div id="table">
		<br> <br> <br>
		<div align="center">
			<table>
				<tr class="sample1">
					<td class="padding">商品コード</td>
					<td class="padding">ホテル名</td>
					<td class="padding">料金</td>
					<td class="padding">空室</td>
				</tr>
				<c:forEach var="hotelList" items="${requestScope.HotelList}">
					<tr>
						<td class="padding"><a
							href="./tsys?BUTTON_ID=L0802_01_01&itemCode=${hotelList.itemCode}"><c:out
									value="${hotelList.itemCode}"/></a></td>
						<td><c:out value="${hotelList.hotelName}" /></td>
						<td class="number"><c:out value="${hotelList.basicPrice}" /></td>
						<td class="number"><c:out value="${hotelList.stock}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>
<%-- pageディレクティブの使用 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- taglibディレクティブタグで、使用するタグライブラリを宣言 --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ホテル検索</title>
<link rel="stylesheet" type="text/css" href="Hotel.css">
</head>
<body>
	<%-- 定義済みオブジェクトの使用 --%>
	<% request.setCharacterEncoding("UTF8"); %>

	<div align="center">
		<h2>ホテル検索</h2>
	</div>
	<br>
	<br>
	<br>
	<div align="center">
		<table>
			<tr class="sample1">
				<td class="padding">宿泊日を選ぶ</td>
				<td class="padding">宿泊都市を選ぶ</td>
			</tr>
			<tr>
				<td class="padding"><select name="年">
						<option value="1">2017</option>
						<option value="2">2018</option>
					</select>
					年
					<select name="月">
						<option value="1">6</option>
						<option value="2">7</option>
						<option value="3">8</option>
						<option value="4">9</option>
						<option value="5">10</option>
						<option value="6">11</option>
						<option value="7">12</option>
					</select>
					月
					<SELECT name="日">
						<option value="">--</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
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
 </select>
日

				</td>
				<td class="padding">
					<select name="都市名">
						<option value="1">北海道</option>
						<option value="2">東北</option>
						<option value="3">関東</option>
						<option value="4">中部</option>
						<option value="5">近畿</option>
						<option value="6">四国</option>
						<option value="7">九州</option>
						<option value="7">沖縄</option>
					</select>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<br>
	<!-- フォーム -->
	<form action="//" method="POST" name="fm">
		<div align="center">
			<a href="#" class="button">検索</a>
	</div>
	<br>
	<br>
	<br>
	<div align="center">
		<table>
			<tr class="sample1">
				<td class="padding">商品コード</td>
				<td class="padding">ホテル名</td>
				<td class="padding">料金</td>
				<td class="padding">空室</td>
			</tr>
			<tr>
				<td class="padding"><a href="#">XXXXXX</a></td>
				<td class="padding">XXXXXXXXX</td>
				<td class="number">XXXXXXX</td>
				<td class="number">3</td>
			</tr>
			<tr>
				<td class="padding"><a href="#">XXXXXX</a></td>
				<td class="padding">XXXXXXXXX</td>
				<td class="number">XXXXXXX</td>
				<td class="number">5</td>
			</tr>
			<tr>
				<td class="padding"><a href="#">XXXXXX</a></td>
				<td class="padding">XXXXXXXXX</td>
				<td class="number">XXXXXXX</td>
				<td class="number">0</td>
			</tr>
			<tr>
				<td class="padding"><a href="#">XXXXXX</a></td>
				<td class="padding">XXXXXXXXX</td>
				<td class="number">XXXXXXX</td>
				<td class="number">2</td>
			</tr>
		</table>
	</div>
</body>
</html>
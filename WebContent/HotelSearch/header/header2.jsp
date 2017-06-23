<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Header2</title>
</head>
<body>
		<form id="form" method="post" action="/tourSystem/tsys">

	<div style="webkit-box-shadow: 0px 3px 5px rgba(100, 100, 100, 0.49);
 		-moz-box-shadow:    0px 3px 5px rgba(100, 100, 100, 0.49);
	 	box-shadow:         0px 3px 5px rgba(100, 100, 100, 0.49);">
		<table style="width: 100%;  padding:2%; color:#5A5050;">
		<tr>
			<td class="element" style="width: 25%; font-family: 'Verdana'; font-size:30px;">
				<a href="MainMenu/MainMenu.jsp" style="text-decoration:none; color:#5A5050;">FLM tours</a>
			</td>
			<td align="right"style="width: 50%; font-size:20px;"><c:out value="${sessionScope.memberName}" /> 様</td>
			<td align="center" style="width: 10%; ">
				<img src="img/cart.png" alt="カート画面へ" style="width: 30px; height: 30px; ">
			</td>
			<td class="padding" style="width: 10%; font-size:20px;">
				<a onclick="this.form.BUTTON_ID.value='M_06'; this.form.submit()">ログアウト</a></td>
		</tr>
		</table>
	</div>
	</form>

</body>
</html>
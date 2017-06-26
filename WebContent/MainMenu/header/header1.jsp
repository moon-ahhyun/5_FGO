<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" marginwidth="0" marginheight="0">
	<div style="webkit-box-shadow: 0px 3px 5px rgba(100, 100, 100, 0.49);
 		-moz-box-shadow:    0px 3px 5px rgba(100, 100, 100, 0.49);
	 	box-shadow:         0px 3px 5px rgba(100, 100, 100, 0.49);">
		<table style="width: 100%;  padding:1%; color:#5A5050;">
		<tr>
			<td class="element" style="width: 70%; font-family: 'Verdana'; font-size:30px;">
				<a style="text-decoration:none; color:#5A5050;">FLM tours</a>
			</td>
			<td align="center" style="width: 10%; ">
				<img src="img/cart.png" alt="カート画面へ" style="width: 30px; height: 30px;" onclick="document.inform.BUTTON_ID.value='M_05';document.inform.submit()">
			</td>
			<td class="element" style="width: 10%; font-size:20px;">
			<input type="button" class="button2" value="新規登録" onClick="document.inform.BUTTON_ID.value='M_02';document.inform.submit();">
			</td>
			<td class="element" style="width: 10%; font-size:20px;">
			<input type="button" class="button1"  name="login" value="ログイン" onClick="document.inform.BUTTON_ID.value='M_03';document.inform.submit();">
			</td>

		</tr>
		</table>
		</div>
</body>
</html>
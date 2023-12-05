<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>Error 발생</title>
</head>

<body>
	<h1>
		<font color="orange">Exception 발생</font>
	</h1>
	<a href="/">메인 화면으로</a>
	<hr>
	<table>
		<tr>
			<th bgcolor="orange" align="left">예외 메시지 : ${exception}</th>
		</tr>
	</table>
	<img src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/%ED%8F%AC%ED%9A%A8%EA%B3%B0.jpg" style="width:100%">
</body>

</html>
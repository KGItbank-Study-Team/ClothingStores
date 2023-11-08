<%@page import="com.kgitbank.slimbear.vo.OrderProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P id="result">${member}</P>
	<div class="slide_item">
		<img src="/resources/images/testImage.jpg" alt="">
	</div>

	<form action="/app/order/product" method="post">
		<table>
			<tr>
				<td>color : <input name='productList[0].color' type="text" /><br>
				</td>
				<td>size : <input name='productList[0].size' type='text' /><br>
				</td>
				<td>count : <input name='productList[0].cnt' type="text" /><br>
				</td>
			</tr>
				<tr>
				<td>color : <input name='productList[1].color' type="text" /><br>
				</td>
				<td>size : <input name='productList[1].size' type='text' /><br>
				</td>
				<td>count : <input name='productList[1].cnt' type="text" /><br>
				</td>
			</tr>
			</tr>
				<tr>
				<td>color : <input name='productList[2].color' type="text" /><br>
				</td>
				<td>size : <input name='productList[2].size' type='text' /><br>
				</td>
				<td>count : <input name='productList[2].cnt' type="text" /><br>
				</td>
			</tr>
		</table>
		<input type='submit' value='로그인'>
	</form>

	<script>
    	$(document).ready(function(){
    		$(".idd").blur(checkDuplicateMemberID);
    	});
    	
    	function checkDuplicateMemberID(){
    		$.ajax({
    		    url: "/app/member/id/duplicate",
    		    type: "POST",
    		    data: {
    		    	id: $(".idd").val()
    		    },
    		    success: function(data){
    		    	$("#id_check").text(data.text);
    		    },
    		    error: function(){
    		        alert("err");
    		    }
    		});
    	}
 </script>

</body>
</html>

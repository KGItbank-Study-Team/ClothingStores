<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P id="result">  The time on the </P>
   <div class="slide_item"><img src="/resources/images/testImage.jpg" alt=""></div>
<script type="text/javascript" >
var form = {
        id:"안녕하세요",
        password: "asdf"
}
$.ajax({
    url: "/app/product/list?sex=1",
    type: "GET",
    data: form,
    success: function(data){
        $('#result').text(JSON.stringify(data));
    },
    error: function(){
        alert("simpleWithObject err");
    }
});
</script>

</body>
</html>

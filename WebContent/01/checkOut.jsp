<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkOut</title>
</head>
<body>
<center>
<H3>계산</H3>
선택한 상품 목록
<hr>
<%
	ArrayList list=(ArrayList)session.getAttribute("menulist");
	if(list==null){
		out.println("선택한 상품이 없음");
	}else{
		for(Object menuname:list){
			out.println(menuname+"<BR>");
		}
}
%>
</center>
</body>
</html>
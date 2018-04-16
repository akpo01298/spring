<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, java.text.*" %>
    <% String userid="";
	String error=null;
	
	request.setCharacterEncoding("UTF-8");
	
	if(request.getMethod().equals("POST")){
		userid=request.getParameter("userid");
	}
	
	if(userid==null || userid.length()==0){
		error="아이디를 입력하세요";
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selProduct</title>
</head>

<body>
<% if (error!=null){ %>
로그인실패:<%=error %>
<%}else{ %>
<center>
<h3> 상품 선택 </h3>
<hr>
<h4><%=userid%>님 반갑습니다.</h4>
<hr>

<form name="form1" method="POST" action="add.jsp">
<select name="menu">
<option>치킨</option>
<option>피자</option>
<option>햄버거</option>
<option>도시락</option>
<option>커피</option>
<option>음료수</option>
<option>물</option>
</select>

<button type="button" class="btn btn-danger">저장</button>
</form>
<a href=checkOut.jsp>계산</a></center>
<%} %>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8"); //한글 캐릭터셋 변환
	String username=request.getParameter("username");
	
	if(username!=null){	
		session.setAttribute("user",username);
		}
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면</title>
</head>
<body>
<div align=center>
<h3>my  sns</h3>
<hr>
<form action="sns.jsp" method="POST">
	@<%=session.getAttribute("user") %><input type="text" name="msg">
	<input type ="submit" value="sns"></form>
<hr>
<div align="left">
<ul>
<%
	ArrayList<String>msgs=(ArrayList<String>)application.getAttribute("msgs");
	if(msgs!=null){
		for(String msg:msgs){
			out.println("<li>"+msg+"</li>");
		}
	}
%>
</ul></div>
</div>
	
</body>
</html>
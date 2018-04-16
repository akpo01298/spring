<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add</title>
</head>
<body>
<% 	
	request.setCharacterEncoding("UTF-8");	
	String menuname=request.getParameter("menu");
	ArrayList list=(ArrayList)session.getAttribute("menulist");
	if(list==null){

		list=new ArrayList();
		session.setAttribute("menulist", list);
	}
	
		list.add(menuname);
%>
<script>
alert("<%=menuname%> 가 (이) 저장되었습니다.");
history.go(-1);

</script>
</body>
</html>
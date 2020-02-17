<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="web.mail.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String u_id = request.getParameter("u_id");
	String u_email = request.getParameter("u_email");
	String title = request.getParameter("title");
	String user_textarea = request.getParameter("user_textarea");
	
	MailSend ms = new MailSend();
	ms.MailSendForUser(u_email, title, user_textarea);
%>
<script type="text/javascript">
alert("전송이 완료되었습니다");
location.href="../user_manage.jsp";

</script>
</body>
</html>
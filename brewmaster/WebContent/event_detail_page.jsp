<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="css_all/event_page_style.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css?var=1" rel="stylesheet" type="text/css" />
</head>

<body>
<%
	request.setCharacterEncoding("utf-8");
	//String page = request.getParameter("page");
	
%>
<div id=wrap>
 <div id="head">
    <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
<div id="event_page">
  <div id="event_title">
    <div id="event_title_img"><img src="images/events_page_images/events_title.png" width="200" height="50" /></div><!--event_title_img -->
  </div><!--event_title -->
  <div id="event_detail">
    <div id="event_detail_img"><img src="images/events_page_images/event${param.page}_detail.png" width="800" height="1000" /></div><!--event_detail_img -->
  </div><!--event_detail -->
</div><!--event_page -->
</div><!-- body -->
  <div id="foot">
   <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  
  </div><!--foot -->
</div><!-- wrap -->
</body>
</html>

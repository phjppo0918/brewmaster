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
<link href="css_all/event_page_style.css?var=1" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css?var=1" rel="stylesheet" type="text/css" />
</head>

<body>
<div id=wrap>
 <div id="head">
    <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
<div id="event_page">
  <div id="event_title">
    <div id="event_title_img"><img src="images/events_page_images/events_title.png" width="200" height="50" /></div><!--event_title_img -->
  </div><!--event_title -->
  <div id="event_contents">
    <div id="events_contents_img">
      <div class="event01"><img src="images/events_page_images/event01.png" width="335" height="200" 
      onclick="location.href='event_detail_page.jsp?page=01'"/></div><!--event01 -->
      <div class="event02"><img src="images/events_page_images/event02.png" width="335" height="200"
       onclick="location.href='event_detail_page.jsp?page=02'" /></div><!--event02 -->
      <div class="event03"><img src="images/events_page_images/event03.png" width="335" height="200" 
      onclick="location.href='event_detail_page.jsp?page=03'"/></div><!--event03 -->
      <div class="event04"><img src="images/events_page_images/event04.png" width="335" height="200" 
      onclick="location.href='event_detail_page.jsp?page=04'"/></div><!--event04 -->
      <div class="event05"><img src="images/events_page_images/event05.png" width="335" height="200"
      onclick="location.href='event_detail_page.jsp?page=05'" /></div><!--event05 -->
    </div><!--events_contents_img -->
  </div><!--event_contents -->
</div><!--event_page -->
</div><!-- body -->
  <div id="foot">
   <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  
  </div><!--foot -->
</div><!-- wrap -->
</body>
</html>

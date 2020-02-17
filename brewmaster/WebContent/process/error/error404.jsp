<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>404error</title>
<style type="text/css">
#error_page {
	margin:auto;
	height: 800px;
	width: 1200px;
}
#error404 {
	float: left;
	height: 500px;
	width: 1200px;
	margin-top: 80px;
}
#error404_img {
	float: left;
	height: 500px;
	width: 500px;
	margin-left: 350px;
}
#main_btn {
	float: left;
	height: 40px;
	width: 1200px;
	margin-top: 30px;
}
#main_btn_img {
	float: left;
	height: 40px;
	width: 100px;
	margin-left: 550px;
}

</style>
</head>

<body>
<div id="error_page">
  <div id="error404">
    <div id="error404_img"><img src="images/error_page_images/error404.png" width="500" height="500" /></div><!--error_404_img -->
  </div><!--error404 -->
  <div id="main_btn">
    <div id="main_btn_img"><img src="images/error_page_images/mainpage_btn.png" width="100" height="40" 
    onclick="history.back();"/></div><!--main_btn_img -->
  </div><!--main_btn -->
</div><!--error_page -->
</body>
</html>

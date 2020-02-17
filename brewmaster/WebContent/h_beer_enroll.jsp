<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BREW MASTER</title>
<link href="css_all/h_beer_enroll.css" rel="stylesheet" type="text/css"/>
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#product_enrol_button{
	
	width: 110px;
	height: 40px;
	margin-top: 25px;
	margin-left: 150px;
	background: none;
	background-image: url(images/h_beer_enroll_images/apply_btn.png);
	background-repeat: no-repeat;	
	background-size:contain; 
    
    border: none;  		
}
</style>
<script type="text/javascript">
function form_ck(){
	var h_beer_name = document.getElementById("h_beer_name").value;
	var h_beer_price = document.getElementById("h_beer_price").value;
	var h_beer_alchol = document.getElementById("h_beer_alchol").value;
	var h_beer_suger = document.getElementById("h_beer_suger").value;
	var h_beer_carbonic = document.getElementById("h_beer_carbonic").value;
	var h_beer_detail = document.getElementById("h_beer_detail").value; 
	var h_beer_explain = document.getElementById("h_beer_explain").value;
	
	if(h_beer_name==''){
		alert('제품명을 입력해주세요');
		document.getElementById("h_beer_name").focus();
		return false;
	}
	if(h_beer_price==''){
		alert('가격을 입력해주세요');
		document.getElementById("h_beer_price").focus();
		return false;
	}
	if(h_beer_alchol==''){
		alert('도수를 입력해주세요');
		document.getElementById("h_beer_alchol").focus();
		return false;
	}
	if(h_beer_suger==''){
		alert('당도를 입력해주세요');
		document.getElementById("h_beer_suger").focus();
		return false;
	}
	if(h_beer_carbonic==''){
		alert('탄산정도를 입력해주세요')
		document.getElementById("h_beer_carbonic").focus();
		return false;
	}
	if(h_beer_detail==''){
		alert('상세정보 입력해주세요');
		document.getElementById("h_beer_detail").focus();
		return false;
	}
	if(h_beer_explain==''){
		alert('제품 설명을 입력해주세요');
		document.getElementById("h_beer_explain").focus();
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
<div id="wrap">
  <div id="head">
	<jsp:include page="head.jsp" />
  </div><!--head -->
  
  <div id="body">
	<div id="h_beer_wrap">
  	  <div id="h_beer_header">
  		<img src="images/h_beer_enroll_images/housebeer_apply_title.png" width="206" height="35"/> 
  	  </div><!--h_beer_header -->
  
  	  <div id="h_beer_main">
		<form action="process/h_beer_enrollProcess.jsp"  enctype="multipart/form-data" method="post" onsubmit="return form_ck();">
          <table>         	  			
			<tr>
    		  <th width="121">상품명:</th>
        	  <td>
    			<input type="text" name="h_beer_name" id="h_beer_name"/>
      		  </td>
    		</tr>
			
			<tr>
    		  <th>가격:</th>
        	  <td>
    			<input type="text" name="h_beer_price" id="h_beer_price"/>
    		  </td>
    		</tr>
    			
   			<tr>
        	  <th>도수(%):</th>
              <td>
            	<input type="text" name="h_beer_alchol" id="h_beer_alchol"/>
              </td>
        	</tr>
        
           	<tr>
        	  <th>당도(0~10):</th>
              <td>
            	<select name= "h_beer_suger" id="h_beer_suger">
                	<option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
            	
            </td>
          </tr> 
        
          <tr>
        	<th>탄산강도(0~10):</th>
            <td>
              <select name= "h_beer_carbonic" id="h_beer_carbonic">
                	<option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
              </select>
			</td>
          </tr>
        
          <tr>
        	<th>주류 세부정보:</th>
            <td>
              <input type="text" name="h_beer_detail" id="h_beer_detail"/>
            </td>
          </tr>
       
		  <tr>
        	<th>주류 설명:</th>
            <td>
			  <textarea name="h_beer_explain" id="h_beer_explain" cols="45" rows="5"></textarea><br/>
            </td>
          </tr>
       
          <tr>
        	<th>상품이미지(10:18):</th>
            <td>
              <input type="file" name="h_beer_image" value="검색"/>
            </td>
    	  </tr>
    	  
    	  <tr>
        	<td colspan="2">
        	  <input type="submit" id="product_enrol_button" value="" />
            </td>
          </tr>
	  </table>
	</form>
</div><!--h_beer_main -->
        

</div><!--h_beer_wrap -->

  
  
  </div><!--body -->
  <div id="foot">
  
  <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>
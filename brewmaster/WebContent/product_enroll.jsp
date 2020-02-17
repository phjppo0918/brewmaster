<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BREW MASTER</title>
<link href="css_all/product_enroll.css" rel="stylesheet" type="text/css"/>
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#product_enrol_button{
	
	width: 100px;
	height: 40px;
	margin-top: 25px;
	margin-left: 250px;
	background: none;
	background-image: url(images/product_enroll_images/product_enroll_button.png);
	background-repeat: no-repeat;	
	background-size:contain;
    
    border: none;  	
}
</style>
<script type="text/javascript">

function ck_sub() {
	var p_name_kr = document.getElementById('p_name_kr').value;
	var p_name_en = document.getElementById('p_name_en').value;
	var p_kind = document.getElementById('p_kind').value;
	var p_price = document.getElementById('p_price').value;
	var p_country = document.getElementById('p_country').value;
	var p_alchol = document.getElementById('p_alchol').value;
	var p_detail = document.getElementById('p_detail').value;
	var p_explain = document.getElementById('p_explain').value;
	if(p_name_kr==''){
		alert('제품명(한글)을 입력해주세요');
		document.getElementById('p_name_kr').focus();
		return false;
	}
	if(p_name_en==''){
		alert('제품명(영문)을 입력해주세요');
		document.getElementById('p_name_en').focus();
		return false;
	}
	if(p_kind==''){
		alert('제품 종류를 입력해주세요');
		document.getElementById('p_kind').focus();
		return false;
	}
	if(p_price==''){
		alert('가격을 입력해주세요');
		document.getElementById('p_price').focus();
		return false;
	}
	if(p_country==''){
		alert('생산국가를 입력해주세요');
		document.getElementById('p_country').focus();
		return false;
	}
	if(p_alchol==''){
		alert('도수를 입력해주세요');
		document.getElementById('p_alchol').focus();
		return false;
	}
	if(p_detail==''){
		alert('제품 상세정보를 입력해주세요');
		document.getElementById('p_detail').focus();
		return false;
	}
	if(p_explain==''){
		alert('제품설명을 입력해주세요');
		document.getElementById('p_explain').focus();
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
	<div id="product_enroll_wrap">
  	  <div id="product_header">
  		<img src="images/product_enroll_images/product_enroll_title.png" width="120" height="35"/> 
  	  </div><!--product_header -->
  
 	  <div id="product_main">
    	<form action="process/enrollProductProcess.jsp" enctype="multipart/form-data" method="post" onsubmit="return ck_sub();">
          <table>         	  			
    		<tr>
    			<th width="121">상품명(한글):</th>
        		<td>
    			  <input type="text" name="p_name_kr" id="p_name_kr"/>
    			</td>
    		</tr>
  
			<tr>
    		  <th>상품명(영어):</th>
         	  <td>
    			 <input type="text" name="p_name_en" id="p_name_en"/>
    		  </td>
    		</tr>
    			
    		<tr>
    		  <th>주류 종류:</th>
        	  <td>
    			<div id="set_beer">맥주<input type="radio" name="p_kind" id="p_kind" value="맥주"/></div>
    			<div id="set_wine">와인<input type="radio" name="p_kind" id="p_kind" value="와인"/></div>
    		  </td>
    		</tr>

			<tr>
    		  <th>가격:</th>
    		  <td>
        		<input type="text" name="p_price" id="p_price"/>
     		  </td>
    		</tr>
    		
    		<tr>
    		  <th>생산국가:</th>
    		  <td>
    		    <input type="text" name="p_country" id="p_country"/>
              </td>
  			</tr> 
 
			<tr>
        	  <th>도수(%):</th>
              <td>
            	<input type="text" name="p_alchol" id="p_alchol"/>%
              </td>
        	</tr>
        
           	<tr>
        	  <th>당도(0~10):</th>
              <td>
            	<select name= "p_suger">
            		<option value="0">0</option>
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
                </select><p></p>
              </td>
        	</tr> 
        
           	<tr>
        	  <th>탄산강도(0~10):</th>
              <td>
            	<select name= "p_carbonic">
            		<option value="0">0</option>
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
                </select><p></p>
              </td>
        	</tr>
        
           	<tr>
        	<th>주류 세부정보:</th>
              <td>
            	<input type="text" name="p_detail" id="p_detail"/>
              </td>
        	</tr>
       
           	<tr>
        	<th>주류 설명:</th>
              <td>
           		<textarea name="p_explain" id="p_explain" cols="45" rows="5"></textarea><br/>
              </td>
        	</tr>
       
        	<tr>
        	  <th>상품이미지(10:18):</th>
              <td>
            	<input type="file" name="p_image" value="검색"/>
              </td>
    		</tr>
        
        	<tr>		
        	  <td colspan="2">
        		<input type="submit" id="product_enrol_button" value=""/>
			  </td>
        	</tr>
		</table>
	</form>
   </div><!--product_main -->
  </div><!--product_enroll_wrap -->

  
  
  </div><!--body -->
  <div id="foot">
  
   <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>
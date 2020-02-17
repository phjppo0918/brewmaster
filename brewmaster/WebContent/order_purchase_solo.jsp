<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page import="java.io.PrintWriter, java.net.URLEncoder" %>  
<%@ page import="dao.*,util.*,model.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="css_all/order_purchase.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#purchase{
	width: 135px;
	height: 45px;	
	background-repeat: no-repeat;
	background-size: contain;
	background-color: #fff;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
	background-image: url(images/order_purchase_images/purchase_btn.png);
}
#search{
	width: 80px;
	height: 20px;
	background-repeat: no-repeat;
	background-size: contain;
	background-color: #fff;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
	background-image: url(images/order_purchase_images/search_address.png);
}


</style>
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.getElementById('input_road_address').value = roadAddrPart1;
	document.getElementById('input_detailAddress').value = addrDetail;
	document.getElementById('sample4_jibunAddress').value = jibunAddr;
	document.getElementById('input_address').value = zipNo;
	
	
}
</script>
</head>
<body>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <%
  	request.setCharacterEncoding("utf-8");
  	int p_no = Integer.parseInt(request.getParameter("p_no"));
  	int amount = Integer.parseInt(request.getParameter("amount"));
  	String u_id = (String)session.getAttribute("LOGIN");
  	int u_coin = 0;
  	Connection conn = ConnectionProvider.getConnection();
  	Product pro = null;
  	User user = null;
  	try{
  		ProductDao pdao = new ProductDao();
		UserDao udao = new UserDao();
		
		user = udao.selectById(conn, u_id);
		
		u_coin = user.getU_money();
		
		conn = ConnectionProvider.getConnection();
		pro = pdao.selectById(conn, p_no);
		
		if(u_coin<(pro.getP_price()*amount)){
			PrintWriter script = response.getWriter();
		      script.println("<script>");
		      script.println("var coin_frm = confirm('보유코인이 부족합니다 ㅠㅠ 코인충전 페이지로 가시겠습니까?')");
		      script.println("if(coin_frm){location.href='coin_charge.jsp';}");
		      script.println("else{history.go(-2)}");
		      script.println("</script>");
		}
		//coin = dao.bringCoin(conn, u_id);
		
	}catch(SQLException e){}
  
  %>
  <form action="process/purchaseSoloProcess.jsp" method="post"><%-- form위치ㅐ!! --%>
  <div id="body">
	<div id="order_purchase_wrap">
	  <div id="order_purchase_header">
        <img src="images/order_purchase_images/header2(order).png" width="220" height="60"/> 
      </div><!--order_purchase_header -->

	  <div id="order_purchase_main1">
	    <div id="order_purchase_main1_header">
    	  <img src="images/order_purchase_images/order_product_title.png" width="160" height="45"/> 
    	</div><!-- order_purchase_main1_header-->
	    
	    <div id="o_purchase_main1_main">
          <table id="table1">
            <tr>
      	      <th colspan="2">상품정보</th>
              <th width="125">개당 가격</th>
              <th width="116">수량</th>
          	  <th width="161">총금액</th>
            </tr>
            <tr>   <%--foreach문 시작 --%>
        	  <td>
                <div id="product_image">
            	   <img src="images/product_images/<%=pro.getP_image() %>" width="70" height="126"/>
                </div><!--product_image -->
              </td>
              <td width="172"><%=pro.getP_name_kr() %></td>
              <td><%=pro.getP_price() %></td>
              <td><%=amount %></td>
              <td><%=pro.getP_price()*amount %></td>
            </tr>			<%--foreach문 끝 --%>
           
          </table>
        </div><!-- o_purchase_main1_main-->
      </div><!--order_purchase_main1 -->

      <div id="order_purchase_main2">
	    <div id="order_purchase_main2_header"> 
          <img src="images/order_purchase_images/purchase_title.png" width="160" height="45"/>
        </div><!--order_purchase_main2_header -->
    
      <div id="o_purchase_main2_main">
        <table id= "table2">
          <tr>
            <th scope="row">주문자</th>
   		    <td>
    	      <div id="table2_name">
   				 <%=user.getU_name() %>
   		   	   </div><!--table2_name -->
    	    </td>
  	      </tr>
          <tr>
            <th scope="row">연락처</th>
    		<td>
    	      <div id="table2_ph">
        		 <%=user.getU_ph() %>
        	  </div><!--table2_ph -->
            </td>
  	      </tr>
  	      <tr>
    	    <th scope="row">주소</th>
    	    <td>
    	      <div id="table_address">
     		    <div id="table2_address1">
      			  <input type="text" name="input_address" id="input_address" placeholder="우편번호"/>
      	          <div id="search_ad">
     	            <button type="button" id="search" onclick="goPopup();" value=""/>
      			  </div><!--search_ad -->
                </div><!--table2_address1 -->
      
                <div id="table2_address2">
      			  <input type="text" name="input_road_address" id="input_road_address" placeholder="도로명주소"/>
				  <input type="text" name="sample4_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소"/>
                </div><!--table2_address2 -->
      			<div id="table2_address3">
      			  <input type="text"  name="input_detailAddress" id="input_detailAddress" placeholder="상세주소"/>
      			</div><!--table2_address3 -->
    		  </div><!--table_address -->
    		</td>
  		  </tr>
	      <tr>
    	    <th scope="row">배송시 요청사항</th>
    		<td>
    	      <div id="table2_request">
     	        <input type="text" name="order_request"/>
     		  </div><!--table2_request -->
   	        </td>
  		  </tr>
        </table> 
      </div><!--o_purchase_main2_main -->
    </div><!--order_purchase_main2 -->

	<div id="order_purchase_main3">
	  <div id="order_purchase_main3_header"> 
  	    <img src="images/order_purchase_images/coin_buy_title.png" width="160" height="45" />
       </div><!--order_purchase_main3_header -->
   	
	  <div id="o_purchase_main3_main">
        <table id="table3">
  	    <tr>
    	  <th width="241" scope="row">결제코인</th>
    	  <td width="541"><%=pro.getP_price()*amount %> 코인</td>
  	    </tr>
  	    <tr>
    	  <th scope="row">보유코인</th>
    	  <td><%=u_coin %> 코인</td>
  		</tr>
  	    <tr>
    	  <th scope="row">결제 후 코인</th>
    	  <td><%=u_coin-pro.getP_price()*amount %>코인</td>
  	    </tr>
	  </table>
    </div><!--o_purchase_main3_main -->
  </div><!--order_purchase_main3 -->

  <div id="purchase_button">
  	<input type="hidden" name="amount" value="<%=amount%>"/>
  	<input type="hidden" name="p_no" value="<%=pro.getP_no() %>"/>
  	<input type="hidden" name="total_coin" value="<%=pro.getP_price()*amount %>"/>
  	<input type="hidden" name="u_coin" value="<%=u_coin-pro.getP_price()*amount %>"/>
    <input type="submit" id="purchase" value=""/>
  </div><!--purchase_button -->
</div><!--order_purchase_wrap -->
</div><!--body -->
</form><%--form 위치!!!! --%>
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>
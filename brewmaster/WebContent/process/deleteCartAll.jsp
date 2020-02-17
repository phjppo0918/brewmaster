<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
Integer pCount=(Integer)session.getAttribute("pCount");

if(pCount==null)
{
 pCount = new Integer(0);
}  

//ArrayList<Cart> cartList = new ArrayList<Cart>();
for(int i=1; i<= pCount.intValue(); i++) {
	session.removeAttribute("p"+i);
}
	session.removeAttribute("cartList");
%>
<script type="text/javascript">
	alert('장바구니를 전부 비웠습니다.');
	location.href='../cart.jsp';
</script>
</body>
</html>
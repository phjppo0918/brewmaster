<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<%@ page import="java.io.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
String path = "C:\\apache-tomcat-8.0.49-windows-x64\\apache-tomcat-8.0.49\\webapps\\brewmaster\\images\\product_images";

	String name = new String();
	String fileName = new String();
	int sizeLimit = 1024 * 1024 * 5; // 5메가까지 제한 넘어서면 예외발생
	MultipartRequest multi = null;
	 try {
         multi = new MultipartRequest(request, path, sizeLimit, "utf-8",
                new DefaultFileRenamePolicy());
        Enumeration files = multi.getFileNames();

        //파일 정보가 있다면
        if (files.hasMoreElements()) {
            name = (String) files.nextElement();
            fileName = multi.getFilesystemName(name);
        }
        out.println("이미지를 저장하였습니다. : " + fileName);
    
	  String p_name_kr = multi.getParameter("p_name_kr");
	 String p_name_en = multi.getParameter("p_name_en");
	 String p_kind = multi.getParameter("p_kind");
	 int p_price = Integer.parseInt(multi.getParameter("p_price"));
	 String p_country = multi.getParameter("p_country");
	 double p_alchol =  Double.parseDouble(multi.getParameter("p_alchol"));
	 int p_suger = Integer.parseInt(multi.getParameter("p_suger"));
	 int p_carbonic = Integer.parseInt(multi.getParameter("p_carbonic"));
	 String p_detail = multi.getParameter("p_detail");
	 String p_explain = multi.getParameter("p_explain"); 
	 String p_maker = (String)session.getAttribute("LOGIN");

	Product pro = new Product(p_name_kr,p_name_en,p_kind,
			p_price,p_country,p_alchol,p_suger,p_carbonic,p_detail,p_explain,fileName,p_maker);
	pro.setP_time(new java.util.Date());
	Connection conn = ConnectionProvider.getConnection(); 

	
		ProductDao dao = new ProductDao();
		dao.insert(conn, pro);
	}catch(SQLException e){
		
	}catch(IOException e){
		
	}
	 
	response.sendRedirect("../p_enroll_complete.jsp");

%>	


</body>
</html>
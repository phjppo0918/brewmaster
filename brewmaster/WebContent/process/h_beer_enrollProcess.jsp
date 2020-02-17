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
	String path = "C:\\apache-tomcat-8.0.49-windows-x64\\apache-tomcat-8.0.49\\webapps\\brewmaster\\images\\h_beer_images_user";
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
       // out.println("이미지를 저장하였습니다. : " + fileName);
    
	  String h_beer_name = multi.getParameter("h_beer_name");
	 int h_beer_price = Integer.parseInt(multi.getParameter("h_beer_price"));
	 double h_beer_alchol =  Double.parseDouble(multi.getParameter("h_beer_alchol"));
	 int h_beer_suger = Integer.parseInt(multi.getParameter("h_beer_suger"));
	 int h_beer_carbonic = Integer.parseInt(multi.getParameter("h_beer_carbonic"));
	 String h_beer_detail = multi.getParameter("h_beer_detail");
	 String h_beer_explain = multi.getParameter("h_beer_explain"); 
	 String h_beer_maker = (String)session.getAttribute("LOGIN");

	 HBeer hBeer = new HBeer(h_beer_name,h_beer_price,h_beer_alchol,h_beer_suger,h_beer_carbonic,
			 h_beer_detail,h_beer_explain,fileName,h_beer_maker);

			hBeer.setH_beer_time(new java.util.Date());
	Connection conn = ConnectionProvider.getConnection(); 

	
		HBeerDao dao = new HBeerDao();
		dao.insert(conn, hBeer);
	}catch(Exception e){
		
	}
	
	
   //  try {
     //	Pet pet = new Pet(petName,price,weight,
     //			             fileName,new java.util.Date()); 
     //	PetDao dao = new PetDao();
     	//dao.insert(conn, pet); 
    // } catch(SQLException e){}
	

%>	

<script type="text/javascript">
	alert("신청이 완료되었습니다");
	location.href="../h_beer_contents.jsp";
</script>
</body>
</html>
<%@page import="netbankingDAO.adminDAO.LoginDAO" %>
<%!
    String userName;
    String password;  
%>    
<%
    userName=request.getParameter("username");
    password=request.getParameter("password");
    LoginDAO login=new LoginDAO(userName,password); 
    if(login.checkLogin()){
        System.out.print("checkLogin");
        response.sendRedirect("../adminhome.html");
    }else{
        response.sendRedirect(request.getHeader("Referer"));
    }
%>
<%@page import="netbankingDAO.adminDAO.NewRequest" %>

<%!
  NewRequest nr=null;  
%>    

<%
    try{
    nr=new NewRequest();
    nr.fetchNewUserInfo();
    request.setAttribute("newUser", nr);
    request.getRequestDispatcher("../request_view.jsp").forward(request, response);
    
    }catch(Exception e){
        System.out.println("request_controller.jsp m dikkat");
        e.printStackTrace();
    }
%>
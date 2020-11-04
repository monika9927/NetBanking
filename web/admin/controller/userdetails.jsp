<%@page  import="java.sql.ResultSet , netbankingDAO.adminDAO.UserDetails" %>
<%!
    ResultSet rst;
%>
<%
    UserDetails ud=new UserDetails();
    rst=ud.fetchUserInfo();
    if(rst!=null){
        System.out.println(rst);
        request.setAttribute("rst", rst);
        request.setAttribute("ud", ud);
        request.getRequestDispatcher("../userdetails.jsp").forward(request, response);
    }else{
        out.println("Result set is empty");
    }
    
%>
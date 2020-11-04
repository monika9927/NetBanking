<%@page  import="netbankingDAO.Transactions" %>
<%!
    String aadharNum;
    Transactions t; 
%>

<%
    try{
        aadharNum=request.getParameter("aadharNum");
        t=new Transactions(aadharNum);
        t.viewTransaction();
        request.setAttribute("t", t);
        request.getRequestDispatcher("../userstatement.jsp").forward(request, response);
    }catch(Exception e){
        System.out.println("userstatement_controller.jsp m dikkat");
        e.printStackTrace();
    }
    
    
%>
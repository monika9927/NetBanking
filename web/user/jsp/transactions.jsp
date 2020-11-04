<%@page  import="netbankingDAO.Transactions , java.sql.ResultSet" %>
<%! 
    String aadharNum;
    Transactions t;
%>
<%
    try{
        aadharNum=(String)session.getAttribute("AadharNum");
        t=new Transactions(aadharNum);
        t.viewTransaction();
        request.setAttribute("t", t);
        request.getRequestDispatcher("../transaction_view.jsp").forward(request, response);
        
    }catch(Exception e){
        System.out.println("transaction.jsp m dikkat");
        e.printStackTrace();
    }
%>
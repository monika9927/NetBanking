<%--<%@include file="../userprofile_view.jsp" %>--%> 
<%@page  import="netbankingModel.UserAccDetailsModel,netbankingDAO.UserAccDetails" %>
<%!
    String aadharNum; 
    RequestDispatcher dispatcher;      
%>
<%
    aadharNum =(String)(session.getAttribute("AadharNum"));
    System.out.println(aadharNum);
    UserAccDetailsModel uadm=new UserAccDetailsModel();
    uadm.setAadharNum(aadharNum);
    UserAccDetails uad=new UserAccDetails(uadm);
    if(uad.fetchUserAccInfo()){
        request.setAttribute("useraccinfo",uad); 
        dispatcher=request.getRequestDispatcher("../useraccdetails_view.jsp");
        dispatcher.forward(request,response);
    }
    else{
        out.print("something went wrong");
    }
    
    
%>
<%--<%@include file="../userprofile_view.jsp" %>--%> 
<%@page  import="netbankingModel.UserProfileModel,netbankingDAO.UserProfile" %>
<%!
    String aadharNum; 
    RequestDispatcher dispatcher;
%>
<%
    aadharNum =(String)(session.getAttribute("AadharNum"));
    UserProfileModel upm=new UserProfileModel();
    upm.setAadharNum(aadharNum);
    UserProfile up=new UserProfile(upm);
    if(up.fetchUserInfo()){
        request.setAttribute("userinfo",up); 
        dispatcher=request.getRequestDispatcher("../userprofile_view.jsp");
        dispatcher.forward(request,response);
    }
    else{
        out.print("something went wrong");
    }
    
    
%>
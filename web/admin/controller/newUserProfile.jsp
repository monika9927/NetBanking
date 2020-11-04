<%@page  import="netbankingDAO.UserProfile , netbankingDAO.UserAccDetails ,  netbankingModel.UserProfileModel" %>
<%@page  import="netbankingModel.UserAccDetailsModel,netbankingDAO.UserAccDetails" %>

<%!
    String aadharNum=null;
    RequestDispatcher dispatcher;
%>

<%
    aadharNum=(String)request.getParameter("aN");
    System.out.println(aadharNum);
        UserProfileModel upm=new UserProfileModel();
    upm.setAadharNum(aadharNum);
    UserProfile up=new UserProfile(upm);
    UserAccDetailsModel uadm=new UserAccDetailsModel();
    uadm.setAadharNum(aadharNum);
    UserAccDetails uad=new UserAccDetails(uadm);
    if(up.fetchUserInfo()&&uad.fetchUserAccInfo()){
        request.setAttribute("useraccinfo",uad); 
        request.setAttribute("userinfo",up); 
        dispatcher=request.getRequestDispatcher("../register_user.jsp");
        dispatcher.forward(request,response);
    }
    else{
        out.print("something went wrong");
    }
    

%>
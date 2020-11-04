<%@page  import=" netbankingDAO.adminDAO.AllotAccNetNum, netbanking.services.SendMail" %>

<%!
    String aadharNum;
    String accountNum;
    String netbankingNum;
    AllotAccNetNum allot;
    String email;
    SendMail sm;
%>

<%
    email=(String)session.getAttribute("email");
    accountNum=request.getParameter("accno");
    netbankingNum=request.getParameter("netno");
    aadharNum=(String)session.getAttribute("aadharNum");
    allot=new AllotAccNetNum(accountNum,netbankingNum,aadharNum);
    sm=new SendMail(email);
    sm.setAccNum(accountNum);
    sm.setNetbankingNum(netbankingNum);
    sm.sendMail();
    if(allot.alloting()>0){
        System.out.println("allotmentDone - allot_controller.jsp");
        request.getRequestDispatcher("../mailsent.jsp").forward(request, response);        
    }
    else{
        out.println("Something went wrong in allot_controller.jsp");
    }
    
%>
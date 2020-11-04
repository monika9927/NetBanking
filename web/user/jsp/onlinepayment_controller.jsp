<%--<%@include  file="../onlinepayment_view.jsp" %>--%>
<%@page  import="netbankingDAO.OnlinePayment" %>

<%!
  String aadharNum;
  String receiverName;
  String receiverAccNum;
  int amount;
  String pin;
  String description;
  String msg="";
%>

<%
    if(request.getParameter("pay")!=null){
        aadharNum=(String)session.getAttribute("AadharNum");
  receiverName=request.getParameter("receiver_name");
  receiverAccNum=request.getParameter("receiver_accnum");
  amount=Integer.parseInt(request.getParameter("amount")); 
  pin=request.getParameter("pin");
  description=request.getParameter("description");
  OnlinePayment op=new OnlinePayment();
  op.setPaymentInfo(aadharNum, receiverAccNum, amount, pin, description);
  msg=op.transferMoney();
  System.out.println("controller vala msg="+msg); 
  if(session.getAttribute("msg")!=null)session.removeAttribute("msg");
  session.setAttribute("msg",msg);
//  request.setAttribute("inactiveUserErrorMsg",op.getInactiveUserErrorMsg());
//  request.setAttribute("balanceErrorMsg",op.getBalanceErrorMsg());
//  request.setAttribute("transactionFailedErrorMsg",op.getTransactionFailedErrorMsg());
//  request.setAttribute("successMsg",op.getSuccessMsg());
    response.sendRedirect("../onlinepayment_view.jsp");
//                            response.sendRedirect(request.getHeader("Referer"));
    }
    else{
        out.println("Form didn't get submitted");
    }
  
%>
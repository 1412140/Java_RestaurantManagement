<%-- 
    Document   : OrderCustomer
    Created on : Dec 24, 2017, 12:14:40 PM
    Author     : HaHai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body>

<h2>Hello Nguyen Thi Thu Ha</h2>
 
<table>
    
  <tr>
    <th>Mã Sản Phẩm</th>
    <th>Tên Sản Phẩm</th>
   
  </tr>
  <%List<Branch>dssanpham=(List<Branch>)request.getAttribute("branchlist");%>
        <% for (Branch sp:dssanpham) { %> 
  <tr>
     <td><%= sp.getId()%></td>
    <td><%= sp.getName()%></td>
   
  </tr>
  
  <%}%>
</table>

</html>

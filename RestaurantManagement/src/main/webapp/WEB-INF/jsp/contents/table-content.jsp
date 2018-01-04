<%-- 
    Document   : table-content
    Created on : Dec 8, 2017, 7:49:16 AM
    Author     : hotha
--%>

<%@page import="Entity.BranchTable"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<BranchTable> table = (List<BranchTable>) request.getAttribute("tableList"); %>
<% for (BranchTable t : table) {%>
    <%= t.getId()%>
    <%= t.getName()%>
<%}%>
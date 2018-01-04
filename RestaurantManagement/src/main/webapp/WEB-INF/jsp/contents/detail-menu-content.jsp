<%-- 
    Document   : food-index-content
    Created on : Oct 26, 2017, 9:31:32 PM
    Author     : USER
--%>

<%@page import="Entity.Dish"%>
<%@page import="Entity.MenuDetail"%>
<%@page import="Entity.BranchMenu"%>
<%@page import="Entity.Branch"%>
<%@page import="Entity.Menu"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : food-index-content
    Created on : Oct 26, 2017, 9:31:32 PM
    Author     : USER
--%>


<%@page import="Entity.DishDirectory"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>

<!-- Breadcrumbs-->
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="#">Branch management</a>
    </li>
    <li class="breadcrumb-item active">New branch</li>
</ol>
<% Menu menu = (Menu) request.getAttribute("menu");%> 
<div><%=menu.getId()%></div>
<div><%=menu.getMenuName()%></div>

<%List<Dish> dishList = (List<Dish>) request.getAttribute("dishList"); %> 
<%List<MenuDetail> menuDetailList = (List<MenuDetail>) request.getAttribute("menuDetailList"); %> 
<% for (MenuDetail md : menuDetailList) {%> 
    <% for (Dish d : dishList) {%> 
        <% if (md.getIdDish() == d.getId()) {%>
            <div><%=d.getId()%></div>
            <div><%=d.getName()%></div>
            <div><%=d.getPrice()%></div>
            <br/>
        <% }%>
    <% }%>
<% }%>
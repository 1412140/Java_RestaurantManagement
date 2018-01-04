<%-- 
    Document   : edit-order-detail-content
    Created on : Dec 31, 2017, 11:47:50 AM
    Author     : HaHai
--%>
<%@page import="Entity.OrderDetail"%>
<%@page import="Entity.OrderBill"%>
<%@page import="Entity.Customer"%>
<%@page import="Entity.Dish"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>

<!-- Breadcrumbs-->12
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="#">Branch management</a>
    </li>
    <li class="breadcrumb-item active">New branch</li>
</ol>
<% OrderBill orbill = (OrderBill) request.getAttribute("orderbill");
   Customer custo = (Customer) request.getAttribute("customer");
   Dish dis = (Dish) request.getAttribute("dish");
   OrderDetail ordtail = (OrderDetail) request.getAttribute("orderdetail");
   
  
%> 
<!-- Example DataTables Card-->
<form action="/RestaurantManagement/edit-order-detail/<%=orbill.getId()%>" method="post">
    <div class="row">
        <div class="col-6">
            <div class="form-group">
                <label style="font-weight: bold">Customer name</label>
                <spring:nestedPath path="name">
                    <spring:bind path="value">
                        <input type="text" class="form-control" id="exampleFormControlInput1" name="name" value="<%=custo.getName()%>">
                    </spring:bind>
                </spring:nestedPath>
            </div>
            <div class="form-group">
                <label style="font-weight: bold">Customer Phone</label>
                <spring:nestedPath path="phone">
                    <spring:bind path="value">
                        <input type="text" class="form-control" id="exampleFormControlInput1" name="phone" value="<%=custo.getPhone()%>">
                    </spring:bind>
                </spring:nestedPath>
            </div>
            <div class="form-group">
                <label style="font-weight: bold">Delivery Address</label>
                <spring:nestedPath path="delivery">
                    <spring:bind path="value">
                          <input type="text" class="form-control" id="exampleFormControlInput1" name="delivery" value="<%=custo.getAddress()%>">
                    </spring:bind>
                </spring:nestedPath>
            </div>
            
       

             <div class="form-group">
                <label style="font-weight: bold">Dish's Name</label>
                <select class="form-control" name="listdish">
                    <%List<Dish> listdish = (List<Dish>) request.getAttribute("dishlist"); 
                     
                     %>
                    <% for (Dish dd : listdish) {%> 
                    <spring:nestedPath path="listdish">
                        <spring:bind path="value">
                            <option name="listdish" value="<%=dd.getId()%>"><%= dd.getName()%>
                             </option> 
                        </spring:bind>
                    </spring:nestedPath> 
                    <% }%>
                </select>
            </div> 
            
            
               <div class="form-group">
                <label style="font-weight: bold">Quanlity</label>
                <spring:nestedPath path="quanlity">
                    <spring:bind path="value">
                        <input type="number" class="form-control" id="exampleFormControlInput1" name="quanlity" value="<%=ordtail.getQuanlity()%>">
                    </spring:bind>
                </spring:nestedPath>
            </div>
            
           <div class="form-group">
                <label style="font-weight: bold">Price</label>
                <spring:nestedPath path="price">
                    <spring:bind path="value">
                        <input type="number" class="form-control" id="exampleFormControlInput1" name="price" value="<%=ordtail.getPrice()%>">
                    </spring:bind>
                </spring:nestedPath>
            </div> 

            <div class="form-group text-center">
                <input class="btn btn-primary btn-lg btn-sm" type="submit" value="Edit Detail">
            </div>
        </div>
        <%--<div class="col-6">
            <div class="row">
                <div class="col-8">
                    <label style="font-weight: bold">Menu</label> <br>
                    <%List<Menu> checkedMenu = (List<Menu>) request.getAttribute("checkedMenu"); %>
                    <%List<Menu> uncheckedMenu = (List<Menu>) request.getAttribute("uncheckedMenu"); %>
                    <% for (Menu m : checkedMenu) {%> 
                    <input checked style="float: right; transform: scale(1.5); margin-right: 10px; margin-top: 10px" 
                           type="checkbox" name="menu" value="<%=m.getId()%>"><%=m.getMenuName()%> <br>
                    <% }%>
                    <% for (Menu m : uncheckedMenu) {%>
                    <input style="float: right; transform: scale(1.5); margin-right: 10px; margin-top: 10px" 
                           type="checkbox" name="menu" value="<%=m.getId()%>"><%=m.getMenuName()%> <br>
                    <% }%> 
                </div>

                <%--                <div class="col-5">
                                    <label style="font-weight: bold">Dish Directory</label> <br>
                                    <%List<DishDirectory> dishDirectoryList = (List<DishDirectory>) request.getAttribute("dishDirectoryList"); %>
                                    <% for (DishDirectory dd : dishDirectoryList) {%> 
                                    <spring:nestedPath path="branchDirectory">
                                        <spring:bind path="value">
                                            <input style="float: right; transform: scale(1.5); margin-right: 10px; margin-top: 10px" type="checkbox" name="branchDirectory" value="<%=dd.getId()%>"><%=dd.getName()%> <br>
                                        </spring:bind>
                                    </spring:nestedPath> 
                                    <% }%>  
                                </div>--%>
                <div class="col-2"></div>
            </div>
    
                 
        
    
        </div>
          
</form>

     
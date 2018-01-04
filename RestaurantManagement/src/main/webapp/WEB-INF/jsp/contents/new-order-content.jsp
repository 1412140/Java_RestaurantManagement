<%-- 
    Document   : customerOrder
    Created on : Dec 18, 2017, 12:40:41 PM
    Author     : HaHai
--%>


<%@page import="Entity.OrderBill"%>
<%@page import="java.util.List"%>
<%@page import="Entity.Branch"%>
<%@page import="Entity.Dish"%>
<%@page import="Entity.Customer"%>

<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="#">Order customer</a>
    </li>
    <li class="breadcrumb-item active">New Order</li>
</ol>

<form action="/RestaurantManagement/new-order" method="post">
    <h1>Customer's Information</h1>
    <div class="row">
        <div class="col-6">
            <section class="container">
          <div class="switch">
      <input type="radio" class="switch-input" name="view" value="week" id="week" checked>
      <label for="week" class="switch-label switch-label-off">Week</label>
      <input type="radio" class="switch-input" name="view" value="month" id="month">
      <label for="month" class="switch-label switch-label-on">Month</label>
      <span class="switch-selection"></span>
    </div>
            </section>
            <div class="form-group">
                <label style="font-weight: bold">Customer Name</label>
<!--                <spring:nestedPath path="customer_name">
                    <spring:bind path="value">-->
                        <input type="text" class="form-control" id="exampleFormControlInput1" name="customer_name">
<!--                    </spring:bind>
                </spring:nestedPath>-->
            </div>
            
        
         
            <div class="form-group">
                <label style="font-weight: bold">Customer's Phone</label>
<!--                <spring:nestedPath path="customer_phone">
                    <spring:bind path="value">-->
                        <input type="text" class="form-control" id="exampleFormControlInput1" name="customer_phone">
<!--                    </spring:bind>
                </spring:nestedPath>-->
            </div>
            
      
            
            <div class="form-group">
                <label style="font-weight: bold">Customer's Address</label>
<!--                <spring:nestedPath path="customer_address">
                    <spring:bind path="value">-->
                        <input type="text" class="form-control" id="exampleFormControlInput1" name="customer_address">
<!--                    </spring:bind>
                </spring:nestedPath>-->
            </div>
            
           
        
  
  

            <a href="/RestaurantManagement/order-detail">
              <button title = "Edit" type="button" class="btn btn-success btn-sm" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
            </a>
            <div class="form-group text-center">
                <input class="btn btn-primary btn-lg btn-sm" type="submit" value="Add order">
            </div>
           
     </div>
     
        
     <div class="col-6">
          <h1>Customer's Information</h1>
          
          <div class="form-group">
                <label style="font-weight: bold">Dish's Name</label>
                <select class="form-control" name="listdish">
                    <%List<Dish> listdish = (List<Dish>) request.getAttribute("dishlist"); %>
                    <% for (Dish dd : listdish) {%> 
                    <spring:nestedPath path="listdish">
                        <spring:bind path="value">
                            <option name="listdish" value="<%=dd.getId()%>"><%= dd.getName()%></option> 
                        </spring:bind>
                    </spring:nestedPath> 
                    <% }%>
                </select>
            </div> 
  
          
          
               <div class="form-group">
                <label style="font-weight: bold">Dish's number</label>
<!--                <spring:nestedPath path="sum_money">
                    <spring:bind path="value">-->
                        <input type="number" class="form-control" id="exampleFormControlInput1" name="dishnumber">
<!--                    </spring:bind>
                </spring:nestedPath>-->
            </div>
          
             <div class="form-group">
                <label style="font-weight: bold">Description</label>
                <spring:nestedPath path="description">
                    <spring:bind path="value">
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="description"></textarea>
                    </spring:bind>
                </spring:nestedPath>

            </div>
         
          
           <div class="form-group">
                <label style="font-weight: bold">Branch</label>
                <select class="form-control" name="listbranch">
                    <%List<Branch> listbranch = (List<Branch>) request.getAttribute("branchlist"); %>
                    <% for (Branch dd : listbranch) {%> 
                    <spring:nestedPath path="listbranch">
                        <spring:bind path="value">
                            <option name="listbranch" value="<%=dd.getId()%>"><%= dd.getName()%></option> 
                        </spring:bind>
                    </spring:nestedPath> 
                    <% }%>
                </select>
            </div> 
          
     
         
             
            
            
        
  

    
</form>
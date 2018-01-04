<%-- 
    Document   : order-detail-content
    Created on : Dec 27, 2017, 3:17:17 PM
    Author     : HaHai
--%>

<%@page import="Entity.OrderDetail"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Breadcrumbs-->
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="#">Order by hot line</a>
    </li>
    <li class="breadcrumb-item active">Order Detail</li>
</ol>

<%List<OrderDetail> orderdetail = (List<OrderDetail>) request.getAttribute("orderdetail_list"); %> 

<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-table"></i>Order Bill list
        <a href="/RestaurantManagement/order-detail"><button type="button" class="btn btn-primary btn-sm">Order-Detail</button></a>
    </div>
   <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        
                        <th>Branch name</th>
                        <th>Customer's Name</th>
                        <th>Customer's Phone</th>
                        <th>Delivery Address</th>
                        <th>Dish's Name</th>
                        <th>Total</th>
                        <th style="width: 10%">Action</th>
                    </tr>
                </thead>
                <% for (OrderDetail od : orderdetail)
                { 
                    
%>
                <tbody>
                <td><%= od.getOrderId()%></td>
                <td><%= od.getOrderId()%></td>
                <td><%= od.getOrderId()%></td>
                <td><%= od.getOrderId()%></td>
                <td><%= od.getOrderId()%></td>
                <td><%= od.getOrderId()%></td>
                <td><%= od.getOrderId()%></td>
                <td class="text-center">
                     <a href="/RestaurantManagement/edit-order-detail/<%=od.getId()%>">
                        <button title = "Edit" type="button" class="btn btn-success btn-sm" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                    </a>
                    <!--<button title = "Edit" type="button" class="btn btn-success btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>-->
                    <span><button onclick="return confirm_decision(<%=od.getId()%>);" title = "Delete" type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i></button></span>
                    <a href="/RestaurantManagement/table?orderdetailId=<%=od.getId()%>"><button style ="margin-top: 10px" title= "View table" type="button" class="btn btn-outline-primary btn-sm">View Table</button></a>
                </td>
                <script>
                    function confirm_decision(id) {
                        if (confirm("You want to delete branch " + id + " ?")) // this will pop up confirmation box and if yes is clicked it call servlet else return to page
                        {
                            window.location = "/RestaurantManagement/delete-branch?branchId=" + id
                        } else {
                            return false;
                        }
                        return true;
                    }
                </script>
                </tbody>
                <% }%>
                  
            </table>
        </div>
    </div>
</div>
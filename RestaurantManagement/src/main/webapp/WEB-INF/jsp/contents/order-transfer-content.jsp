<%-- 
    Document   : food-index-content
    Created on : Oct 26, 2017, 9:31:32 PM
    Author     : USER
--%>
<%@page import="Entity.Dish"%>
<%@page import="java.util.List"%>
<%@page import="Entity.Customer"%>
<%@page import="Entity.OrderBill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<%List<Object[]> orderList = (List<Object[]>) request.getAttribute("orderList"); %>
<div class="card mb-3">
    <div class="card-header">  
        <i class="fa fa-table"></i>Order list  
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Cus Name</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Dish Name</th>
                        <th> Price</th>
                        <th>Total</th>
                        <th>Branch</th>
                         <th>Num</th>
                        <th>Create At</th>
                        <th style="width: 10%">Action</th>
                    </tr>
                </thead>

                  <% for (Object[] obj : orderList) {%> 
                <tbody>
               
                <td><%= obj[0] %></td>
                <td><%= obj[1] %></td>
                <td><%= obj[2] %></td>
                <td><%= obj[3] %></td>
                <td><%= obj[4] %></td>
                <td><%= obj[5] %></td>
                <td><%= obj[6] %></td>
                <td><%= obj[7] %></td>
                <td><%= obj[8] %></td>
                <td><%= obj[9] %></td>
                <td class="text-center">
                     <a href="/RestaurantManagement/edit-order-detail/<%=obj[0]%>">
                        <button title = "Edit" type="button" class="btn btn-success btn-sm" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                    </a>
                    <!--<button title = "Edit" type="button" class="btn btn-success btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>-->
                   <span><button onclick="return confirm_decision(<%=obj[0]%>);" title = "Delete" type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i></button></span>
                    <a href="/RestaurantManagement/orderbill?detailId=<%=obj[0]%>"><button style ="margin-top: 10px" title= "View table" type="button" class="btn btn-outline-primary btn-sm">View Table</button></a>
                </td>
                <script>
                    function confirm_decision(id) {
                        if (confirm("You want to delete OrderBill " + id + " ?")) // this will pop up confirmation box and if yes is clicked it call servlet else return to page
                        {
                            window.location = "/RestaurantManagement/delete-orderdetail?detailId=" + id
                        } else {
                            return false;
                        }
                        return true;
                    }
                </script>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
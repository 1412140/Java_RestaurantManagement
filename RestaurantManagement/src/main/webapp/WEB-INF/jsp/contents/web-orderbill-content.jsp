<%@page import="Entity.OrderBill"%>
<%@page import="Entity.Customer"%>
<%@page import="Entity.Branch"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Breadcrumbs-->
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="#">Branch management</a>
    </li>
    <li class="breadcrumb-item active">Web OrderBill list</li>
</ol>

<%List<OrderBill> web_order_list = (List<OrderBill>) request.getAttribute("web_order_list"); %> 
<%List<Customer> cusname = (List<Customer>) request.getAttribute("cusname"); %> 
<%List<Branch> brname = (List<Branch>) request.getAttribute("brname"); %>
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-table"></i>Branch list
        <a href="/RestaurantManagement/new-branch"><button type="button" class="btn btn-primary btn-sm">New branch</button></a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Customer Id</th>
                        <th>Branch Id</th>
                        <th>Status</th>
                        <th>Sum Money</th>
                      
                        <th style="width: 10%">Action</th>
                    </tr>
                </thead>
                
                <%   String namestatus=null;
                   String colcor=null;
                   String s= null;
                   String n=null;
                    for (OrderBill b : web_order_list) {
                       
                        for ( Customer c : cusname)
                        {
                           if (c.getId()==b.getCustomerId() )
                           {
                               s=c.getName();
                           }
                        }
                        for ( Branch d : brname)
                        {
                           if (d.getId()==b.getBranchId() )
                           {
                               n=d.getName();
                           }
                        }
                        
                     if (b.getStatus()==0)
                    {
                        namestatus="Received";
                        colcor="#FF0000";
                        
                    }
                    if (b.getStatus()==1)
                    {
                        namestatus="Executing";
                        colcor="#00FF00";
                    }
                    if (b.getStatus()==2)
                    {
                        namestatus="Sending";
                          colcor="#00FF00";
                    }
                     if (b.getStatus()==3)
                    {
                        namestatus="Sent";
                          colcor="#00FF00";
                    } 
                %>
                <tbody>
                <td><%= s %></td>
                <td><%= n%></td>
                <td bgcolor="#00FF00"><%= namestatus %></td>
                <td><%= b.getSumMoney()%></td>
                
                <td class="text-center">
                     <a href="/RestaurantManagement/edit-branch/<%=b.getId()%>">
                        <button title = "Edit" type="button" class="btn btn-success btn-sm" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                    </a>
                                   </tbody>
                <% }%>
            </table>
        </div>
    </div>
</div>
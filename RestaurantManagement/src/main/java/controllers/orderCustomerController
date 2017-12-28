/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import DAO.branchDAO;
import DAO.customerDAO;
import DAO.dishDAO;
import DAO.orderBillDAO;
import DAO.orderDetailDAO;

import Entity.Branch;
import Entity.Customer;
import Entity.Dish;
import Entity.OrderBill;
import Entity.OrderDetail;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




/**
 *
 * @author HaHai
 */
@Controller
public class orderCustomerController  {
    
branchDAO branchdao;
    @RequestMapping(value="/new-order",  method = RequestMethod.GET)
    public String createNewOrder(HttpServletRequest request, HttpServletResponse response, Model model)
    {

        List<Branch> branchlist = branchDAO.getBranchList();
        model.addAttribute("branchlist", branchlist);
        List<Dish> dishlist = dishDAO.getDishList();
        model.addAttribute("dishlist", dishlist);
       
        return"newOrder.jsp";
       
    }
    
    @RequestMapping(value = "/new-order", method = RequestMethod.POST)
    public String createNewOrder(HttpServletRequest request, HttpServletResponse response) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        
        //Order-Bill
         String customer_name = request.getParameterValues("customer_name")[0];
         String customer_phone = request.getParameterValues("customer_phone")[0];
         String customer_address = request.getParameterValues("customer_address")[0];
         
        /* Customer customer= new Customer();
         customer.setName(customer_name);
         customer.setPhone(customer_phone);
         customer.setAddress(customer_address);
         customer.setCreatedAt(date);
         customer.setDelFlag(1);
          boolean result_1=customerDAO.createCustomer(customer);*/
         
         
        /* Bill */ 
        
        List<Customer> customerlist = customerDAO.getCustomerList();
         int customer_id=customerlist.size();
         String branch_id = request.getParameterValues("listbranch")[0];
         
         String dish_name=request.getParameterValues("listdish")[0];
         int dish_id = Integer.parseInt(dish_name);
         double price=dishDAO.getDishInfo(dish_id).getPrice();
         
         int dish_number = Integer.parseInt(request.getParameterValues("dishnumber")[0]);
         double sum_money=dish_number * price;
       
         
        OrderBill orderbill = new OrderBill();
        orderbill.setCustomerId(customer_id);
        orderbill.setBranchId( Integer.parseInt(branch_id));
        orderbill.setStatus(1);
        orderbill.setOrderType(2);
        orderbill.setSumMoney(sum_money);
        orderbill.setDelFlag(1);
        orderbill.setCreatedAt(date);
        boolean result = orderBillDAO.createOrderBill(orderbill);
        
        
        List<OrderBill> ordebill_list = orderBillDAO.getOrderBillList();
         int orderbill_id=ordebill_list.size();
        OrderDetail orderdetail= new OrderDetail();
        orderdetail.setOrderId(orderbill_id);
        orderdetail.setDishId(dish_id);
        orderdetail.setQuanlity(1);
        orderdetail.setPrice(price);
        orderdetail.setCreatedAt(date);
        orderdetail.setDelFlag(1);
        boolean result_3 =orderDetailDAO.createOrderDetail(orderdetail);
        
        
       
       
       
        
       
        
        if (result == true  ) {
            System.out.print("Dung roi");
            return "orderDetail.jsp";
        } else {
            System.out.print("out");
            return "redirect:home";
        }
    }
    
     

   
}

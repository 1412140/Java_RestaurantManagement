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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.apache.xalan.xsltc.compiler.util.Type.Int;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;




/**
 *
 * @author HaHai
 */
@Controller
public class orderCustomerController  {
    

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
            return "redirect:order-detail";
        } else {
            System.out.print("out");
            return "redirect:home";
        }
    }
    
    @RequestMapping(value="/web-orderbill",  method = RequestMethod.GET)
    public String WebOrderBill(HttpServletRequest request, HttpServletResponse response, Model model)
    {

      //  List<Object[]>web_order_list = orderBillDAO.getOrderBill_Web();
        List<OrderBill>web_order_list = orderBillDAO.Web_OrderBillList();
        List<Integer> cusList = new ArrayList<Integer>();
        List<Integer> cusList2 = new ArrayList<Integer>();
        List<Customer> cusname = new ArrayList<Customer>();
        List<Branch> brname = new ArrayList<Branch>();
        model.addAttribute("web_order_list", web_order_list);
        for (int i=0;i<=web_order_list.size()-1;i++)
        {
            int t = web_order_list.get(i).getCustomerId();
            cusList.add(t);
        }
        
        for (int i=0;i<=web_order_list.size()-1;i++)
        {
            int t = web_order_list.get(i).getBranchId();
            cusList2.add(t);
        }
        
        for (int i=0; i<=cusList.size()-1;i++)
        {
            cusname.add(customerDAO.getCustomerInfo(cusList.get(i)));
        }
        
        for (int i=0; i<=cusList2.size()-1;i++)
        {
            brname.add(branchDAO.getBranchInfo(cusList2.get(i)));
        }
        model.addAttribute("cusname", cusname);
        model.addAttribute("brname", brname);
        return"webOrderBill.jsp";  
    }
    
     @RequestMapping(value = "/edit-status-bill", method = RequestMethod.GET)
    public String editStatusBill(HttpServletRequest request,
            @RequestParam(value = "orderdetailId", required = true) String orderdetailId, Model model
    ) {
        OrderDetail orderdetail = orderDetailDAO.getOrderDetailInfo(Integer.parseInt(orderdetailId));
        orderdetail.setDelFlag(1);
        boolean result = orderDetailDAO.updateOrderDetail(orderdetail);
        if (result == true) {
            return "redirect:web-orderbill";
        } else {
            return "redirect:home";
        }
    }
    @RequestMapping(value="/order-detail",  method = RequestMethod.GET)
    public String DetailOrder(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        List<OrderDetail> orderdetail_list = orderDetailDAO.getOrderDetailList();
        model.addAttribute("orderdetail_list", orderdetail_list);
        
       
        return"orderDetail.jsp";
    }
    
    @RequestMapping(value = "/order-detail", method = RequestMethod.POST)
    public String ListOrderDetail(HttpServletRequest request, HttpServletResponse response) { 
    
        return"home.jsp";
    }
    
    @RequestMapping(value = "/edit-order-detail/{orderDetailId}", method = RequestMethod.GET)
    public String editOrderDetail(@PathVariable("orderDetailId") int OrderDetailId, Model model, ModelMap mm) {
        
        OrderDetail orderdetail = orderDetailDAO.getOrderDetailInfo(OrderDetailId);
        int OrderBillId=orderdetail.getOrderId();
        OrderBill orderbill = orderBillDAO.getOrderBillInfo(OrderBillId);
        //Customer
        int cusid=orderbill.getCustomerId();
        Customer customer = customerDAO.getCustomerInfo(cusid);
        //Dish
        int disid=orderdetail.getDishId();
        String Dish_id = String.valueOf(disid);
        Dish dish = dishDAO.getDishInfo(disid);
        List<Dish> dishlist = dishDAO.getDishList();
     
        model.addAttribute("orderbill", orderbill);
        model.addAttribute("customer", customer);
        model.addAttribute("dish", dish);
        model.addAttribute("dishid",Dish_id);
        model.addAttribute("dishlist", dishlist);
        model.addAttribute("orderdetail", orderdetail);
      
        return "editOrderDetail.jsp";
    }

    @RequestMapping(value = "/edit-order-detail/{orderDetailId}", method = RequestMethod.POST)
    public String editOrderDeatail2(@PathVariable("orderDetailId") int orderdetailId, HttpServletRequest request,
             Model model, ModelMap mm
    ) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String name = request.getParameterValues("name")[0];
        String phone = request.getParameterValues("phone")[0];
        String delivery = request.getParameterValues("delivery")[0];
        String dishname = request.getParameterValues("listdish")[0];
        int dish_id = Integer.parseInt(dishname);      
        int quanlity = Integer.parseInt(request.getParameterValues("quanlity")[0]);
        double price = Double.parseDouble(request.getParameterValues("price")[0]);
        
        OrderDetail ord = orderDetailDAO.getOrderDetailInfo(orderdetailId);
        int ordbill=ord.getOrderId();
        OrderBill orbi = orderBillDAO.getOrderBillInfo(ordbill);
        int cus=orbi.getCustomerId();
        Customer customer = customerDAO.getCustomerInfo(cus);
        customer.setName(name);
        customer.setPhone(phone);
        customer.setAddress(delivery);
        customer.setCreatedAt(date);
        boolean result = customerDAO.updateCustomer(customer);
        
        ord.setDishId(dish_id);
        ord.setQuanlity(quanlity);
        ord.setPrice(price);
        ord.setCreatedAt(date);
        boolean result_2 = orderDetailDAO.updateOrderDetail(ord);
        
        if (result ==true && result_2 ==true)
        {
             return "home.jsp";
          //  double price=
        }
        
      return "redirect:home";
    }
    
       @RequestMapping(value = "/order-transfer", method = RequestMethod.GET)
    public String foodCatalogView(HttpServletRequest request, HttpServletResponse response, Model model) {
      //List<Object[]> orderList = orderBillDAO.getOrderBillListByType(4);
      List<Object[]> orderList = orderDetailDAO.OrderDetailList();
      model.addAttribute("orderList", orderList);
        return "orderTransfer.jsp";
    }
    
      @RequestMapping(value = "/delete-orderdetail", method = RequestMethod.GET)
    public String editDish(HttpServletRequest request,
            @RequestParam(value = "detailId", required = true) String detailId, Model model
    ) {
        OrderDetail orderdetail = orderDetailDAO.getOrderDetailInfo(Integer.parseInt(detailId));
        orderdetail.setDelFlag(1);
        boolean result = orderDetailDAO.deleteOrderDetail(orderdetail);
        if (result == true) {
            return "redirect:order-transfer";
        } else {
            return "redirect:home";
        }
    }
}

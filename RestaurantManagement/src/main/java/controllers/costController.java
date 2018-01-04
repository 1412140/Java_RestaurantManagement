package controllers;

//import hibernate_source.Product;
//import hibernate_source.ProductDAO;
//import hibernate_source.User;
//import hibernate_source.UserDAO;
import DAO.unexpectedDAO;
import Entity.UnexpectedCost;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

/**
 *
 * @author USER
 */
@Controller
public class costController {
//    private User userDao = null;
    
    @Autowired
    
    @RequestMapping(value="/unexpected-cost", method=RequestMethod.GET)
    public String homeView(HttpServletRequest request) {
        return "unexpected.jsp";
    }
    
    
    @RequestMapping(value = "/unexpected-cost", method = RequestMethod.POST)
    public String createNewCost(HttpServletRequest request, HttpServletResponse response) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        
        
         String content = request.getParameterValues("content")[0];
         String kind = request.getParameterValues("kind")[0];
         double cost = Double.parseDouble(request.getParameterValues("cost")[0]);
         int flag =Integer.parseInt(kind);
         
          boolean result_1=false,result_2=false;
         if (flag==2)
         {
         List<UnexpectedCost>list= unexpectedDAO.getCostList(1, 2018);
         int size=list.size();
         if (size>=1)
         {
           System.out.print("can not add");
         }
         else
         {
          UnexpectedCost unexpected = new UnexpectedCost();
          unexpected.setContent(content);
          unexpected.setCost(cost);
          unexpected.setCreatedAt(date);
         unexpected.setDelFlag(flag);
         result_1 = unexpectedDAO.createUnexpectedCost(unexpected);
         }
         }
         if (flag==1)
         {
           UnexpectedCost unexpected = new UnexpectedCost();
          unexpected.setContent(content);
          unexpected.setCost(cost);
          unexpected.setCreatedAt(date);
         unexpected.setDelFlag(flag);
          result_2 = unexpectedDAO.createUnexpectedCost(unexpected);
         }
       
       
      
        
        if (result_1 == true || result_2 ==true ) {
            System.out.print("Dung roi");
            return "redirect:order-detail";
        } else {
            System.out.print("out");
            return "redirect:home";
        }
    }
    
}
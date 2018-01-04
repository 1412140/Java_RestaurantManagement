/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import DAO.branchMenuDAO;
import DAO.dishDAO;
import DAO.dishDirectoryDAO;
import DAO.menuDAO;
import DAO.menuDetailDAO;
import Entity.BranchMenu;
import Entity.Dish;
import Entity.DishDirectory;
import Entity.Menu;
import Entity.MenuDetail;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author hotha
 */
@Controller
public class menuController {

    @RequestMapping(value = "/menu-list", method = RequestMethod.GET)
    public ModelAndView menuListView(HttpServletRequest request, Model model) {
        List<Menu> menuList = menuDAO.getMenuList();
        model.addAttribute("menuList", menuList);
        return new ModelAndView("menuList.jsp");
    }

    @RequestMapping(value = "/new-menu", method = RequestMethod.GET)
    public ModelAndView createNewMenu(HttpServletRequest request, Model model) {
        
        return new ModelAndView("newMenu.jsp");
    }

    @RequestMapping(value = "/new-menu", method = RequestMethod.POST)
    public String createNewMenu(HttpServletRequest request, HttpServletResponse response) {
        return "redirect:food-catalog";
    }

    @RequestMapping(value = "/edit-menu", method = RequestMethod.GET)
    public ModelAndView editMenu(HttpServletRequest request, Model model) {
        return new ModelAndView("newMenu.jsp");
    }

    @RequestMapping(value = "/edit-menu", method = RequestMethod.POST)
    public String editMenu(HttpServletRequest request, HttpServletResponse response) {
        return "redirect:food-catalog";
    }

    @RequestMapping(value = "/detail-menu/{menuId}", method = RequestMethod.GET)
    public ModelAndView detailMenu(@PathVariable("menuId") int menuId, HttpServletRequest request, Model model) {
        Menu menu = menuDAO.getMenuInfo(menuId);
        List <MenuDetail> menuDetailList = menuDetailDAO.getMenuDetailListByMenuId(menuId);
        List <Dish> dishList = dishDAO.getDishList();
        model.addAttribute("menu", menu);
        model.addAttribute("menuDetailList", menuDetailList);
        model.addAttribute("dishList", dishList);
        return new ModelAndView("detailMenu.jsp");
    }
    
    @RequestMapping(value = "/delete-menu", method = RequestMethod.GET)
    public String deleteDish(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "menuId", required = true) String menuId, Model model) {
        Menu menu = menuDAO.getMenuInfo(Integer.parseInt(menuId));
        menu.setDelFlag(1);
        boolean result = menuDAO.deleteMenu(menu);
        if (result == true) {
            return "redirect:menu-list";
        } else {
            return "redirect:home";
        }
    }
}

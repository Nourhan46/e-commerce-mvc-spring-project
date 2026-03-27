package org.example.controller;

import org.example.dao.CartDAO;
import org.example.dao.CartItemDAO;
import org.example.entity.*;
import org.example.service.orderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
CartDAO cartDAO;
    @Autowired
    CartItemDAO cartItemDAO;
    @Autowired
    orderService orderService;
    @GetMapping("/checkout")
    public String showCheckoutForm(HttpSession session , Model model)
    {

        User currentUser=  (User)  session.getAttribute("currentUser") ;
        Cart cart = cartDAO.findCartByUserId(currentUser.getId());
        List<cartItem>items = cartItemDAO.getItems(cart.getId());
        double total = 0;
        for (cartItem item : items) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }

        model.addAttribute("cartItems", items);
        model.addAttribute("total", total);
        model.addAttribute("payment", new Payment());

        return "checkout";
    }
    @PostMapping("/checkout")
    public String checkout(HttpSession session , @ModelAttribute Payment payment , Model model) {


        User user = (User) session.getAttribute("currentUser");


     Order order=   orderService.checkout(user.getId() ,payment);
       model.addAttribute("order_id",order.getOrderId());
        return "Sucess";
    }
}

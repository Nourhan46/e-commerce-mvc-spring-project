package org.example.controller;

import org.example.entity.Cart;
import org.example.entity.Product;
import org.example.entity.User;
import org.example.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;


@Controller
public class CartController {
    @Autowired
    CartService cartService;
    @GetMapping("/AddCart")
    public  String AddCart(@RequestParam("id") int id , HttpSession session) {
        User curr= (User)session.getAttribute("currentUser");
        Cart cart = cartService.findCartByUserId(curr.getId());
        if(cart == null)
        {
            System.out.println("no cart");
             cart = new Cart();
            cart.setUser(curr);
            cartService.addCart(cart);
        }
        return "redirect:/addToCart?id=" + id +"&cart_id="+cart.getId();
       // cartService.AddItem(id);

    }
}

package org.example.controller;

import org.example.dao.CartItemDAO;
import org.example.entity.Cart;
import org.example.entity.User;
import org.example.entity.cartItem;
import org.example.service.CartItemService;
import org.example.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartItemController {
    @Autowired
    CartItemService cartItemService;
    @Autowired
    CartService cartService;

    @GetMapping("/addToCart")
    public  String addToCart(@RequestParam("id") int id , @RequestParam("cart_id") int cart_id)
    {
        cartItemService.addItem(id , cart_id);
       return  "redirect:/getAllProducts";
    }
    @GetMapping("/Cart")
    public String sendCartId(HttpSession session )
    {
        User curr= (User)(session.getAttribute("currentUser"));
        int user_id= curr.getId();
        var userCart= cartService.findCartByUserId(user_id);
        int cart_id = userCart.getId();

        System.out.println(cart_id);



        return "redirect:/getItemsInCart?cart_id=" + cart_id ;
    }
    @GetMapping("/getItemsInCart")
    public String  showCartItems(@RequestParam("cart_id") int cart_id , Model model)
    {

       Cart cart = cartService.findCartById(cart_id);
       model.addAttribute("totalPrice", cart.getTotalPrice());
      model.addAttribute("cartItems",cart.getItems());
        System.out.println(cart.getItems());
      return "Cart";
    }
    @PostMapping("/cart/remove")
    public String remove(@RequestParam("productId") int productId, @RequestParam("cart_id") int cartId) {
        cartItemService.deleteItem(productId ,  cartId);

        return "redirect:/getItemsInCart?cart_id=" + cartId;
    }
}

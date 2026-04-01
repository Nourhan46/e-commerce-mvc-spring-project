package org.example.dao;


import org.example.entity.Cart;
import org.example.entity.Product;
import org.example.entity.cartItem;

import java.util.List;

public interface CartDAO {
    public  void  addCart(Cart cart);
    public Cart  findCartByUserId(int id);

    Cart getCartById(int id);

    void updateItem(cartItem cartItem);


}

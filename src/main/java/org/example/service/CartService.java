package org.example.service;

import org.example.entity.Cart;
import org.example.entity.Product;

public interface CartService {
    public void AddItem(int id);
    public  void addCart(Cart cart);
    public Cart findCartByUserId(int id);
}

package org.example.service;

import org.example.entity.Cart;
import org.example.entity.Product;

import javax.transaction.Transactional;

@Transactional
public interface CartService {

    public  void addCart(Cart cart);
    public Cart findCartByUserId(int id);
    public Cart findCartById(int id);
}

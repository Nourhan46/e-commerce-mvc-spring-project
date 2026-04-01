package org.example.service;

import org.example.dao.CartDAO;
import org.example.dao.ProductDAO;
import org.example.entity.Cart;
import org.example.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class CartServiceImpl  implements  CartService{
    @Autowired
    CartDAO cartDAO;
    @Autowired
    ProductDAO productDAO;


    @Override
    @Transactional
    public void addCart(Cart cart) {
        cartDAO.addCart(cart);
    }

    @Override
    public Cart findCartByUserId(int id) {
        return cartDAO.findCartByUserId(id);
    }

    @Override
    public Cart findCartById(int id) {
        return cartDAO.getCartById(id);
    }


}

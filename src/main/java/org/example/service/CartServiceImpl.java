package org.example.service;

import org.example.dao.CartDAO;
import org.example.dao.ProductDAO;
import org.example.entity.Cart;
import org.example.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class CartServiceImpl  implements  CartService{
    @Autowired
    CartDAO cartDAO;
    @Autowired
    ProductDAO productDAO;
    @Override
    public void AddItem(int id) {
        Product product = productDAO.getProductById(id);
        int number_of_avaliable_items=  product.getStock();
        if(number_of_avaliable_items>0) {
            cartDAO.addItem(product);

            number_of_avaliable_items--;
            product.setStock(number_of_avaliable_items);


        }
        else
            System.out.println("out of stock");
    }

    @Override
    @Transactional
    public void addCart(Cart cart) {
        cartDAO.addCart(cart);
    }

    @Override
    public Cart findCartByUserId(int id) {
        return cartDAO.findCartByUserId(id);
    }


}

package org.example.dao;

import org.example.entity.cartItem;

import java.util.List;

public interface CartItemDAO {
    public void addItem(cartItem cartItem);

    cartItem findItemInCart(int id , int cart_id);

    List<cartItem> getItems(int cartId);
}

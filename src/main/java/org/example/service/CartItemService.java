package org.example.service;

import org.example.entity.cartItem;

import java.util.List;

public interface CartItemService {
    public void addItem(int id, int cart_id);

    List<cartItem> getItemsInCart(int cartId);

    public void deleteItems(List<cartItem> items);
}

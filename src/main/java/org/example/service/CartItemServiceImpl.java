package org.example.service;

import org.example.dao.CartDAO;
import org.example.dao.CartItemDAO;
import org.example.dao.ProductDAO;
import org.example.entity.Product;
import org.example.entity.cartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartItemServiceImpl implements  CartItemService {
    @Autowired
    CartItemDAO cartItemDAO;
    @Autowired
    ProductDAO productDAO;
    @Autowired
    CartDAO cartDAO;
    @Override
    public void addItem(int id,int cart_id) {
        int num_avaliable_in_stock=productDAO.getProductById(id).getStock();
        if(num_avaliable_in_stock==0)
            return;
    int quantity=0;
        cartItem cartItem= cartItemDAO.findItemInCart(id , cart_id);
        Product product= productDAO.getProductById(id);
        if(cartItem ==null)
        {
            cartItem = new cartItem();
            cartItem.setCart(cartDAO.getCartById(cart_id));
            product.setStock(--num_avaliable_in_stock);
            productDAO.UpdateProduct(product);
            cartItem.setQuantity(1);
            cartItem.setProduct(productDAO.getProductById(id));

            cartItemDAO.addItem(cartItem);
        }
        else {
            product.setStock(--num_avaliable_in_stock);
            productDAO.UpdateProduct(product);

            int q= cartItem.getQuantity();
            cartItem.setQuantity(++q);
            cartDAO.updateItem(cartItem);



        }
    }

    @Override
    public List<cartItem> getItemsInCart(int cartId) {
        return cartItemDAO.getItems(cartId);
    }
}

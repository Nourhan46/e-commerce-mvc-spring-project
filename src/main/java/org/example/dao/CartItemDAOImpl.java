package org.example.dao;

import org.example.entity.Cart;
import org.example.entity.cartItem;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CartItemDAOImpl implements  CartItemDAO{
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public void addItem(cartItem cartItem) {
        Session session = sessionFactory.getCurrentSession();
        session.save(cartItem);

    }

    @Override
    public cartItem findItemInCart(int id, int cart_id) {
        String s = "from cartItem c where c.product.id = :id and c.cart.id = :cart_id";

        Query query = sessionFactory.getCurrentSession().createQuery(s);
        query.setParameter("id", id);
        query.setParameter("cart_id", cart_id);

        cartItem cartItem = (cartItem) query.uniqueResult();
        return cartItem;
    }

    @Override
    public List<cartItem> getItems(int cartId) {
        Session session= sessionFactory.getCurrentSession();
        String st ="select c.items from Cart c where c.id = :id";

        Query query= session.createQuery(st);
        query.setParameter("id",cartId);

        List<cartItem> items = query.list();
        return  items;
    }

    @Override
    public void delete(List<cartItem> items) {
        Session session = sessionFactory.getCurrentSession();
        for(cartItem item: items)
        {
            session.delete(item);
        }
    }

    @Override
    public void deleteitem(int productId, int cartId) {
        Session session = sessionFactory.getCurrentSession();

        // ضفنا شرط الـ cart.id علشان نجيب المنتج من السلة دي بس
        String st = "from cartItem c where c.product.id = :prodId and c.cart.id = :cartId";

        Query query = session.createQuery(st);
        query.setParameter("prodId", productId);
        query.setParameter("cartId", cartId);

        cartItem item = (cartItem) query.uniqueResult(); // كدة ضمنا إنها هترجع نتيجة واحدة بالظبط

        // لازم نتأكد إن الـ item مش بـ null قبل ما نمسح عشان نتجنب الـ Error اللي فات
        if (item != null) {
            session.delete(item);
        } else {
            System.out.println("Item not found in this cart!");
        }
    }
}

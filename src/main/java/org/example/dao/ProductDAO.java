package org.example.dao;

import org.example.entity.Product;

import java.util.List;

public interface ProductDAO {
    List<Product>getAllProducts();

    Product getProductById(int id);

    void UpdateProduct(Product product);

    void addProduct(Product product);

    void delete(int id);
}

package org.example.service;

import org.example.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product>getAllProducts();

    Product getProductById(int id);
    void UpdateProduct(Product product);

    void AddProduct(Product product);

    void deleteProduct(int id);
}

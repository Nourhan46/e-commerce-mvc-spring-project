package org.example.controller;

import org.example.entity.Product;
import org.example.entity.User;
import org.example.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller

public class ProductController {
    @Autowired
    ProductService productService;
    @GetMapping("/getAllProducts")
public  String ShowAllPrdoucts(Model model , HttpSession session)
{
   List<Product> products=productService.getAllProducts();
model.addAttribute("products",products);
    System.out.println(products.size());
    User currUser=(User)session.getAttribute("currentUser");
    if(currUser.getRole().equals("Admin"))
        return "AdminDashBorad";
    else
        return "Home";
}
@GetMapping("/Edit")
public String showEditForm(@RequestParam("id") int id, Model model)
{
    Product product= productService.getProductById(id);
    model.addAttribute("product",product);
    return "Edit";
}
    @PostMapping("/editProduct")
    public String editProduct(@ModelAttribute("product") Product product, HttpSession session) throws IOException {

        Product existingProduct = productService.getProductById(product.getId());

        MultipartFile image = product.getProductImage();

        if (image != null && !image.isEmpty()) {
            String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
            String uploadDir = "C:/uploads/";
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            File saveFile = new File(uploadDir, fileName);
            image.transferTo(saveFile);

            product.setImageUrl(fileName);
        } else {
            product.setImageUrl(existingProduct.getImageUrl());
        }

        User currentUser = (User) session.getAttribute("currentUser");
        product.setUser(currentUser);

        productService.UpdateProduct(product);

        return "redirect:/getAllProducts";
    }

@GetMapping("/Add")
    public String Add(Model model)
{
    model.addAttribute("product",new Product());
    return "Add";
}
    @PostMapping("/Add")
    public String AddProduct(@ModelAttribute("product")Product product , HttpSession session) throws IOException {
        MultipartFile image = product.getProductImage();
        String fileName= System.currentTimeMillis() +'_' + image.getOriginalFilename();
        String uploadDir = "C:/uploads/";
        File dir = new File(uploadDir);

        if (!dir.exists()) {
            dir.mkdirs();
        }
        File saveFile= new File(uploadDir,fileName);
        image.transferTo(saveFile);
        product.setImageUrl(fileName);
        product.setUser((User) session.getAttribute("currentUser"));
        productService.AddProduct(product);

        return "redirect:/getAllProducts";
    }
    @GetMapping("/Delete")
    public String deleteProduct(@RequestParam("id") int id)
    {

        productService.deleteProduct(id);
        return "redirect:/getAllProducts";
    }



}

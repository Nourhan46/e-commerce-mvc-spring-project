package org.example.controller;

import org.example.entity.User;
import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AuthnController {
    @Autowired
    private UserService userService;
     @GetMapping("/")
    public String home(Model model)
     {

        return "welcome";
    }
    @GetMapping("/login")
    public String showLoginForm(Model model)
    {
        model.addAttribute("user", new User());
        return "login";

    }
    @PostMapping("/login")
    public String login(@ModelAttribute("user") User user , HttpSession session)
    {
        User LoggedUser = null;
        try {
            LoggedUser = userService.getUser(user.getEmail(),user.getPassword());
            System.out.println(LoggedUser.getRole());

            session.setAttribute("currentUser",LoggedUser);

                return "redirect:/getAllProducts";
        } catch (AuthenticationException e) {
            return "SignUp";
        }

    }
    @PostMapping("/signup")
    public String signup(@ModelAttribute("user") User user)
    {
        userService.addUser(user);
        return "redirect:/login";
    }
    @GetMapping("/SignUp")
    public String showSignUpPage(Model model)
    {
        model.addAttribute("user",new User());
        return "SignUp";
    }
}

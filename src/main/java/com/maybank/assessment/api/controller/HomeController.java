package com.maybank.assessment.api.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.maybank.assessment.api.model.entity.User;
import com.maybank.assessment.api.service.UserService;
import com.maybank.assessment.api.util.PasswordManager;

import jakarta.transaction.Transactional;

@RestController
public class HomeController {

    private final UserService userService;

    public HomeController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    @Transactional
    public String home() {
        return "Welcome to HomePage!";
    }

    @PostMapping("/password")       // for dev purpose only, never write or leave something like this in PROD
    public String bCryptedPassword(@RequestBody String password) {
        return PasswordManager.encrypt(password);
    }

    @PostMapping("/check-password/{id}")  // for dev purpose only, never write or leave something like this in PROD
    public boolean checkBCryptedPassword(@PathVariable long id, @RequestBody String password) {
        User user = userService.getUserById(id).orElseThrow(() ->
            new RuntimeException("User not found")
        );
        return PasswordManager.isMatched(password, user.getPassword());
    }

    @SuppressWarnings("unchecked")
    @GetMapping("joke-api")
    @Transactional
    public Map<String, Object> getJokes() {
        String url = "https://v2.jokeapi.dev/joke/Any?amount=5";
        RestTemplate restTemplate = new RestTemplate();
        @SuppressWarnings("rawtypes")
        ResponseEntity<Map> response = restTemplate.getForEntity(url, Map.class);
        return response.getBody();
    }
}

package com.maybank.assessment.api.controller;

import org.springframework.web.bind.annotation.RestController;

import com.maybank.assessment.api.config.exception.InvalidInputException;
import com.maybank.assessment.api.model.entity.User;
import com.maybank.assessment.api.service.UserService;

import jakarta.transaction.Transactional;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequestMapping("/api/v1/user")
@Transactional
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<User> getAllUser() {
        return this.userService.getAllUser();
    }

    @GetMapping("/paginated")
    public ResponseEntity<Page<User>> getPaginatedUser(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        Page<User> users = this.userService.getPaginatedUser(page, size);
        return ResponseEntity.ok(users);
    }

    @GetMapping("{id}")
    public User getUserById(@PathVariable long id) {
        return this.userService.getUserById(id).orElseThrow(() -> 
            new InvalidInputException("User not found")
        );
    }

    @PostMapping
    public ResponseEntity<User> createUser(@RequestBody User userDetails) {
        Optional<User> existingUser = userService.getUserByUsername(userDetails.getUsername());
        if (existingUser.isPresent()) {
            throw new RuntimeException("Username already exists");
        }
        User createdUser = userService.createUser(userDetails);
        return ResponseEntity.ok(createdUser);
    }

    @PutMapping
    public ResponseEntity<User> updateUser(@RequestBody User userDetails) {
        Optional<User> existingUser = userService.getUserByUsername(userDetails.getUsername());
        if (existingUser.isPresent()) {
            throw new RuntimeException("Username already exists");
        }
        User updatedUser = userService.updateUser(userDetails);
        return ResponseEntity.ok(updatedUser);
    }
}

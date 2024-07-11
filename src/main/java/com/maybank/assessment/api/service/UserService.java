package com.maybank.assessment.api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.maybank.assessment.api.config.exception.InvalidInputException;
import com.maybank.assessment.api.model.entity.User;
import com.maybank.assessment.api.model.entity.UserRepository;
import com.maybank.assessment.api.util.PasswordManager;

@Service
public class UserService {
    
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    public Page<User> getPaginatedUser(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return userRepository.findAll(pageable);
    }

    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

    public Optional<User> getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public User createUser(User userDetails) {
        userDetails.setPassword(PasswordManager.encrypt(userDetails.getPassword()));
        return userRepository.save(userDetails);
    }

    public User updateUser(User userDetails) {
        User user = userRepository.findById(userDetails.getId()).orElseThrow(() ->
            new InvalidInputException("User not found")
        );
        if (userDetails.getUsername() != null) {
            user.setUsername(userDetails.getUsername());
        }
        if (userDetails.getPassword() != null) {
            user.setPassword(PasswordManager.encrypt(userDetails.getPassword()));
        }
        return userRepository.save(user);
    }
}

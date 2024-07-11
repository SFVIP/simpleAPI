package com.maybank.assessment.api.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordManager {
    
    /**
     * Encrypt using BCryptPasswordEncorder
     * @param rawPassword
     * @param encodedPassword
     * @return
     */ 
    public static String encrypt(String password) {
        return new BCryptPasswordEncoder().encode(password);
    }

    public static boolean isMatched(CharSequence rawPassword, String encodedPassword) {
        return new BCryptPasswordEncoder().matches(rawPassword, encodedPassword);
    }
}

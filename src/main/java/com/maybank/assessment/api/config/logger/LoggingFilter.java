package com.maybank.assessment.api.config.logger;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Collections;

@Component
public class LoggingFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(LoggingFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Log Request Headers
        logger.info("Request URL: {}", httpRequest.getRequestURL());
        logger.info("Request Headers: ");
        Collections.list(httpRequest.getHeaderNames())
                .forEach(headerName -> logger.info("{}: {}", headerName, httpRequest.getHeader(headerName)));

        // Log Request Body
        CustomHttpRequestWrapper requestWrapper = new CustomHttpRequestWrapper(httpRequest);
        logger.info("Request Body: {}", requestWrapper.getBody());

        // Continue the filter chain
        CustomHttpResponseWrapper responseWrapper = new CustomHttpResponseWrapper(httpResponse);
        chain.doFilter(requestWrapper, responseWrapper);

        // Log Response Headers
        logger.info("Response Headers: ");
        responseWrapper.getHeaderNames()
                .forEach(headerName -> logger.info("{}: {}", headerName, responseWrapper.getHeader(headerName)));

        // Log Response Body
        String responseBody = new String(responseWrapper.toByteArray(), StandardCharsets.UTF_8);
        logger.info("Response Body: {}", responseBody);

        // Copy content of the response wrapper to the original response
        response.getOutputStream().write(responseWrapper.toByteArray());
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }
}

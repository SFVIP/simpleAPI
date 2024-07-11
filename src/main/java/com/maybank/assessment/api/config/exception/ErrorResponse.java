package com.maybank.assessment.api.config.exception;

import java.time.LocalDateTime;

public class ErrorResponse {

    private int statusCode;
    private String errorMessage = "Failed";
    private LocalDateTime datetime = LocalDateTime.now();

    public ErrorResponse() {}

    public ErrorResponse(int statusCode) {
        this.statusCode = statusCode;
    }

    public ErrorResponse(int statusCode, String errorMessage) {
        this.statusCode = statusCode;
        if (errorMessage != null && !errorMessage.isEmpty()) {
            this.errorMessage = errorMessage;
        }
    }

    public ErrorResponse(int statusCode, String errorMessage, LocalDateTime datetime) {
        this.statusCode = statusCode;
        this.errorMessage = errorMessage;
        this.datetime = datetime;
    }

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public LocalDateTime getDatetime() {
        return datetime;
    }

    public void setDatetime(LocalDateTime datetime) {
        this.datetime = datetime;
    }
}

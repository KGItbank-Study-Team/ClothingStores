package com.kgitbank.slimbear.exception;

import java.sql.SQLException;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class SlimbearExceptionHandler {

	@ExceptionHandler(NoHandlerFoundException.class)
	public String handleException(NoHandlerFoundException exception, Model model) {
		model.addAttribute("exception", exception);
		return "errors/404";
	}
	
	@ExceptionHandler(SQLException.class)
	public String handleException(SQLException exception, Model model) {
		model.addAttribute("exception", exception);
		return "errors/sqlError";
	}
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception exception, Model model) {
		model.addAttribute("exception", exception);
		return "errors/globalError";
	}
}

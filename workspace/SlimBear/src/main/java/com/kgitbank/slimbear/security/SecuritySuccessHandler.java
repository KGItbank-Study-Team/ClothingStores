package com.kgitbank.slimbear.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class SecuritySuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		for(Object i : authentication.getAuthorities()) {
			if(i.toString().equals("ADMIN")) {
				response.sendRedirect("/admin/home");
				return;
			}
			else if(i.toString().equals("MEMBER")) {
				response.sendRedirect("/");
				return;
			}
		}
	
		response.sendRedirect("/");
	}
}

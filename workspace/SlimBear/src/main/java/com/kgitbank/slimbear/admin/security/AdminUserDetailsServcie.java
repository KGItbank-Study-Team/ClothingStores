package com.kgitbank.slimbear.admin.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.admin.dao.AdminDAO;
import com.kgitbank.slimbear.admin.dto.AdminDTO;

@Service
public class AdminUserDetailsServcie implements UserDetailsService{
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public AdminSecurityUser loadUserByUsername(String username) throws UsernameNotFoundException {
		AdminDTO admin = adminDAO.getAdminById(username);
		System.out.println(username);
		if (admin == null) {
			throw new UsernameNotFoundException(username + " 사용자 없음");
		} else {
			return new AdminSecurityUser(admin);
		}
	}

}

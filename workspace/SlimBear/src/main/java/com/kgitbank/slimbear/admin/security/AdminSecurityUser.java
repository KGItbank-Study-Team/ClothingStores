package com.kgitbank.slimbear.admin.security;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.kgitbank.slimbear.admin.dto.AdminDTO;

public class AdminSecurityUser extends User{

	private static final long serialVersionUID = 1L;

	public AdminSecurityUser(AdminDTO admin) {

		super(admin.getId(), "{noop}"+ admin.getPassword(), AuthorityUtils.createAuthorityList("ADMIN"));
	}

}

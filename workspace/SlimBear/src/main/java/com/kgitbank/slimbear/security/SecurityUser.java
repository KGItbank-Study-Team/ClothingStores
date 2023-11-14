package com.kgitbank.slimbear.security;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.kgitbank.slimbear.admin.dto.AdminDTO;
import com.kgitbank.slimbear.dto.MemberDTO;

import lombok.Getter;

@Getter
public class SecurityUser extends User{

	private static final long serialVersionUID = 1L;
	
	private long uid;

	public SecurityUser(MemberDTO member) {
		super(member.getId(), member.getPassword(), AuthorityUtils.createAuthorityList("MEMBER"));
		uid = member.getUid();
	}

	public SecurityUser(AdminDTO admin) {
		super(admin.getId(), "{noop}"+ admin.getPassword(), AuthorityUtils.createAuthorityList("ADMIN"));
		uid = admin.getUid();
	}
}
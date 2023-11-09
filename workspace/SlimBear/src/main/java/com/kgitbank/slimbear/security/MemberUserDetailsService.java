package com.kgitbank.slimbear.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dto.MemberDTO;

@Service
public class MemberUserDetailsService implements UserDetailsService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public SecurityUser loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDTO member = memberDAO.getMemberById(username);
		if (member == null) {
			throw new UsernameNotFoundException(username + " 사용자 없음");
		} else {
			return new SecurityUser(member);
		}
	}
}
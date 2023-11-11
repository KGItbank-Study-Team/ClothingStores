package com.kgitbank.slimbear.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.kgitbank.slimbear.security.MemberUserDetailsService;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private MemberUserDetailsService memberUserDetailsService;

	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity security) throws Exception {
		security.authorizeRequests().antMatchers("/").permitAll();
		security.authorizeRequests().antMatchers("/app/member/myPage/**").authenticated();
		//security.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");
		security.csrf().disable();
		
		security.formLogin().loginPage("/app/login").loginProcessingUrl("/app/member/login")
		.defaultSuccessUrl("/").failureUrl("/app/login?error");
		security.logout().logoutUrl("/app/member/logout").invalidateHttpSession(true);// .deleteCookies(); 쿠키까지 하고싶으면 사용
		
		// 권한 없을 경우
		security.exceptionHandling().accessDeniedPage("/app/main");
		
		security.userDetailsService(memberUserDetailsService);
	}

}

package com.kgitbank.slimbear.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private SlimbearUserDetailsService userDetailsService;
	
    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
	
	@Override
	protected void configure(HttpSecurity security) throws Exception {
		security.authorizeRequests().antMatchers("/").permitAll();
		
		// 로그인해야만 갈수있는 화면
		security.authorizeRequests().antMatchers("/app/member/myPage/**").authenticated();
		security.authorizeRequests().antMatchers("/admin/home/**").authenticated();
		
		// 로그인한 사용자가 해당 권한일경우 사용가능
		security.authorizeRequests().antMatchers("/app/member/myPage/**").hasAnyAuthority("MEMBER");
		security.authorizeRequests().antMatchers("/admin/home/**").hasAnyAuthority("ADMIN");
		
		security.csrf().disable();
		
		security.formLogin().loginPage("/app/login").loginProcessingUrl("/app/member/login")
		.defaultSuccessUrl("/app/login/success").failureForwardUrl("/app/login?error");
		security.logout().logoutUrl("/app/member/logout").invalidateHttpSession(true);// .deleteCookies(); 쿠키까지 하고싶으면 사용
		
		// 권한 없을 경우
		security.exceptionHandling().accessDeniedPage("/");
		
		security.userDetailsService(userDetailsService);
	}
}

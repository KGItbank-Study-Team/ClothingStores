package com.kgitbank.slimbear.admin.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
@Order(Ordered.HIGHEST_PRECEDENCE)
public class AdminSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AdminUserDetailsServcie adminUserDetailsService;
	
    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
    
	@Override
	protected void configure(HttpSecurity security) throws Exception {
		security.authorizeRequests().antMatchers("/admin/").permitAll();
		security.authorizeRequests().antMatchers("/admin/home/**").authenticated();
		security.csrf().disable();
		
		security.formLogin().loginPage("/admin/auth").loginProcessingUrl("/admin/login")
		.defaultSuccessUrl("/admin/home").failureUrl("/admin/auth?error");
		security.logout().logoutUrl("/admin/logout").invalidateHttpSession(true);// .deleteCookies(); 쿠키까지 하고싶으면 사용
		
		// 권한 없을 경우
		security.exceptionHandling().accessDeniedPage("/admin/auth");
		
		security.userDetailsService(adminUserDetailsService);
	}

}

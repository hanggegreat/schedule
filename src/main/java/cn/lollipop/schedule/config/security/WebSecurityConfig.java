package cn.lollipop.schedule.config.security;

import cn.lollipop.schedule.util.CustomerPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    private final UserDetailsService userDetailsService;

    @Autowired
    public WebSecurityConfig(@Qualifier("customerUserDetailsService") UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(new CustomerPasswordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .formLogin().loginPage("/login")
                .and()
                .rememberMe()
                .and()
                .logout().logoutUrl("/logout").logoutSuccessUrl("/login")
                .and()
                .authorizeRequests()
                .antMatchers("/index", "/home", "/")
                .authenticated()
                .antMatchers("/student/**")
                .hasRole("STUDENT")
                .antMatchers("/teacher/adviser/**")
                .hasRole("ADVISER")
                .antMatchers("/teacher/gradeLeader/**")
                .hasRole("GRADELEADER")
                .antMatchers("/teacher/subLeader/**")
                .hasRole("SUBLEADER")
                .antMatchers("/teacher/academic/**")
                .hasAnyRole("ACADEMIC", "REGISTRAR")
                .antMatchers("/teacher/registrar/**")
                .hasRole("REGISTRAR")
                .antMatchers("/teacher/principal/**")
                .hasRole("PRINCIPAL")
                .antMatchers("/teacher/**")
                .hasRole("TEACHER")
                .anyRequest()
                .permitAll()
                .and()
                .headers().frameOptions().disable();
    }
}

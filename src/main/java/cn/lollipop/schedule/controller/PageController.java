package cn.lollipop.schedule.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author lollipop
 * @email nhuy@qq.com
 * @date 2018/11/25 13:11
 */
@Controller
public class PageController {
    @RequestMapping({"/", "/index", "/home"})
    public String index() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "sub-view/welcome";
    }

    @RequestMapping("/getAuthentication")
    @ResponseBody
    public Authentication getAuthentication(Authentication authentication) {
        return authentication;
    }
}

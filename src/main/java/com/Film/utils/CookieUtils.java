package com.Film.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Film.Service.UserService;
import com.Film.entity.User;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * cookie的增加、删除、查询
 */
public class CookieUtils {
    public static final String USER_COOKIE = "user";
    @Qualifier("UserService")
    @Autowired
    private UserService userService;

    // 添加一个cookie
    public Cookie addCookie(User user) {
        Cookie cookie = null;
        try {
//            cookie进行编码
            String value = URLEncoder.encode(user.getName() + ","
                            + user.getPassword(),"UTF-8");
            cookie = new Cookie(USER_COOKIE, value);
            System.out.println("添加cookie");
            System.out.println(cookie.getName());
            System.out.println(cookie.getValue());
            System.out.println(URLDecoder.decode(cookie.getValue(),"UTF-8"));
            cookie.setMaxAge(60 * 60 * 24 * 14);// cookie保存两周
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return cookie;
    }

    // 得到cookie
    public User getCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        System.out.println("cookies: " + cookies);
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                System.out.println("cookie: " + cookie.getName());
                if (CookieUtils.USER_COOKIE.equals(cookie.getName())) {
                    String value = cookie.getValue();
                    if (StringUtils.isNotBlank(value)) {
                        try {
//                            解码
                            value = URLDecoder.decode(value,"UTF-8");
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                            System.out.println("解码错误！");
                            return null;
                        }
                        String[] split = value.split(",");
                        String username = split[0];
                        String password = split[1];
                        User user= (User) FilmContext.getBean("User");
                        user.setName(username);
                        user.setPassword(password);
                        return userService.findUser(user);
                    }
                }
            }
        }
        return null;
    }

    // 删除cookie
    public Cookie delCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (USER_COOKIE.equals(cookie.getName())) {
                    cookie.setValue("");
                    cookie.setMaxAge(0);
                    return cookie;
                }
            }
        }
        return null;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}

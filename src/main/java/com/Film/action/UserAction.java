package com.Film.action;

import com.Film.Service.UserService;
import com.Film.Service.impl.UserServiceImpl;
import com.Film.entity.User;
import com.Film.utils.CookieUtils;
import com.Film.utils.FilmContext;
import com.Film.utils.NetWorkUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public class UserAction extends ActionSupport implements ServletRequestAware,
        ServletResponseAware, SessionAware {

    private String id;
    private String name;
    private String password;
    private String phone;
    private String email;
    private String idcard;
    private String message=ERROR;
    private String checkCode;
    private String checkKey;
    private String upPass;
    private static final long serialVersionUID = 6650955874307814247L;
    public static final String USER_SESSION = "user";
    private HttpServletResponse response;
    private HttpServletRequest request;
    private Map<String, Object> session;
    @Qualifier("CookieUtils")
    @Autowired
    private CookieUtils cookieUtils;
    @Qualifier("UserService")
    @Autowired
    private UserService userService;

    public void validate() {
        if (this.getName() == null || this.getName().length() == 0) {
            addFieldError("name", "用户名不允许为空！");
        }
        if (this.getPassword()== null || this.getPassword().length() == 0) {
            addFieldError("password", "密码不允许为空！");
        }

    }


    public boolean Check(){
        String checkCode2 = (String)session.get("checkCode");
        System.out.println(checkCode2);
        System.out.println(getCheckCode());
        if (!this.getCheckCode().equals(checkCode2)) {
            request.setAttribute("msg","验证码错误");
            return false;
        }else return true;
    }

    public String execute() throws Exception {
        return super.execute();
    }

//    登录
    public String Login() throws Exception{
//        登录直连
        User user_get = (User) session.get("user");
        User user_cookie = cookieUtils.getCookie(request);
//        检验session
        if (user_get!=null){
            User user_true = userService.findUser(user_get);
            message = SUCCESS;
            if (user_true!=null){
                System.out.println(user_get.toString()+"session请求直连");
                return message;
            }
//          检验cookie
        }else if (user_cookie!=null){
            User user_true = userService.findUser(user_cookie);
            if (user_true!=null) {
                session.put("user", user_true);
                request.setAttribute("user",user_true);
                System.out.println(user_cookie.toString()+"Cookie请求直连");
                return SUCCESS;
            }
        }
//        正常登录流程
        if (!Check()&&(user_cookie==null||user_get==null)) return INPUT;
        User user = getUser();
        System.out.println(user.toString() + "请求登录");
        User user_true = userService.findUser(user);
        if (user_true!=null) {
            Cookie cookie = cookieUtils.addCookie(user_true);
            if (cookie!=null){
                response.addCookie(cookie);// 添加cookie到response中
                session.put("user", user_true);
                request.setAttribute("user",user_cookie);
                message = SUCCESS;
            }else {
                System.out.println("编码失败！");
                request.setAttribute("msg", "用户名或密码错误，请重试");
                message = INPUT;
            }
        } else {
            message = INPUT;
            request.setAttribute("msg", "用户名或密码错误，请重试");
        }
        System.out.println(request.getRemoteAddr()+":"+"请求登录");
        return message;
    }

//    注册
    public String Register() throws Exception{
        System.out.println(getCheckKey());
        if (getCheckKey()==null) {
            if (!Check()) return INPUT;
        }else if (!getCheckKey().equals("true")){
            if (!Check()) return INPUT;
        }
        User user=getUser();
        if (userService.UserIsEmpty(user)) return ERROR;
        else {
            boolean key=userService.AddUser(user);
            if (key) return SUCCESS;
            else {
                request.setAttribute("msg","用户已存在");
                return INPUT;
            }
        }
    }

//    更新用户
    public String UpdateClient() throws Exception{
        User user=getUser();
        boolean key = userService.UpdateUser(user);
        if (key){
            request.setAttribute("msg","更新成功");
        }else {
            request.setAttribute("msg","更新失败");
        }
        message = INPUT;
        if (getUpPass()!=null){
            if (getUpPass().equals("true"))
            message=LOGIN;
            else message = INPUT;
        }
        return message;
    }

    public String Forget() throws Exception{
            System.out.println(getName()+"找回密码ing");
            User user = userService.GetUser(getName(),getEmail());
            if (user==null){
                request.setAttribute("msg","未找到用户信息");
            }else {
                request.setAttribute("user",user);
                return LOGIN;
            }
        return ERROR;
    }

//    查找用户
    public String FindClient() throws Exception{
        if (getId()!=null) {
            User user = userService.findUser(Integer.parseInt(getId()));
            if (getUpPass().equals("true")){
                if (user!=null) {
                    request.setAttribute("user",user);
                    return LOGIN;
                }else {
                    request.setAttribute("msg","查找失败");
                    return INPUT;
                }
            }else {
                if (user != null) {
                    request.setAttribute("user", user);
                    return SUCCESS;
                } else {
                    request.setAttribute("msg", "查找失败");
                    return INPUT;
                }
            }
        }
        else return INPUT;
    }

//    搜索用户
    public String GetUsers() throws Exception{
        if (getName()!=null) {
            List<User> users = userService.FindUsers(getName());
            User user2 = getUser();
            if (users!=null) {
                if (users.size() > 0) {
                    request.setAttribute("user2", user2);
                    request.setAttribute("Clients", users);
                    request.setAttribute("ClientSize", users.size());
                    request.setAttribute("msg", "用户列表获取成功");
                    return SUCCESS;
                }else {
                    request.setAttribute("msg", "此处BUG请联系管理员！");
                    return INPUT;
                }
            }else {
                request.setAttribute("msg", "未找到相关信息！");
                return INPUT;
            }
        }else {
            request.setAttribute("msg","请确认查找信息无误");
            return INPUT;
        }
    }

//    删除用户
    public String DeleteUser() throws Exception{
        if (getId()!=null){
            User user = userService.findUser(Integer.valueOf(getId()));
            if (user!=null){
                userService.DeleteUser(user);
                request.setAttribute("msg","删除成功！");
                return SUCCESS;
            }else {
                request.setAttribute("msg","删除失败！");
                request.setAttribute("upPass","false");
                request.setAttribute("id",getId());
                return INPUT;
            }
        }else {
            request.setAttribute("msg","未找到相关信息");
            return ERROR;
        }
    }

    // 用户退出
    public String logout() {
        HttpSession session = request.getSession(false);
        if (session != null)
            session.removeAttribute(USER_SESSION);
        Cookie cookie = cookieUtils.delCookie(request);
//        覆盖Cookie
        if (cookie != null) response.addCookie(cookie);
        return SUCCESS;
    }

//    读取用户
    public User getUser(){
        User user= (User) FilmContext.getBean("User");
        if (getId()!=null) user.setId(Integer.parseInt(getId()));
        user.setName(getName());
        user.setPassword(getPassword());
        user.setEmail(getEmail());
        user.setPhone(getPhone());
        user.setIdcard(getIdcard());
        return user;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String getCheckCode() {
        return checkCode;
    }

    public void setCheckCode(String checkCode) {
        this.checkCode = checkCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request=httpServletRequest;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response=httpServletResponse;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session=map;
    }

    public CookieUtils getCookieUtils() {
        return cookieUtils;
    }

    public void setCookieUtils(CookieUtils cookieUtils) {
        this.cookieUtils = cookieUtils;
    }

    public String getCheckKey() {
        return checkKey;
    }

    public void setCheckKey(String checkKey) {
        this.checkKey = checkKey;
    }

    public String getUpPass() {
        return upPass;
    }

    public void setUpPass(String upPass) {
        this.upPass = upPass;
    }
}

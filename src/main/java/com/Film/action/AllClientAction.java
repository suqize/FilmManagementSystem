package com.Film.action;

import com.Film.Service.UserService;
import com.Film.Service.impl.UserServiceImpl;
import com.Film.entity.User;
import com.Film.utils.FilmContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;
import java.util.Map;

public class AllClientAction extends ActionSupport {
    public String message;
    @Qualifier("UserService")
    @Autowired
    private UserService userService;
    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    public String execute() throws Exception {
        return SUCCESS;
    }

    public String list() throws Exception{
        List<User> all = userService.findAll();
//        Map session = ActionContext.getContext().getSession();
        Map request = (Map) ActionContext.getContext().get("request");
        if (all.size()>0) {
//            request.put("Clients", all);
            request.put("Clients", all);
            request.put("ClientSize",all.size());
            request.put("msg", "列表获取成功");
            message = SUCCESS;
        }else {
            message = ERROR;
            request.put("msg", "列表获取失败");
        }
        return message;
    }


}

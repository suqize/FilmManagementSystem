<%--
  Created by IntelliJ IDEA.
  User: SuQiZhe
  Date: 2022/11/20
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        function refresh() {
            //IE存在缓存,需要new Date()实现更换路径的作用
            document.getElementById("image").src="createImageAction.action?+ Math.random()"+new Date();
        }
    </script>
    <title>登陆页面</title>
</head>
<body>
<center>
    <h3>用户登录</h3>
    <s:fielderror cssStyle="color:red"></s:fielderror>
    <s:form action="login" method="post" name="code">
        <s:textfield name="checkCode" maxlength="4" label="验证码"/>
        验证码：<img id="image" border="0"  onclick="refresh()"  src="createImageAction.action" title="看不清，换一张">
        <s:submit value="登陆"/>
        <s:reset value="重新输入"/>
        <a href="register.jsp">尚未注册，点击注册</a>
    </s:form>
</center>
</body>
</html>

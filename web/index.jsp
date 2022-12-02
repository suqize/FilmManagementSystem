<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="resources/css/login.css">
  <script type="text/javascript" src="resources/js/jquery.min.js"></script>
  <title>电影后台管理系统</title>
    <link rel="stylesheet" href="resources/css/mylogin_new.css">
    <script>
        //    验证码刷新
        function refresh() {
            //IE存在缓存,需要new Date()实现更换路径的作用
            document.getElementById("image").src="createImageAction.action?+ Math.random()"+new Date();
            document.getElementById("image2").src="createImageAction.action?+ Math.random()"+new Date();
        }
    </script>
</head>
<body>
<h1 id="login_title" align="center">电影后台管理系统</h1>
<div class="container">
    <!-- Sign Up -->
    <div class="container__form container--signup">
        <form action="RegisterAction.action" method="post" class="form" id="form1" onsubmit="return register()">
            <h2 class="form__title">Sign Up</h2>
            <input id="name" type="text" name="name" placeholder="用户名" class="input" />
<%--            <input type="email" placeholder="Email" class="input" />--%>
            <input id="password1" name="password" type="password" placeholder="密码" class="input" />
            <input id="password2" name="password2" type="password" placeholder="确认密码" class="input" />
            <input id="email" name="email" type="email" placeholder="邮箱" class="input" />
            <input id="phone" name="phone" type="tel" placeholder="手机号" class="input" />
            <div class="check">
                <input type="text" name="checkCode" placeholder="验证码"/>
                <img id="image2" border="0"  onclick="refresh()"  src="createImageAction.action" title="看不清，换一张">
            </div>
            <s:set var="msg" value="#request.msg"/>
            <span id="err" style="color: red;text-align: center;"><s:property value="#msg"/></span>
<%--            <input id="idcard" name="idcard" type="text" placeholder="身份证号" class="input" />--%>
            <button class="btn" type="submit">注册</button>
        </form>
    </div>

    <!-- Sign In -->
    <div class="container__form container--signin">
        <form action="LoginAction.action" method="post" class="form" id="form2">
            <h2 class="form__title">Sign In</h2>
            <input type="text" name="name" placeholder="用户名" class="input" />
            <input type="password" name="password" placeholder="密码" class="input"/>
            <div class="check">
            <input type="text" name="checkCode" placeholder="验证码"/>
            <img id="image" border="0"  onclick="refresh()"  src="createImageAction.action" title="看不清，换一张">
            </div>
            <s:set var="msg" value="#request.msg"/>
            <span id="err" style="color: red;text-align: center;"><s:property value="#msg"/></span>
            <a href="Clients/Forget.jsp" style="text-decoration: none;color: #1b75b6" class="link _forget">Forgot your password?</a>
            <button class="btn" type="submit">登录</button>
        </form>
    </div>

    <!-- Overlay -->
    <div class="container__overlay">
        <div class="overlay">
            <div class="overlay__panel overlay--left">
                <button class="btn" id="signIn">Sign In</button>
            </div>
            <div class="overlay__panel overlay--right">
                <button class="btn" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="resources/js/mylogin_new.js"></script>
<script type="text/javascript">

    $(function () {
        let msg="${requestScope.msg}"
        if(msg.length>0&&msg!==""){
            if (msg==="用户已存在"){
                alert(msg);
                container.classList.add("right-panel-active");
            }
        }
    })

<%--注册判断--%>
    function register(){
        let password1=$("#password1").val()
        let password2=$("#password2").val()
        console.log(password1)
        console.log(password2)
        if (password1===password2) return true;
        else {
            alert("两次密码不相同，请重新输入！");
            return false;
        }
    }
</script>
<div id="login_bottom">
  版权所有 Copyright &copy; 2022-Now Powered by @苏启哲
</div>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: SuQiZhe
  Date: 2022/11/21
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/main.css">
    <link rel="stylesheet" href="../resources/css/jHsDate.css">
    <link rel="stylesheet" id='skin' type="text/css" href="../resources/prompt/skin/qq/ymPrompt.css"/>

    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script>
    <script type="text/javascript" src="../resources/prompt/ymPrompt.js"></script>
    <script type="text/javascript" src="../resources/js/jHsDate.js"></script>
<%--    <script>--%>
<%--        //    验证码刷新--%>
<%--        function refresh() {--%>
<%--            //IE存在缓存,需要new Date()实现更换路径的作用--%>
<%--            document.getElementById("image2").src="createImageAction.action?+ Math.random()"+new Date();--%>
<%--        }--%>
<%--    </script>--%>
</head>
<body>
<!-- Sign Up -->
<div class="container">
    <div id="forms" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_center">
                    <form action="AddUser.action" class="jqtransform" enctype="multipart/form-data" onsubmit="return toVaild()" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:set var="user" value="#request.user"/>
                            <input type="text" readonly name="checkKey" hidden value="true"/>
                            <tr>
                                <td class="td_right">用户名：</td>
                                <td width="320px">
                                    <%--标题--%>
                                    <input type="text" name="name" id="name" class="input-text lh30"
                                           size="40" maxlength="20" value="<s:property value="#news.name"/>">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">密码：</td>
                                <td>
                                    <%--密码--%>
                                    <input required type="password" name="password" id="publisher" class="input-text lh30" size="40"
                                           maxlength="20" value="${user.password}">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">再次输入密码：</td>
                                <td class="">
                                    <%--再次密码--%>
                                    <input required type="password" id="password2" class="input-text lh30" size="40"
                                           maxlength="20" value="${user.password}">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">邮箱：</td>
                                <td>
                                    <%--邮箱--%>
                                    <input type="email" name="email" id="email" class="input-text lh30"
                                           size="40" maxlength="20" value="${user.email}" >
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">手机号：</td>
                                <td>
                                    <%--邮箱--%>
                                    <input type="tel" name="phone" id="phone" class="input-text lh30"
                                           size="40" maxlength="20" value="${user.phone}" >
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">身份证号：</td>
                                <td>
                                    <%--邮箱--%>
                                    <input type="text" name="idcard" id="idcard" class="input-text lh30"
                                           size="40" maxlength="20" value="${user.idcard}" >
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">&nbsp;</td>
                                <td class="">
                                    <input type="submit" width="" name="button" class="btn btn82 btn_save2" value="添加">
                                    <input type="reset" name="button" class="btn btn82 btn_res" value="重置">　
                                    <s:set var="msg" value="#request.msg"/>
                                    <span id="err" style="color: red;text-align: center;"><s:property value="#msg"/></span>
                                </td>
                            </tr>
                        </table>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function toVaild() {
        var name = $('#name').val();
        if (name.length === 0) {
            $('#err').text('用户名不能为空');
            return false;
        }
        let email = $("#email").val();
        if (email.length === 0){
            $('#err').text('邮箱不能为空');
            return false;
        }
        let phone = $("#phone").val();
        if (phone.length === 0){
            $('#err').text('手机号不能为空');
            return false;
        }
        let idcard = $("#idcard").val();
        if (idcard.length === 0){
            $('#err').text('身份证不能为空');
            return false;
        }
        let password1=$("#password").val()
        let password2=$("#password1").val()
        console.log(password1)
        console.log(password2)
        if (password1!==password2){
            $('#err').text("两次密码不相同，请重新输入！");
            return false;
        }
        return true;
    }
</script>
</body>
</html>

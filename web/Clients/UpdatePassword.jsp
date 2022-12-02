<%--
  Created by IntelliJ IDEA.
  User: SuQiZhe
  Date: 2022/11/22
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/main.css">
    <link rel="stylesheet" href="../resources/css/jHsDate.css">
    <link rel="stylesheet" id='skin' type="text/css" href="../resources/prompt/skin/qq/ymPrompt.css"/>

    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script>
    <script type="text/javascript" src="../resources/prompt/ymPrompt.js"></script>
    <script type="text/javascript" src="../resources/js/jHsDate.js"></script>
</head>
<body>
<div class="container">
    <div id="forms" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_center">
                    <form action="ClientUpdate.action" class="jqtransform" enctype="multipart/form-data" onsubmit="return toVaild()" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:set var="user" value="#request.user"/>
                            <%--隐藏信息，不需要更改的--%>
                            <input type="hidden" name="id" value="${user.id}">
                            <tr>
                                <td class="td_right">用户名：</td>
                                <td width="320px">
                                    <%--用户名--%>
                                    <input type="text" name="name" id="id" class="input-text lh30 disabled"
                                           size="40" maxlength="20" readonly value="${user.name}">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">旧密码：</td>
                                <td>
                                    <%--旧密码--%>
                                    <input required type="text" name="password_old" id="password_old" class="input-text lh30" size="40"
                                           maxlength="20">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">新密码：</td>
                                <td>
                                    <%--新密码--%>
                                    <input required type="text" name="password" id="password_new" class="input-text lh30" size="40"
                                           maxlength="20">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">再次输入密码：</td>
                                <td>
                                    <%--新密码--%>
                                    <input required type="text" name="password2" id="password2" class="input-text lh30" size="40"
                                           maxlength="20">
                                </td>
                            </tr>
                            <input required type="email" name="email" id="email" class="input-text lh30" size="40"
                                   maxlength="20" hidden value="${user.email}"/>
                            <input type="tel" name="phone" id="phone" class="input-text lh30"size="40"
                                   maxlength="20" hidden value="${user.phone}">
                            <input required type="text" name="idcard" id="idcard" class="input-text lh30" size="40"
                                   maxlength="20" hidden value="${user.idcard}">
                            <tr>
                                <td class="td_right">&nbsp;</td>
                                <td class="">
                                    <input type="submit" name="button" class="btn btn82 btn_save2" value="修改">
                                    <input type="reset" name="button" class="btn btn82 btn_res" value="重置">　
                                    <s:set var="msg" value="#request.msg"/>
                                    <span id="err" style="color: red;text-align: center;"><s:property value="#requets.msg"/></span>
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
        var password_old = $('#password_old').val().trim();
        var password_new = $('#password_new').val();
        var password_2 = $('#password2').val()
        if (password_old.length === 0) {
            $('#err').text('老密码不能为空');
            return false;
        }else {
            if (password_old !== "${user.password}"){
                $('#err').text('旧密码错误');
                return false;
            }
        }
        if(password_new.length === 0){
            $('#err').text('新密码不能为空');
            return false;
        }
        if(password_2.length === 0){
            $('#err').text('重复密码不能为空');
            return false;
        }
        if(password_new!==password_2){
            $('#err').text('两次密码不相同，请重新输入');
            return false;
        }
        return true;
    }

    $(function () {
        let msg="${requestScope.msg}"
        if (msg.length>0&&msg!=="") {
            alert(msg);
        }
    })
</script>
</body>
</html>

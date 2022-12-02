<%--
  Created by IntelliJ IDEA.
  User: SuQiZhe
  Date: 2022/11/24
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<h1>忘记密码>>身份验证</h1>
<div class="container">
    <div id="forms" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_center">
                    <form action="/Forget.action" class="jqtransform" enctype="multipart/form-data" onsubmit="return toVaild()" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:set var="user" value="#request.user"/>
                            <%--隐藏信息，不需要更改的--%>
                            <input type="hidden" name="id" value="${user.id}">
                            <tr>
                                <td class="td_right">用户名：</td>
                                <td width="320px">
                                    <%--用户名--%>
                                    <input type="text" name="name" id="name" class="input-text lh30 disabled"
                                           size="40" maxlength="20" value="${user.name}">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">邮箱：</td>
                                <td>
                                    <%--新密码--%>
                                        <input required type="email" name="email" id="email" class="input-text lh30" size="40"
                                               maxlength="20"  value="${user.email}"/>
                                </td>
                            </tr>
                            <input type="text" name="upPass" id="forget" class="input-text lh30"size="40"
                                   maxlength="20" hidden value="true">
                            <tr>
                                <td class="td_right">&nbsp;</td>
                                <td class="">
                                    <input type="submit" name="button" class="btn btn82 btn_save2" value="找回">
                                    <input type="reset" name="button" class="btn btn82 btn_res" value="重置">　
                                    <s:set var="msg" value="#request.msg"/>
                                    <span id="err" style="color: red;text-align: center;"><s:property value="#request.msg"/></span>
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
        var email = $('#email').val()
        if(name.length === 0){
            $('#err').text('用户名不能为空');
            return false;
        }
        if(email.length === 0){
            $('#err').text('邮箱不能为空');
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


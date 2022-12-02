<%--
  Created by IntelliJ IDEA.
  User: SuQiZhe
  Date: 2022/11/20
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/jHsDate.css">
<link rel="stylesheet" id='skin' type="text/css" href="../resources/prompt/skin/qq/ymPrompt.css"/>

<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/prompt/ymPrompt.js"></script>
<script type="text/javascript" src="../resources/js/jHsDate.js"></script>

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
                                <td class="td_right">密码：</td>
                                <td>
                                    <%--密码--%>
                                    <input required type="text" readonly name="password" id="password" class="input-text lh30" size="40"
                                           maxlength="20" value="${user.password}">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">邮箱：</td>
                                <td class="">
                                    <%--邮箱--%>
                                    <input required type="email" name="email" id="email" class="input-text lh30" size="40"
                                           maxlength="20" value="${user.email}"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">手机号：</td>
                                <td>
                                    <%--手机号--%>
                                    <input type="tel" name="phone" id="phone" class="input-text lh30"size="40"
                                           maxlength="20" value="${user.phone}">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">身份证号：</td>
                                <td>
                                    <%--身份证号--%>
                                    <input required type="text" name="idcard" id="idcard" class="input-text lh30" size="40"
                                           maxlength="20" value="${user.idcard}">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">&nbsp;</td>
                                <td class="">
                                    <input type="submit" name="button" class="btn btn82 btn_save2" value="保存">
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
        if ($("#name").val().length === 0){
            $("#err").text('用户名不能为空');
            return false;
        }
        var password = $('#password').val().trim();
        if (password.length === 0) {
            $('#err').text('密码不能为空');
            return false;
        }
        if ($("#email").val().length === 0) {
            $('#err').text('邮箱不能为空');
            return false;
        }
        if ($("#phone").val().length === 0){
            $("#err").text('手机号不能为空');
            return false;
        }
        if ($("#idcard").val().length === 0){
            $("#err").text('身份证号不能为空');
            return false;
        }
        return true;
    }

    $(function () {
        let msg="${requestScope.msg}"
        if (msg.length>0&&msg!=="") {
            alert(msg);
        }
        // 设置日期
        <%--$('#date').jHsDate({--%>
        <%--    inputIsRead: true,--%>
        <%--    defDate: '${film.date}',--%>
        <%--    defIsShow: true,--%>
        <%--    callBack: function () {--%>
        <%--        // console.log($("#birthday").val());--%>
        <%--        $("#user_email").attr("value", $("#date").val())--%>
        <%--        // alert('我是回掉函数')--%>
        <%--    }--%>
        <%--});--%>
    })
</script>
</body>
</html>


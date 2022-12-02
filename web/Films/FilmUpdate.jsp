<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: pin-needle
  Date: 2022/11/18
  Time: 2:12
  To change this template use File | Settings | File Templates.
--%>
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
                    <form action="UpdateFilm.action" class="jqtransform" enctype="multipart/form-data" onsubmit="return toVaild()" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:set var="film" value="#request.film"/>
                            <%--隐藏信息，不需要更改的--%>
                            <input type="hidden" name="id" value="${film.film_id}">
                            <tr>
                                <td class="td_right">电影片名：</td>
                                <td width="320px">
                                    <%--标题--%>
                                    <input type="text" name="title" id="title" class="input-text lh30 disabled"
                                           size="40" maxlength="20" value="${film.name}">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">导演：</td>
                                <td>
                                    <%--姓名--%>
                                    <input required type="text" name="author" id="publisher" class="input-text lh30" size="40"
                                           maxlength="20" value="${film.author}">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">上线时间：</td>
                                <td class="">
                                    <%--生日--%>
                                    <input required type="text" id="date" pattern="yyyy-MM-dd" class="input-text lh30" style="width: 200px;"/>
                                    <input type="text" name="date" id="film_date" value="${film.date}" hidden/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">简介：</td>
                                <td>
                                    <%--备注--%>
                                    <textarea name="other" id="remark" class="textarea"
                                              style="width: 290px;height: 60px">${film.other}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">资源链接：</td>
                                <td>
                                    <%--连接--%>
                                    <input required type="text" name="mp4" id="mp4" class="input-text lh30" size="40"
                                               maxlength="20" value="${film.mp4}">
<%--                                    <a href="${film.mp4}" target="rightFrame">${film.name}</a>--%>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">电影类别：</td>
                                <td>
                                    <%--连接--%>
                                    <input required type="text" name="types" id="types" class="input-text lh30" size="40"
                                           maxlength="20" value="${requestScope.filmtypes}">
                                    <%--                                    <a href="${film.mp4}" target="rightFrame">${film.name}</a>--%>
                                </td>
                            </tr>
                            <td class="td_right">图标：</td>
                            <td>
                                <%--连接--%>
                                <img width="30%" src="${film.ico}" alt="${film.name}图标"/>
                                <input type="text" name="ico" id="ico" value="${film.ico}"/>
                                <%--                                    <a href="${film.mp4}" target="rightFrame">${film.name}</a>--%>
                            </td>
<%--                            <td>--%>
<%--                                <s:file name="upload" label="更改图标"/>--%>
<%--                            </td>--%>
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
        if ($('#title').val().length === 0){
            $('#err').text('标题不能为空');
            return false;
        }
        var author = $('#author').val().trim();
        if (author.length === 0) {
            $('#err').text('发布人不能为空');
            return false;
        }
        // var num = $('#num').val().trim();
        // if (num.length === 0) {
        //     $('#err').text('学号不能为空');
        //     return false;
        // }
        if ($("#date").val().length === 0) {
            $('#err').text('日期不能为空');
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
        $('#date').jHsDate({
            inputIsRead: true,
            defDate: '${film.date}',
            defIsShow: true,
            callBack: function () {
                // console.log($("#birthday").val());
                $("#film_date").attr("value", $("#date").val())
                // alert('我是回掉函数')
            }
        });
    })
</script>
</body>
</html>

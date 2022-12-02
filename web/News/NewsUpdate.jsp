<%--
  Created by IntelliJ IDEA.
  User: pin-needle
  Date: 2022/11/16
  Time: 0:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>编辑信息</title>
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
                    <form action="NewsUpdate.action" class="jqtransform" enctype="multipart/form-data" onsubmit="return toVaild()" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="td_right">id序号</td>
                                <td width="320px">
                                    <s:set var="news" value="#request.news"/>
                                    <%--隐藏信息，不需要更改的--%>
                                    <input type="text" class="input-text lh30" size="40" maxlength="20"
                                           readonly name="id" value="<s:property value="#news.id"/>">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">新闻标题：</td>
                                <td width="320px">
                                    <%--标题--%>
                                    <input type="text" name="title" id="id" class="input-text lh30"
                                           size="40" maxlength="20" value="<s:property value="#news.title"/>">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">发布方：</td>
                                <td>
                                    <%--姓名--%>
                                    <input required type="text" name="publisher" id="publisher" class="input-text lh30" size="40"
                                           maxlength="20" value="${news.publisher}">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">发布日期：</td>
                                <td class="">
                                    <%--生日--%>
                                    <input required type="text" id="date" class="input-text lh30" style="width: 200px;"/>
                                    <input type="text" name="date" id="news_date" value="<s:property value="#news.date"/>" hidden/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">新闻内容：</td>
                                <td>
                                    <%--备注--%>
                                    <textarea name="context" id="remark" class="textarea"
                                              style="width: 290px;height: 60px"><s:property value="#news.context"/></textarea>
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
        var publisher = $('#publisher').val().trim();
        if (publisher.length === 0) {
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
            defDate: '${news.date}',
            defIsShow: true,
            callBack: function () {
                // console.log($("#birthday").val());
                $("#news_date").attr("value", $("#date").val())
                // alert('我是回掉函数')
            }
        });
    })
</script>
</body>
</html>

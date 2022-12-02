<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: pin-needle
  Date: 2022/11/15
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>wangEditor demo</title>
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
<%--<div id="editor—wrapper">--%>
<%--    <s:form id="payForm" action="NewsPublish" target="_blank" method="post" onsubmit="return checkform();">--%>
<%--        <s:textfield name="id" label="id号"/>--%>
<%--        <s:textfield name="title" label="文本标题"/>--%>
<%--        <s:textfield name="publisher" label="发布者"/>--%>
<%--        <s:textfield type="date" name="date" label="日期"/>--%>
<%--        <input hidden="hidden" name="context" id="context"/>--%>
<%--        <input align="right" type="submit" value="发布">--%>
<%--    </s:form>--%>
<%--    文本内容：--%>
<%--    <div id="toolbar-container"><!-- 工具栏 --></div>--%>
<%--    <div id="editor-container"><!-- 编辑器 --></div>--%>


<%--</div>--%>

<div class="container">
    <div id="forms" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_center">
                    <form action="NewsPublish.action" class="jqtransform" enctype="multipart/form-data" onsubmit="return toVaild()" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:set var="news" value="#request.news"/>
                            <%--隐藏信息，不需要更改的--%>
                            <input type="hidden" class="input-text lh30 disabled" name="id" value="<s:property value="#news.id"/>">
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
                                    <input required type="text" id="date" pattern="yyyy-MM-dd" class="input-text lh30" style="width: 200px;"/>
                                    <input type="text" name="date" id="news_date" value="<s:property value="#news.date"/>" hidden/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">新闻内容：</td>
                                <td>
                                    <%--备注--%>
                                    <textarea name="context" id="remark" class="textarea"
                                              style="width: 580px;height: 120px"><s:property value="#news.context"/></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">&nbsp;</td>
                                <td class="">
                                    <input type="submit" width="" name="button" class="btn btn82 btn_save2" value="发布">
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

<%--<script src="/resources/js/editorIndex.js"></script>--%>
<%--<script>--%>
<%--    const { createEditor, createToolbar } = window.wangEditor--%>

<%--    const editorConfig = {--%>
<%--        placeholder: 'Type here...',--%>
<%--        onChange(editor) {--%>
<%--            const html = editor.getHtml()--%>
<%--            console.log('editor content', html)--%>
<%--            document.getElementById("context").value = html;--%>
<%--            // console.log('editor content', document.getElementById("context").value)--%>
<%--            // 也可以同步到 <textarea>--%>
<%--        }--%>
<%--    }--%>

<%--    const editor = createEditor({--%>
<%--        selector: '#editor-container',--%>
<%--        html: '<p><br></p>',--%>
<%--        config: editorConfig,--%>
<%--        mode: 'normal', // or 'simple'--%>
<%--    })--%>

<%--    const toolbarConfig = {}--%>

<%--    const toolbar = createToolbar({--%>
<%--        editor,--%>
<%--        selector: '#toolbar-container',--%>
<%--        config: toolbarConfig,--%>
<%--        mode: 'normal', // or 'simple'--%>
<%--    })--%>

<%--    function checkform(){--%>
<%--        var tmp = editor.getText();--%>
<%--        document.getElementById("context").value = tmp;  // 将JS变量值存储到隐藏控件中--%>
<%--        console.log(document.getElementById("context").value)--%>
<%--        return true;--%>
<%--    }--%>

<%--</script>--%>
</body>
</html>


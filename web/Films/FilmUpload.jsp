<%--
  Created by IntelliJ IDEA.
  User: pin-needle
  Date: 2022/11/15
  Time: 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>简单的文件上传</title>
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
<%--<s:form action="FilmUpload" enctype="multipart/form-data" method="POST" target="_self">--%>
<%--    <s:textfield name="id" label="id号"/><br />--%>
<%--    <s:textfield name="title" label="影片名" /><br />--%>
<%--    <s:textfield name="author" label="作者"/><br />--%>
<%--    <s:textfield type="date" name="date" label="日期"/><br />--%>
<%--    <s:textfield name="ico" label="图标"/><br />--%>
<%--    <s:textfield name="type" label="类别"/><br>--%>
<%--    <s:textfield name="other" label="备注"/><br />--%>
<%--    <s:file name="upload" label="选择文件"/><br />--%>
<%--    <input type="submit" value="上传">--%>
<%--</s:form>--%>

<div class="container">
    <div id="forms" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_center">
                    <form action="FilmUpload.action" class="jqtransform" enctype="multipart/form-data" onsubmit="return toVaild()" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="td_right">影片名：</td>
                                <td width="320px">
                                    <%--标题--%>
                                    <input type="text" name="title" id="title" class="input-text lh30"
                                           size="40" maxlength="20" placeholder="请输入影片名">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">作者：</td>
                                <td>
                                    <%--作者--%>
                                    <input required type="text" name="author" id="author" class="input-text lh30" size="40"
                                           maxlength="20" placeholder="请输入作者">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">日期：</td>
                                <td class="">
                                    <%--日期--%>
                                    <input required type="date" id="date" class="input-text lh30" size="40"
                                           maxlength="20">
                                    <input type="text" name="date" id="film_date" hidden/>
                                </td>
                            </tr>
                            <input type="image" name="ico" id="ico" class="input-text lh30"
                                   size="40" maxlength="20" hidden alt="预览图标">
<%--                            <tr>--%>
<%--                                <td class="td_right">图标：</td>--%>
<%--                                <td>--%>
<%--                                    &lt;%&ndash;图标&ndash;%&gt;--%>
<%--                                    --%>
<%--                                </td>--%>
<%--                            </tr>--%>
                            <tr>
                                <td class="td_right">影视资源：</td>
                                <td><video src="" alt="预览" id="video" controls="controls" width="400" height="200"></video>
                                    <script>
                                        const videoInput = document.getElementById('videoInput');
                                        videoInput.addEventListener('change', e => {
                                            previewByURL(e.target.files[0])
                                        })
                                        function previewByURL (file) {
                                            video.src = URL.createObjectURL(file)
                                        }
                                    </script>
                                    <input type="file" id="videoInput" class="input-text lh30"
                                           size="40" maxlength="20" name="upload">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">类别：</td>
                                <td>
                                    <%--类别--%>
                                    <input type="text" name="type" id="type" class="input-text lh30"
                                           size="40" maxlength="20" >
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">简介：</td>
                                <td>
                                    <%--备注--%>
                                   <textarea name="other" id="other" class="textarea"
                                             style="width: 580px;height: 120px"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">&nbsp;</td>
                                <td class="">
                                    <input type="submit" width="" name="button" class="btn btn82 btn_save2" value="添加">
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
</body>
<script type="text/javascript">
    function toVaild() {
        var title = $('#title').val().trim();
        if (title.length === 0) {
            $('#err').text('标题不能为空');
            return false;
        }
        // var num = $('#num').val().trim();
        // if (num.length === 0) {
        //     $('#err').text('学号不能为空');
        //     return false;
        // }
        if($("#author").val().length ===0 ){
            $('#err').text('作者不能为空');
            return false;
        }
        if ($("#date").val().length === 0) {
            $('#err').text('日期不能为空');
            return false;
        }
        return true;
    }

    $(function () {
        // 设置日期
        $('#date').jHsDate({
            inputIsRead: true,
            defDate: '',
            defIsShow: true,
            callBack: function () {
                // console.log($("#birthday").val());
                $("#film_date").attr("value", $("#date").val())
                // alert('我是回掉函数')
            }
        });
    })
</script>
</html>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: SuQiZhe
  Date: 2022/11/22
  Time: 14:59
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
                    <form action="#" class="jqtransform" enctype="multipart/form-data" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:set var="film" value="#request.film"/>
                            <input type="hidden" name="id" value="${film.film_id}">
                            <tr>
                                <td class="td_center">
                                    <h1 type="text" name="name" id="id" class="input-text lh30 disabled"
                                        size="40" maxlength="20" >${film.name}</h1>
                                    <video src="${film.mp4}" alt="${film.name}" id="video" controls="controls" width="80%" height="80%"></video>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="left: 20%; width: auto;height: auto;position: absolute;">
                                        <h3>导演：${film.author}</h3>
                                        <h3 type="text" name="date" id="film_date">上线时间：${film.date}</h3>
                                    </div>
                                    <div style="left: 60%; width: auto;height: auto;position: absolute;">
                                        <h4>简介：</h4>
                                        <span>${film.other}</span>
                                    </div>
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
</html>

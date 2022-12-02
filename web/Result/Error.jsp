<%--
  Created by IntelliJ IDEA.
  User: pin-needle
  Date: 2022/11/14
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<Meta http-equiv="Refresh" Content="3; Url=Charts.action">
<head>
    <title>Error</title>
    <script language="javascript">
        var nn = 2;
        function num()
        {
            document.getElementById("late").innerHTML = nn;
            nn --;
        }
        function SetNum()
        {
            setInterval("num()",1000);
        }
    </script>
</head>
<body onLoad="SetNum();">
不好意思,暂未找到相关资源...
<span id="late">3</span>秒后<a style="text-decoration: none;color: #77575c;">返回首页</a>
</body>
</html>

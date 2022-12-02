<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: pin-needle
  Date: 2022/11/17
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link rel="stylesheet" href="../resources/css/tablestyle.css">
      <s:set var="types" value="#request.filmTypes"/>
      <form action="#" method="post">
          <table class="mt">
              <tr>
                  <s:if test="#request.typeslen == 0">
                  <td colspan="9" align="center">网络错误</td>
                  </s:if>
              <s:iterator value="#types" var="type" status="row">
                  <td class="type_id">
                          <a href="TypeFilms.action?tid=${type.type_id}" style="text-decoration: none;color: #6495ed;" target="FilmListFrame">${type.category}</a>
                  </td>
              </s:iterator>
              </tr>
          </table>
      </form>
  <script>
      window.onload= function getFilmType(){
          var key="${requestScope.key}"
          if (key==="false") {
              $.ajax({
                  type: "GET",
                  url: '/getAllType.action',
                  dataType: "text",
                  success: function (result) {
                      reload();
                  }
              });
          }
      }


  </script>

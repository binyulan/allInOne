<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="Java, Javascript, Maven"/>
<meta name="description" content="Java 全栈" />
<title>首页</title>
<link type="text/css" rel="stylesheet"
    href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link type="images/x-icon" rel="shortcut icon" href="icon/person.ico" />
</head>

<body style="background-color: #fff;">
    <div id="presentation" class="container-fluid">
      <form action="login" method="post">
          <table>
             <tr>
                <td>用户名：</td>
                <td><input type="text" name="username"/></td>
             </tr>
             <tr>
                <td>密码：</td>
                <td><input type="password" name="password"/></td>
             </tr>
             <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="登录"/>
                    <input type="reset" value="重置"/>
                </td>
             </tr>
          </table>
       </form>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link type="text/css" rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link type="images/x-icon" rel="shortcut icon" href="../icon/person.ico" />
<script type="text/javascript" src="../lib/jquery-3.1.1.min.js"></script>
</head>

<body style="background-color: #fff;">
    <div id="presentation" class="container-fluid">
        <c:forEach items="${tableDefinitions}" var="tableDefinition">
            <div id="tableName">${tableDefinition.description}</div>
            <table>
                <thead>
                    <tr>
                        <c:forEach items="${tableDefinition.columnDefinitions}" var="columnDefinition">
                                <th>${columnDefinition.label}</th>
                        </c:forEach>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            --------------------------------------------------------------------
        </c:forEach>
    </div>
</body>
</html>
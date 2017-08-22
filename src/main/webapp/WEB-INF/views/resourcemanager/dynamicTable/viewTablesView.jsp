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
        <c:forEach items="${dynamicTables}" var="table">
            <div id="tableName">${table.name}</div>
            <a href="deleteTable/${table.id}">删除表</a>
            <a href="addRecordView/${table.id}">添加数据</a>
            <div>
                <form action="queryTable/${table.id}" method="post">
                    <c:forEach items="${table.columns}" var="column">
                        ${column.name}<input type="text" name="queryColumnMap[${column.id}]"><br>
                    </c:forEach>
                    <input type="submit" value="查找">
                </form>
            </div>
            <table>
                <thead>
                    <tr>
                        <c:forEach items="${table.columns}" var="column">
                                <th>${column.name}</th>
                        </c:forEach>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" begin="1" end="${fn:length(table.columns[0].cells)}">
                        <tr>
                            <c:forEach items="${table.columns}" var="column">
                                <td>${column.cells[i-1].value}</td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            --------------------------------------------------------------------
        </c:forEach>
    </div>
</body>
</html>
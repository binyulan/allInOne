<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>添加表定义</title>
<link type="text/css" rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link type="images/x-icon" rel="shortcut icon" href="../icon/person.ico" />
<script type="text/javascript" src="../../lib/jquery-3.1.1.min.js"></script>
</head>

<body style="background-color: #fff;">
    <div id="presentation" class="container-fluid">
        <div class="row">
            ${dynamicTable.name}
            <form class="form-horizontal" action="../addRecord/${dynamicTable.id}" method="post">
                <c:forEach items="${dynamicTable.columns}" var="column">
                    <div class="form-group">
                        <label for="title" class="col-sm-1 control-label">${column.name}</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="values" placeholder="请输入值">
                        </div>
                    </div>
                </c:forEach>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-9">
                        <button type="submit" class="btn btn-default">保存</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
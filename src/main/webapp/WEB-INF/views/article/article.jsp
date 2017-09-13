<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="${article.title}"/>
<meta name="description" content="${article.title}" />
<title>${article.title}</title>
<link href="../lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="../lib/syntaxhighlighter/styles/shCoreDefault.css" />
<link rel="shortcut icon" type="images/x-icon" href="../icon/person.ico" />
<script type="text/javascript" src="../lib/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="../lib/syntaxhighlighter/scripts/shBrushXml.js"></script>
<script type="text/javascript" src="../lib/syntaxhighlighter/scripts/shBrushJava.js"></script>
<script type="text/javascript" src="../lib/syntaxhighlighter/scripts/shBrushJScript.js"></script>
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
</head>
<body style="background-color: #fff">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div>
                <ul class="nav navbar-nav">
                    <li data-id="java" class="active"><a href="../index">Java</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="presentation" class="container-fluid">
        <div id="article">
            <div class="page-header">
                <h1>${article.title}</h1>
            </div>
            ${article.content}
        </div>
        <div id="comments" style="margin-top: 90px">
            <c:forEach items="${article.comments}" var="comment">
                <div class="panel panel-default">
                    <div class="panel-heading">${comment.postDate}</div>
                    <div class="panel-body">${fn:escapeXml(comment.content)}</div>
                </div>
            </c:forEach>
        </div>
        <form>
            <div class="form-group">
                <label for="comment" class="control-label">回复</label>
                <textarea class="form-control" id="comment"
                    name="comment" placeholder="请输入回复内容" rows="10" maxlength="255" ></textarea>
            </div>
            <button type="button" id="addComment" class="btn btn-default">添加回复</button>
        </form>
    </div>
    <script type="text/javascript">
        $("#addComment").bind("click", function() {
            $(".modal").modal('show');
            $.post("comment", {content: $("#comment").val(), articleId: "${article.id}"}, function(data) {
                $(".progress").hide();
                $(".alert-success").show();
                setTimeout(function(){
                    $(".modal").modal('hide');
                    $(".progress").show(1000);
                    $(".alert-success").hide(1000);
                }, 1000);
                $("#comments").prepend(
                        '<div class="panel panel-default">'
                       +    '<div class="panel-heading">now</div>'
                       +    '<div class="panel-body">' + $("#comment").val() + '</div></div>'
                    );
                $("#comment").val("");
            });
        });
    </script>
    <div class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="progress">
                <div class="progress-bar progress-bar-striped active"
                    role="progressbar" aria-valuenow="10"
                    aria-valuemin="0" aria-valuemax="100"
                    style="width: 100%"></div>
            </div>
            <div class="alert alert-success" role="alert" style="display: none;">添加成功</div>
        </div>
    </div>
</body>
</html>
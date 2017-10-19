<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>
    <h1>Title : ${title}</h1>
    <h1>Message : ${message}</h1>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${pageContext.request.userPrincipal.name} | <a
                href="<c:url value="/logout" />"> Logout</a>
            <div>
                <sec:authorize access="hasRole('ADMIN')">
                    <label><a href="#">Edit this page</a> | This
                        part is visible only to ADMIN</label>
                </sec:authorize>
            </div>
        </h2>
    </c:if>
</body>
</html>
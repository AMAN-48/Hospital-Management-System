<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Change Password</title>
    <%@ include file="component/allcss.jsp" %>
    

    <style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>

    <%@ include file="component/navbar.jsp" %>

    <c:if test="${empty userObj}">
        <c:redirect url="user_login.jsp" />
    </c:if>

    <div class="container p-4">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <p class="text-center fs-3">Change Password</p>

                    <c:if test="${not empty succMsg}">
                        <p class="text-center text-success fs-5">${succMsg}</p>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <c:if test="${not empty errorMsg}">
                        <p class="text-center text-danger fs-5">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>

                    <div class="card-body">
                        <form action="userChangePassword" method="post">
                            <div class="mb-3">
                                <label>Enter New Password</label>
                                <input type="password" name="newPassword" class="form-control" required />
                            </div>

                            <div class="mb-3">
                                <label>Enter Old Password</label>
                                <input type="password" name="oldPassword" class="form-control" required />
                            </div>

                            <input type="hidden" name="uid" value="${userObj.id}" />

                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">Change Password</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

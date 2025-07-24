<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.AppointmentDAO" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.db.DBconnect" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Appointment List</title>
    <%@include file="component/allcss.jsp" %>
    
    <style type="text/css">
        .point-card {
            box-shadow: 0 10px 10px 0 rgba(0, 0, 0, 0.3);
        }
        .backImg {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("img/Bg.jpg");
            height: 20vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
</head>
<body>
      <c:if test="${empty userObj }">
        <c:redirect url="user_login.jsp"></c:redirect>
    </c:if>
    <%@include file="component/navbar.jsp" %>

    <div class="container-fluid backImg p-5">
       
    </div>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-9">
                <div class="card point-card">
                    <div class="card-body">
                        <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">Appoint Date</th>
                                    <th scope="col">Diseases</th>
                                    <th scope="col">Doctor Name</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    User user = (User) session.getAttribute("userObj");
                                    if (user == null) {
                                        response.sendRedirect("login.jsp");
                                        return;
                                    }

                                    AppointmentDAO dao = new AppointmentDAO(DBconnect.getConn());
                                    DoctorDao dao2 = new DoctorDao(DBconnect.getConn());
                                    List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());

                                    for (Appointment ap : list) {
                                        Doctor d = dao2.getDoctorById(ap.getDoctorId());
                                %>
                                <tr>
                                    <td><%= ap.getFullName() %></td>
                                    <td><%= ap.getGender() %></td>
                                    <td><%= ap.getAge() %></td>
                                    <td><%= ap.getAppointDate() %></td>
                                    <td><%= ap.getDiseases() %></td>
                                    <td><%= (d != null) ? d.getFullName() : "N/A" %></td>
                                    <td>
                                        <% if ("Pending".equalsIgnoreCase(ap.getStatus())) { %>
                                            <a href="#" class="btn btn-sm btn-warning">Pending</a>
                                        <% } else { %>
                                            <span class="text-success"><%= ap.getStatus() %></span>
                                        <% } %>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-3 p-3">
                <img alt="Doctor Image" src="img/doc13.png" class="img-fluid">
            </div>
        </div>
    </div>
</body>
</html>

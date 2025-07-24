<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Doctor Dashboard</title>

    <%@ include file="../component/allcss.jsp" %>

    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card-body {
            padding: 20px;
        }
        .dashboard-icon {
            font-size: 3rem;
            margin-bottom: 10px;
        }
        .dashboard-text {
            font-size: 1.5rem;
            margin: 0;
        }
    </style>
</head>
<body>


<%
    Doctor d = (Doctor) session.getAttribute("doctor");
    if (d == null) {
        response.sendRedirect("../doctor_login.jsp");
        return;
    }
    DoctorDao dao = new DoctorDao(DBconnect.getConn());
%>

<%@ include file="navbar.jsp" %>

<p class="text-center fs-3">Doctor Dashboard</p>

<div class="container p-5">
    <div class="row">
        <div class="col-md-4 offset-md-2">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-md dashboard-icon"></i>
                    <p class="dashboard-text">
                        Doctor<br><%= dao.countDoctor() %>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-calendar-check dashboard-icon"></i>
                    <p class="dashboard-text">
                        Total Appointments<br><%= dao.countAppointmentByDoctorId(d.getId()) %>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

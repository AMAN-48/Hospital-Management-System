<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.dao.*, com.db.*, com.entity.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Details</title>
    <%@ include file="../component/allcss.jsp" %>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container mt-4">
    <div class="card paint-card">
        <div class="card-body">
            <p class="fs-3 text-center">Patient Details</p>
            <table class="table table-bordered table-striped">
                <thead class="table-dark text-center">
                    <tr>
                        <th scope="col">Full Name</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Age</th>
                        <th scope="col">Appointment</th>
                        <th scope="col">Email</th>
                        <th scope="col">Mob No</th>
                        <th scope="col">Diseases</th>
                        <th scope="col">Doctor Name</th>
                        <th scope="col">Address</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    AppointmentDAO dao = new AppointmentDAO(DBconnect.getConn());
                    DoctorDao dao2 = new DoctorDao(DBconnect.getConn());
                    List<Appointment> list = dao.getAllAppointment();

                    for (Appointment ap : list) {
                        Doctor d = dao2.getDoctorById(ap.getDoctorId());
                %>
                    <tr class="text-center">
                        <td><%= ap.getFullName() %></td>
                        <td><%= ap.getGender() %></td>
                        <td><%= ap.getAge() %></td>
                        <td><%= ap.getAppointDate() %></td>
                        <td><%= ap.getEmail() %></td>
                        <td><%= ap.getPhNo() %></td>
                        <td><%= ap.getDiseases() %></td>
                        <td><%= (d != null) ? d.getFullName() : "N/A" %></td>
                        <td><%= ap.getAddress() %></td>
                        <td><%= ap.getStatus() %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>

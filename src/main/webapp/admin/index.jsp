<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <%@include file="../component/allcss.jsp" %>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<c:if test="${not empty errorMsg}">
    <c:redirect url="../admin_login.jsp" />
</c:if>

<div class="container p-5">
    <p class="text-center fs-3">Admin Dashboard</p>

    <c:if test="${not empty succMsg}">
        <div class="fs-3 text-center text-success">${succMsg}</div>
        <c:remove var="succMsg" scope="session" />
    </c:if>

    <%
        DoctorDao dao = new DoctorDao(DBconnect.getConn());
    %>

    <div class="row">
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-md fa-3x"></i><br>
                    <p class="fs-4 text-center">
                        Doctor <br><%= dao.countDoctor() %>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-circle fa-3x"></i><br>
                    <p class="fs-4 text-center">
                        User <br><%= dao.countUser() %>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-calendar-check fa-3x"></i><br>
                    <p class="fs-4 text-center">
                        Total Appointment <br><%= dao.countAppointment() %>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mt-2">
            <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <div class="card-body text-center text-success">
                    <i class="fas fa-stethoscope fa-3x"></i><br>
                    <p class="fs-4 text-center">
                        Specialist <br><%= dao.countSpecialist() %>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Adding Specialist -->
<div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="../addSpecialist" method="post">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <div class="form-group">
                  <label>Enter Specialist Name</label>
                  <input type="text" name="specName" class="form-control" required>
              </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">Add</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
      </form>
    </div>
  </div>
</div>

</body>
</html>

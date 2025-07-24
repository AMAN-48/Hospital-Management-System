<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.db.DBconnect" %>
<%@ page import="com.entity.Specalist" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Doctor</title>
  <%@include file="../component/allcss.jsp" %>
  <style>
    .paint-card {
      box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    }
  </style>
</head>
<body>
  <%@include file="navbar.jsp" %>

  <div class="container-fluid p-3">
    <div class="row">
      <div class="col-md-4 offset-md-4">
        <div class="card paint-card">
          <div class="card-body">
            <p class="fs-3 text-center">Edit Doctor Details</p>

            <c:if test="${not empty errorMsg}">
              <p class="fs-6 text-center text-danger">${errorMsg}</p>
              <c:remove var="errorMsg" scope="session"/>
            </c:if>

            <c:if test="${not empty succMsg}">
              <div class="fs-6 text-center text-success" role="alert">${succMsg}</div>
              <c:remove var="succMsg" scope="session"/>
            </c:if>

            <%
              int id = Integer.parseInt(request.getParameter("id"));
              DoctorDao dao2 = new DoctorDao(DBconnect.getConn());
              Doctor d = dao2.getDoctorById(id);
            %>

            <form action="../updateDoctor" method="post">
              <input type="hidden" name="id" value="<%= d.getId() %>">

              <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="fullname" class="form-control" required value="<%= d.getFullName() %>">
              </div>

              <div class="mb-3">
                <label class="form-label">DOB</label>
                <input type="date" name="dob" class="form-control" required value="<%= d.getDob() %>">
              </div>

              <div class="mb-3">
                <label class="form-label">Qualification</label>
                <input type="text" name="qualification" class="form-control" required value="<%= d.getQualification() %>">
              </div>

              <div class="mb-3">
                <label class="form-label">Specialist</label>
                <select name="spec" required class="form-control">
                  <option value="<%= d.getSpecialist() %>"><%= d.getSpecialist() %></option>
                  <%
                    SpecialistDao dao = new SpecialistDao(DBconnect.getConn());
                    List<Specalist> list = dao.getAllSpecialist();
                    for (Specalist s : list) {
                      if (!s.getSpecialistName().equals(d.getSpecialist())) {
                  %>
                    <option value="<%= s.getSpecialistName() %>"><%= s.getSpecialistName() %></option>
                  <%
                      }
                    }
                  %>
                </select>
              </div>

              <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required value="<%= d.getEmail() %>">
              </div>

              <div class="mb-3">
                <label class="form-label">Mob No</label>
                <input type="text" name="mobno" class="form-control" required value="<%= d.getMobno() %>">
              </div>

              <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="text" name="password" class="form-control" required value="<%= d.getPassword() %>">
              </div>

              <button type="submit" class="btn btn-primary col-md-12">Update</button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>

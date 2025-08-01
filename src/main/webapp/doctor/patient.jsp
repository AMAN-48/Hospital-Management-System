<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@ page import="java.util.List" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="com.dao.AppointmentDAO" %>
<%@ page import="com.db.DBconnect" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../component/allcss.jsp" %>
<style type="text/css">
.paint-card {
  box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

<c:if test="${empty doctor}">
    <c:redirect url="../doctor_login.jsp"/>
</c:if>

<%@include file="navbar.jsp"%>

<div class="container p-3">
  <div class="row">
    <div class="col-md-12">
      <div class="card paint-card">
        <div class="card-body">
          <p class="fs-3 text-center">Patient Details</p>

          <p class="fs-4 text-center text-danger" id="errorMsg">
            <c:remove var="errorMsg" scope="session" />
          </p>
          <p class="fs-4 text-center text-success" id="succMsg">
            <c:remove var="succMsg" scope="session" />
          </p>

          <c:if test="${not empty errorMsg}">
            <p class="fs-4 text-center text-danger">${errorMsg}</p>
          </c:if>
          <c:if test="${not empty succMsg}">
            <p class="fs-4 text-center text-success">${succMsg}</p>
          </c:if>

          <table class="table">
            <thead>
              <tr>
                <th scope="col">Full Name</th>
                <th scope="col">Gender</th>
                <th scope="col">Age</th>
                <th scope="col">Appointment Date</th>
                <th scope="col">Email</th>
                <th scope="col">Mob No</th>
                <th scope="col">Diseases</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>

<%
    Doctor d = (Doctor) session.getAttribute("doctor");
    AppointmentDAO dao = new AppointmentDAO(DBconnect.getConn());
    List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
    for (Appointment ap : list) {
%>
    <tr>
        <td><%= ap.getFullName() %></td>
        <td><%= ap.getGender() %></td>
        <td><%= ap.getAge() %></td>
        <td><%= ap.getAppointDate() %></td>
        <td><%= ap.getEmail() %></td>
        <td><%= ap.getPhNo() %></td>
        <td><%= ap.getDiseases() %></td>
        <td><%= ap.getStatus() %></td>
        <td>
          <% 
          if("Pending".equals(ap.getStatus()))
          {%>
           <a href="comment.jsp?id=<%=ap.getId() %>" 
        class="btn btn-success btn-sm">Comment</a><%}else{ %>
        
 
          
        	  <a href="#" 
        		        class="btn btn-success btn-sm disabled">Comment</a>
        		        
          <%}
          %>
         
       
        
        </td>
    </tr>
<%
    } // ✅ Correctly close the for loop here
%>

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>

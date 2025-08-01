<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"></i> MEDI HOME</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <!-- IF USER IS NOT LOGGED IN -->
        <c:if test="${empty userObj}">
          <li class="nav-item">
            <a class="nav-link active" href="admin_login.jsp">
              <i class="fa-solid fa-right-to-bracket"></i> ADMIN
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="doctor_login.jsp">DOCTOR</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="user_appointment.jsp">APPOINTMENT</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="user_login.jsp">USER</a>
          </li>
        </c:if>

        <!-- IF USER IS LOGGED IN -->
        <c:if test="${not empty userObj}">
          <li class="nav-item">
            <a class="nav-link active" href="user_appointment.jsp">APPOINTMENT</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="view_appointment.jsp">VIEW APPOINTMENT</a>
          </li>

          <!-- Single dropdown for logged-in user -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button"
              data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fa-solid fa-circle-user"></i> ${userObj.fullName}
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
              <li><a class="dropdown-item" href="userLogout">Logout</a></li>
            </ul>
          </li>
        </c:if>

      </ul>
    </div>
  </div>
</nav>

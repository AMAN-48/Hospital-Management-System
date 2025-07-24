<%@page import="com.entity.Specalist"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <%@include file="../component/allcss.jsp" %>
    <style>
        body {
            background-color: #f0f2f5;
        }
        .card {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: 600;
        }
    </style>
</head>
<body>

<%@include file="navbar.jsp" %>

<div class="container py-5">
    <div class="row justify-content-center g-4">
        <!-- Change Password -->
        <div class="col-md-4">
            <div class="card p-4">
                <h4 class="text-center mb-3">Change Password</h4>

                <c:if test="${not empty succMsg}">
                    <p class="text-success text-center">${succMsg}</p>
                     <c:remove var="succMsg" scope="session" />
                </c:if>
                <c:if test="${not empty errorMsg}">
                    <p class="text-danger text-center">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                </c:if>

                <form action="../doctChangePassword" method="post">
                    <div class="mb-3">
                        <label class="form-label">Enter New Password</label>
                        <input type="password" name="newPassword" class="form-control" placeholder="New Password" required />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Enter Old Password</label>
                        <input type="password" name="oldPassword" class="form-control" placeholder="Old Password" required />
                    </div>
                    
                                        
                    <input type="hidden" name="uid" value="${doctor.id }" name="uid">
                    <button type="submit" class="btn btn-success w-100">Change Password</button>
                </form>
            </div>
        </div>

        <!-- Edit Profile -->
        <div class="col-md-5 offset-md-2">
            <div class="card p-4">
                <h4 class="text-center mb-3">Edit Profile</h4>



                <c:if test="${not empty succMsgd}">
                    <p class="text-success text-center">${succMsgd}</p>
                    <c:remove var="succMsgd" scope="session" />
                </c:if>
                
                <c:if test="${not empty errorMsgd}">
                    <p class="text-danger text-center">${errorMsgd}</p>
                     <c:remove var="errorMsgd" scope="session" />
                </c:if>


                <%
                    Doctor d = (Doctor) session.getAttribute("doctor");
                    if (d == null) {
                        response.sendRedirect("../doctor_login.jsp");
                        return;
                    }
                %>

                <form action="../doctorUpdateProfile" method="post">
                    <input type="hidden" name="id" value="<%= d.getId() %>" />

                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="fullname" class="form-control" placeholder="Enter full name" value="<%= d.getFullName() %>"  required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">DOB</label>
                        <input type="date" name="dob" class="form-control" value="<%= d.getDob() %>" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Qualification</label>
                        <input type="text" name="qualification" class="form-control" placeholder="Your qualification" value="<%= d.getQualification() %>" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Specialist</label>
                        <select name="spec" class="form-control" required>
                            <option value="">--select--</option>
                            <%
                                SpecialistDao dao = new SpecialistDao(DBconnect.getConn());
                                List<Specalist> list = dao.getAllSpecialist();
                                for (Specalist s : list) {
                            %>
                                <option value="<%= s.getSpecialistName() %>" <%= s.getSpecialistName().equals(d.getSpecialist()) ? "selected" : "" %>>
                                    <%= s.getSpecialistName() %>
                                </option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" value="<%= d.getEmail() %>" readonly />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mob No</label>
                        <input type="text" name="mobno" class="form-control" placeholder="Mobile Number" value="<%= d.getMobno() %>" required />
                    </div>
                    
                      <input type="hidden" name="uid" value="${doctor.id }"/>
                  

                    <button type="submit" class="btn btn-primary w-100">Update Profile</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>

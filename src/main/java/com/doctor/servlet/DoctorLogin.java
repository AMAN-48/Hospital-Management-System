package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.dao.DoctorDao;
import com.db.DBconnect;
import com.db.DBconnect;
import com.entity.Doctor;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();
        DoctorDao dao = new DoctorDao(DBconnect.getConn());
        Doctor doctor = dao.login(email, password);

        if (doctor != null) {
            session.setAttribute("doctor", doctor);
            resp.sendRedirect("doctor/index.jsp");
        } else {
            session.setAttribute("errorMsg", "Invalid email & password");
            resp.sendRedirect("doctor_login.jsp");
        }
    }
}
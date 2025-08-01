package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBconnect;
import com.entity.Doctor;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fullName = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String spec = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");
            String password = req.getParameter("password");
            String idStr = req.getParameter("id");

            DoctorDao dao = new DoctorDao(DBconnect.getConn());
            HttpSession session = req.getSession();

            // If 'id' is present, update doctor
            if (idStr != null && !idStr.trim().equals("")) {
                int id = Integer.parseInt(idStr);
                Doctor d = new Doctor(id, fullName, dob, qualification, spec, email, mobno, password);

                if (dao.updateDoctor(d)) {
                    session.setAttribute("succMsg", "Doctor updated successfully.");
                    resp.sendRedirect("admin/doctor.jsp");
                } else {
                    session.setAttribute("errorMsg", "Something went wrong during update.");
                    resp.sendRedirect("admin/edit_doctor.jsp?id=" + id);
                }

            } else {
                // Add new doctor
                Doctor d = new Doctor(fullName, dob, qualification, spec, email, mobno, password);
                if (dao.registerDoctor(d)) {
                    session.setAttribute("succMsg", "Doctor added successfully.");
                    resp.sendRedirect("admin/doctor.jsp");
                } else {
                    session.setAttribute("errorMsg", "Something went wrong while adding doctor.");
                    resp.sendRedirect("admin/add_doctor.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "Exception: " + e.getMessage());
            resp.sendRedirect("admin/doctor.jsp");
        }
    }
}

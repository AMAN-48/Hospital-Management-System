package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBconnect;

@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        
        try {
            int uid = Integer.parseInt(req.getParameter("uid"));
            String oldPassword = req.getParameter("oldPassword");
            String newPassword = req.getParameter("newPassword");

            DoctorDao dao = new DoctorDao(DBconnect.getConn());
            HttpSession session = req.getSession();

            if (dao.checkOldPassword(uid, oldPassword)) {

                if (dao.changePassword(uid, newPassword)) {
                    session.setAttribute("succMsg", "Password Change Successfully");
                    resp.sendRedirect("doctor/edit_profile.jsp");
                } else {
                    session.setAttribute("errorMsg", "Something wrong on server");
                    resp.sendRedirect("doctor/edit_profile.jsp");
                }

            } else {
                session.setAttribute("errorMsg", "Old Password Incorrect");
                resp.sendRedirect("doctor/edit_profile.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "Exception occurred");
            resp.sendRedirect("doctor/edit_profile.jsp");
        }
    }
}
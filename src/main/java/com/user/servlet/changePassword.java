package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.db.DBconnect;

@WebServlet("/userChangePassword")
public class changePassword extends HttpServlet {
    private static final long serialVersionUID = 1L; // Fixes Eclipse warning

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        try {
            int uid = Integer.parseInt(req.getParameter("uid"));
            String oldPassword = req.getParameter("oldPassword");
            String newPassword = req.getParameter("newPassword");

            UserDao dao = new UserDao(DBconnect.getConn());

            if (dao.checkOldPassword(uid, oldPassword)) {
                if (dao.changePassword(uid, newPassword)) {
                    session.setAttribute("succMsg", "Password changed successfully.");
                } else {
                    session.setAttribute("errorMsg", "Server error. Please try again.");
                }
            } else {
                session.setAttribute("errorMsg", "Incorrect old password.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMsg", "Something went wrong.");
        }

        // Always redirect to the correct JSP name (file must be: change_password.jsp)
        resp.sendRedirect("change_password.jsp");
    }
}

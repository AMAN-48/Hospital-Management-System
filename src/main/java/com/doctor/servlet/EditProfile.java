package com.doctor.servlet;

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

@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  try {
	            String fullName = req.getParameter("fullname");
	            String dob = req.getParameter("dob");
	            String qualification = req.getParameter("qualification");
	            String spec = req.getParameter("spec");
	            String email = req.getParameter("email");
	            String mobno = req.getParameter("mobno");
	           

	            int id=Integer.parseInt(req.getParameter("id"));
	            
	            Doctor d = new Doctor(id,fullName, dob, qualification, spec, email, mobno,"");

	            DoctorDao dao = new DoctorDao(DBconnect.getConn());
	            HttpSession session = req.getSession();

	            if (dao.editDoctorProfile(d)) {
	            	Doctor updateDoctor=dao.getDoctorById(id);
	            	
	                session.setAttribute("succMsgd", "Doctor updated Successfully..");
	                session.setAttribute("doctor",updateDoctor);
	                resp.sendRedirect("doctor/edit_profile.jsp");
	            } else {
	                session.setAttribute("errorMsg", "Something went wrong on server");
	                resp.sendRedirect("doctor/edit_profile.jsp");
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            req.getSession().setAttribute("errorMsgd", "Exception: " + e.getMessage());
                resp.sendRedirect("doctor/edit_profile.jsp");
	        }
	    
		
	}

}
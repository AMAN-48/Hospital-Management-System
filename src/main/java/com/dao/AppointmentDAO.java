package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDAO {
    private Connection conn;

    public AppointmentDAO(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addAppointment(Appointment ap) {
        boolean f = false;

        try {
            String sql = "INSERT INTO appointment(user_id, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, status) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ap.getUserId());
            ps.setString(2, ap.getFullName());
            ps.setString(3, ap.getGender());
            ps.setString(4, ap.getAge());
            ps.setString(5, ap.getAppointDate());
            ps.setString(6, ap.getEmail());
            ps.setString(7, ap.getPhNo());
            ps.setString(8, ap.getDiseases());
            ps.setInt(9, ap.getDoctorId());
            ps.setString(10, ap.getAddress());
            ps.setString(11, ap.getStatus());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
//    public Appointment getAppointmentById(int Id) {
//
//        Appointment ap = null;
//
//        try {
//            String sql = "select * from appointment where doctor_id=?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, Id);
//            ResultSet rs = ps.executeQuery();
//            while(rs.next()) {
//                ap = new Appointment();
//                ap.setId(rs.getInt(1));
//                ap.setUserId(rs.getInt(2));
//                ap.setFullName(rs.getString(3));
//                ap.setGender(rs.getString(4));
//                ap.setAge(rs.getString(5));
//                ap.setAppointDate(rs.getString(6));
//                ap.setEmail(rs.getString(7));
//                ap.setPhNo(rs.getString(8));
//                ap.setDiseases(rs.getString(9));
//                ap.setDoctorId(rs.getInt(10));
//                ap.setAddress(rs.getString(11));
//                ap.setStatus(rs.getString(12));
//                
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return ap;
//    }
    
    public Appointment getAppointmentById(int id) {
        Appointment ap = null;
        try {
            String sql = "SELECT * FROM appointment WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ap = new Appointment();
                ap.setId(rs.getInt(1));
                ap.setUserId(rs.getInt(2));
                ap.setFullName(rs.getString(3));
                ap.setGender(rs.getString(4));
                ap.setAge(rs.getString(5));
                ap.setAppointDate(rs.getString(6));
                ap.setEmail(rs.getString(7));
                ap.setPhNo(rs.getString(8));
                ap.setDiseases(rs.getString(9));
                ap.setDoctorId(rs.getInt(10));
                ap.setAddress(rs.getString(11));
                ap.setStatus(rs.getString(12));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ap;
    }

//    
    
    //for view appointment
    public List<Appointment> getAllAppointmentByLoginUser(int userId) {
        List<Appointment> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM appointment WHERE user_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Appointment ap = new Appointment();
                ap.setId(rs.getInt(1));
                ap.setUserId(rs.getInt(2));
                ap.setFullName(rs.getString(3));
                ap.setGender(rs.getString(4));
                ap.setAge(rs.getString(5));
                ap.setAppointDate(rs.getString(6));
                ap.setEmail(rs.getString(7));
                ap.setPhNo(rs.getString(8));
                ap.setDiseases(rs.getString(9));
                ap.setDoctorId(rs.getInt(10));
                ap.setAddress(rs.getString(11));
                ap.setStatus(rs.getString(12));
                list.add(ap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    
    
   // for other 
    public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId) {
        List<Appointment> list = new ArrayList<Appointment>();
        Appointment ap = null;

        try {
            String sql = "select * from appointment where doctor_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ap = new Appointment();
                ap.setId(rs.getInt(1));
                ap.setUserId(rs.getInt(2));
                ap.setFullName(rs.getString(3));
                ap.setGender(rs.getString(4));
                ap.setAge(rs.getString(5));
                ap.setAppointDate(rs.getString(6));
                ap.setEmail(rs.getString(7));
                ap.setPhNo(rs.getString(8));
                ap.setDiseases(rs.getString(9));
                ap.setDoctorId(rs.getInt(10));
                ap.setAddress(rs.getString(11));
                ap.setStatus(rs.getString(12));
                list.add(ap);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean updateCommentStatus(int id, int doctId, String comm) {
        boolean f = false;
        try {
            String sql = "update appointment set status=? where id=? and doctor_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, comm);
            ps.setInt(2, id);
            ps.setInt(3, doctId);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    public List<Appointment> getAllAppointment() {
        List<Appointment> list = new ArrayList<Appointment>();
        Appointment ap = null;

        try {
            String sql = "select * from appointment order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ap = new Appointment();
                ap.setId(rs.getInt(1));
                ap.setUserId(rs.getInt(2));
                ap.setFullName(rs.getString(3));
                ap.setGender(rs.getString(4));
                ap.setAge(rs.getString(5));
                ap.setAppointDate(rs.getString(6));
                ap.setEmail(rs.getString(7));
                ap.setPhNo(rs.getString(8));
                ap.setDiseases(rs.getString(9));
                ap.setDoctorId(rs.getInt(10));
                ap.setAddress(rs.getString(11));
                ap.setStatus(rs.getString(12));
                list.add(ap);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

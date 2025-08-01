package com.entity;

public class Doctor {

    private int id;
    private String fullName;
    private String dob;
    private String qualification;
    private String specialist;
    private String email;
    private String mobNo;
    private String password;

    // Default constructor
    public Doctor() {
        super();
    }

    // ✅ Corrected parameterized constructor
    public Doctor(String fullName, String dob, String qualification, String specialist, String email, String mobNo, String password) {
        this.fullName = fullName;
        this.dob = dob;
        this.qualification = qualification;
        this.specialist = specialist;
        this.email = email;
        this.mobNo = mobNo;
        this.password = password;
    }
    
    

    public Doctor(int id, String fullName, String dob, String qualification, String specialist, String email,
			String mobNo, String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.dob = dob;
		this.qualification = qualification;
		this.specialist = specialist;
		this.email = email;
		this.mobNo = mobNo;
		this.password = password;
	}

	// Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getSpecialist() {
        return specialist;
    }

    public void setSpecialist(String specialist) {
        this.specialist = specialist;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobno() {
        return mobNo;
    }

    public void setMobno(String mobno) {
        this.mobNo = mobno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

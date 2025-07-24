<%@page import="com.db.DBconnect" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>











<%@ include file="component/allcss.jsp" %>

<style type="text/css">

.paint-card {
  box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);

}



</style>
</head>
<body>

<%@include file="component/navbar.jsp" %>



<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/MainPage.png" class="d-block w-100" alt="..."height="500px">
    </div>
    
    <div class="carousel-item">   
      <img src="img/doc-1.jpg" class="d-block w-100" alt="..."height="500px">
    </div>
    
    <div class="carousel-item">
      <img src="img/doc-2.jpg" class="d-block w-100" alt="..."height="500px">
     
    </div>
    
    <div class="carousel-item">   
      <img src="img/doc-3.jpg" class="d-block w-100" alt="..." height="500px">
      </div>
    
    <div class="carousel-item">   
      <img src="img/doc-4.jpg" class="d-block w-100" alt="..."height="500px">
      </div>
    
    <div class="carousel-item">   
      <img src="img/doc-5.jpg" class="d-block w-100" alt="..."height="500px">
    </div>
    
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

 

<div class="container p-3">
    <p class="text-center fs-2">Key Features of our Hospital</p>
    <div class="row">
        <!-- Left Column (Cards) -->
        <div class="col-md-8 p-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5">100% Safety</p>
                            <p>Our Hospital Management System uses end-to-end encryption and secure authentication to ensure patient data remains fully protected.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5">Clean Environment</p>
                            <p>Our Hospital Management System operates in a clean, hygienic, and digitally sanitized environment to ensure optimal safety.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-2">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5">Friendly Doctors</p>
                            <p>Our doctors always greet patients with a warm smile and a caring attitude.They listen patiently, explain things clearly, and treat everyone like family</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-2">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5">Medical Research</p>
                            <p>Our hospital is actively involved in cutting-edge medical research to discover better treatments and cures.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Right Column (Image) -->
        <div class="col-md-4">
            <img alt="" src="img/doc14.png" class="img-fluid" />
        </div>
    </div>
</div>

<hr>

<div class="container p-2">
    <p class="text-center fs-2">Our Team</p>
    <div class="row">
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc1.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Samunal Simi</p>
                    <p class="fs-7">(CEO & Chairman)</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc2.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Gerty Cori</p>
                    <p class="fs-7">(Hematologists)</p>
                </div>
            </div>
        </div>
        
          <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc3.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Gro Harlem</p>
                    <p class="fs-7">(Orthopedic)</p>
                </div>
            </div>
        </div>
        
          <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc4.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Edward Jenner</p>
                    <p class="fs-7">(Consultant)</p>
                </div>
            </div>
        </div>
        
          <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc5.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. June Almeida</p>
                    <p class="fs-7">(virologist)</p>
                </div>
            </div>
        </div>
        
          <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc6.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Paul Farmer</p>
                    <p class="fs-7">(neurologist)</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc7.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Jonas Salk</p>
                    <p class="fs-7">(WHO Director- General)</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc8.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Albert Schweitzer</p>
                    <p class="fs-7">(Biochemist)</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc9.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Fiona Wood</p>
                    <p class="fs-7">(anthropologist)</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc10.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Denis</p>
                    <p class="fs-7">(Cardic surgeon)</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc11.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Rita Levi</p>
                    <p class="fs-7">(immunologist)</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc12.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Atul Gawande</p>
                    <p class="fs-7">(gyneocologist)</p>
                </div>
            </div>
        </div>
        
        
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc13.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. June Matheu</p>
                    <p class="fs-7">(Plastic surgeon)</p>
                </div>
            </div>
        </div>
        
        
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc15.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Mary </p>
                    <p class="fs-7">( cardiologist)</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doc14.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Christian Barnard</p>
                    <p class="fs-7">(chief Physician)</p>
                </div>
            </div>
        </div>
           </div>
</div>
       
        
  
       
           
 







<%@include file="component/footer.jsp" %>
	
</body>
</html>
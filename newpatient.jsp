<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Create New Patient</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    * {
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    body {
      background-color: #e1f5fe;
      margin: 0;
      padding: 0;
    }
    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #2ba5d8;
      padding: 0px 40px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        position: sticky;
  top: 0;
  z-index: 1000;
    }

    .logo {
      margin-left: 5%;
    }

    .nav-links {
      list-style: none;
      display: flex;
      gap: 30px;
    }

    .nav-links li {
      display: inline;
      margin-top: 1.5%;
    }

    .nav-links a {
      text-decoration: none;
      color: white;
      font-size: 16px;
      font-weight: 500;
      padding-bottom: 4px;
      transition: border-bottom 0.3s;
    }

    .nav-links a:hover,
    .nav-links a.active {
      border-bottom: 2px solid white;
    }
    .nav-links a {
  position: relative;
}
.nav-links a::after {
  content: '';
  position: absolute;
  left: 0;
  bottom: -2px;
  width: 0%;
  height: 2px;
  background: white;
  transition: 0.3s ease;
}
.nav-links a:hover::after {
  width: 100%;
}
    .container {
      max-width: 600px;
      margin: 50px auto;
      background: #fff;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
      color: #0288d1;
    }
    label {
      display: block;
      margin-top: 15px;
      color: #333;
    }
    input, select, textarea {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    .button {
      margin-top: 20px;
      background-color: #0288d1;
      color: white;
      padding: 10px;
      border: none;
      width: 100%;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
    }
    .button:hover {
      background-color: #0277bd;
    }
    .error {
      color: red;
      font-size: 14px;
    }
    @media (max-width: 600px) {
      .container {
        margin: 20px;
        padding: 20px;
      }
    }
    /* Medium devices (tablets, 768px and below) */
@media (max-width: 768px) {
  .navbar {
    flex-wrap: wrap;
    padding: 10px 20px;
    justify-content: center; /* Center nav items */
  }

  .logo {
    margin: 0 0 10px 0;
    flex-basis: 100%;
    text-align: center;
  }

  .nav-links {
    width: 100%;
    justify-content: center;
    gap: 15px;
    flex-wrap: wrap;
  }

  .nav-links li {
    margin-top: 10px;
  }

  .nav-links a {
    font-size: 14px;
  }

  .container {
    margin: 20px 15px;
    padding: 20px;
  }

  input, textarea, select {
    padding: 8px;
  }

  .button {
    font-size: 14px;
    padding: 10px;
  }
}

/* Small devices (phones, 400px and below) */
@media (max-width: 400px) {
  .navbar {
    flex-direction: column;
    align-items: center;
  }

  .logo {
    margin-bottom: 10px;
  }

  .nav-links {
    flex-direction: column;
    gap: 8px;
  }

  .nav-links li, .nav-links a {
    width: 100%;
    text-align: center;
  }

  input, textarea, select {
    padding: 6px;
  }

  .button {
    font-size: 13px;
    padding: 8px;
  }
}
    
  </style>
</head>
<body>
    <nav class="navbar">
    <div class="logo">
      <img src="logo2.png" height="100">
    </div>
    <ul class="nav-links">
      <li><a href="drHome.html">Home</a></li>
      <li><a href="newpatient.jsp" class="active">New Patient</a></li>
      <li><a href="createprescription.html">Create Prescription</a></li>
      <li><a href="patientdetails.jsp">View Patient</a></li>
      <li><a href="appointmentdetails.jsp">Today's Appointments</a></li>
      <a href="index.html"><button type="button" class="btn btn-light" >Logout</button></a>
    </ul>
  </nav>
    <div class="container">
    <h2>Create New Patient</h2>
    <form id="patientForm" action="patientdetails.jsp">
    	<label>Patient id: *</label>
      <input type="text" id="id" name="id" required />
      <label>Full Name *</label>
      <input type="text" id="fullname" name="name" required />

      <label>Gender *</label>
      <select id="gender" name="gender" required>
        <option value="">--Select Gender--</option>
        <option>Male</option>
        <option>Female</option>
        <option>Other</option>
      </select>

      <label>Disease *</label>
      <input type="text" id="Disease" name="disease" required />

	  <label>Treatment by *</label>
      <input type="text" id="Disease" name="treatmentby" placeholder="doctor name" required />
      
      <label>Age *</label>
      <input type="number" id="age" name="age" required/>
      
      <label>Mobile Number *</label>
      <input type="tel" id="mobile" pattern="[0-9]{10}" name="mob" placeholder="10-digit mobile number" required />

      <label>Email</label>
      <input type="email" id="email" name="email" placeholder="example@example.com"/>

      <label>Address *</label>
      <textarea id="address" rows="3" name="address" required></textarea>

      <div class="error" id="errorMsg"></div>

      <button class="button">Create Patient</button>
    </form>
  </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

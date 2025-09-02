<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Today's Appointments</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
      background-color: #e1f5fe;
      font-family: Arial, sans-serif;
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
    .page-header {
      background-color: white;
      padding: 20px;
      margin: 20px;
      border-radius: 10px;
      box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
    }
    .page-header h2 {
      color: #2ba5d8;
      margin: 0;
      font-weight: bold;
    }
    table {
      background: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
    }
    th {
      background-color: #2ba5d8;
      color: white;
      text-align: center;
    }
    td {
      text-align: center;
      vertical-align: middle;
    }
    .search-bar {
      margin: 20px;
      display: flex;
      justify-content: flex-end;
    }
    .search-bar input {
      width: 250px;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    
</style>
</head>
<body>

<!-- Navbar -->
    <nav class="navbar">
    <div class="logo">
      <img src="logo2.png" height="100">
    </div>
    <ul class="nav-links">
      <li><a href="drHome.html">Home</a></li>
      <li><a href="newpatient.jsp">New Patient</a></li>
      <li><a href="newpatient.jsp">Create Prescription</a></li>
      <li><a href="patientdetails.jsp">View Patient</a></li>
      <li><a href="appointmentdetails.jsp"class="active">Today's Appointments</a></li>
      <a href="Home.html"><button type="button" class="btn btn-light" >Logout</button></a>    
     	</ul>
  </nav>

<!-- Page Header -->
<div class="page-header">
    <h2 style="text-align: center;">Today's Appointments</h2>
</div>

<!-- Appointment Table -->
<div class="container">
<table class="table table-bordered">
<thead>
  <tr>
    <th>Full Name</th>
    <th>Phone Number</th>
    <th>Email Address</th>
    <th>Department</th>
    <th>Doctor Name</th>
    <th>Appointment Date</th>
    <th>Appointment Time</th>
  </tr>
</thead>
<tbody>
<%
LocalDate today = LocalDate.now(); // Today's date
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital", 
        "root", 
        "uday" 
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT fullname, phone, email, department, doctor, appointment_date, appointment_time " +
        "FROM appointments WHERE appointment_date = ?"
    );
    ps.setString(1, today.toString());
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
%>
  <tr>
    <td><%= rs.getString("fullname") %></td>
    <td><%= rs.getString("phone") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("department") %></td>
    <td><%= rs.getString("doctor") %></td>
    <td><%= rs.getDate("appointment_date") %></td>
    <td><%= rs.getString("appointment_time") %></td>
  </tr>
<%
    }

    rs.close();
    ps.close();
    con.close();
} catch(Exception e) {
    out.println("<tr><td colspan='7' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
}
%>
</tbody>
</table>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View patient</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      background: #e1f5fe;
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

    .search-container {
      padding: 20px;
      text-align: center;
    }

    .search-container input {
      padding: 10px;
      width: 50%;
      border-radius: 10px;
      border: 1px solid #ccc;
    }

    .patient-list {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 0 20px;
    }

    .patient-card {
      background: white;
      width: 60%;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 15px 25px;
      margin: 10px 0;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s ease;
    }

    .patient-card:hover {
      transform: scale(1.02);
    }

    .patient-details {
      display: flex;
      flex-direction: column;
    }

    .patient-name {
      font-size: 18px;
      font-weight: 600;
    }

    .patient-id {
      font-size: 14px;
      color: #666;
    }
    .table-container {
      margin-left: 5% !important;
      margin-right: 5% !important;
      overflow-x: auto;
    }
    .table {
      background-color: white;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      margin-top: 30px;
      width: 100%;
      border-collapse: collapse;
    }

    .table thead {
      background-color: #2ba5d8;
      color: white;
      font-size: 16px;
    }

    .table th,
    .table td {
      vertical-align: middle;
      padding: 12px;
      border: 1px solid #ddd;
    }

    .table-hover tbody tr:hover {
      background-color: #e0f7fa;
      transform: scale(1.01);
      transition: all 0.2s ease;
    }

    .table td a {
      color: #0288d1;
      font-size: 18px;
      transition: color 0.2s ease;
    }

    .table td a:hover {
      color: #01579b;
    }

    /* Icon styling */
    .table i.fa-solid {
      cursor: pointer;
    }

    .center-text {
      text-align: center;
    }


    /* Responsive Styles */
    @media (max-width: 768px) {
      .navbar {
        flex-wrap: wrap;
        padding: 10px 20px;
        justify-content: center;
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
      .table-container {
        margin-left: 2% !important;
        margin-right: 2% !important;
        overflow-x: auto;
      }
      .table {
        min-width: 700px; /* for horizontal scroll */
      }
    }

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
        width: 100%;
      }
      .nav-links li,
      .nav-links a {
        width: 100%;
        text-align: center;
      }
      .nav-links a {
        font-size: 13px;
      }
      .table-container {
        margin-left: 1% !important;
        margin-right: 1% !important;
        overflow-x: auto;
      }
      .table {
        min-width: 600px;
      }

      /* Responsive Table: stack rows */
      .table thead {
        display: none;
      }
      .table, .table tbody, .table tr, .table td {
        display: block;
        width: 100%;
      }
      .table tr {
        margin-bottom: 15px;
        border-bottom: 2px solid #2ba5d8;
      }
      .table td {
        text-align: right;
        padding-left: 50%;
        position: relative;
        border: none;
        border-bottom: 1px solid #eee;
      }
      .table td::before {
        content: attr(data-label);
        position: absolute;
        left: 15px;
        width: 45%;
        padding-left: 10px;
        font-weight: 600;
        text-align: left;
        color: #2ba5d8;
      }
      .table td a {
        font-size: 20px;
        text-align: right;
        padding-left: 0;
        position: static;
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
      <li><a href="newpatient.jsp">New Patient</a></li>
      <li><a href="createprescription.html">Create Prescription</a></li>
      <li><a href="patientdetails.jsp" class="active">View Patient</a></li>
      <li><a href="appointmentdetails.jsp">Today's Appointments</a></li>      
      <a href="index.html"><button type="button" class="btn btn-light" >Logout</button></a>
    </ul>
  </nav>
<div class="page-header">
    <h2 style="text-align: center;">View Patients</h2>
</div>

  <div class="patient-list" id="patientList">
  </div>
<%@ page import="java.sql.*" %>

<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String disease=request.getParameter("disease");
String age=request.getParameter("age");
String mob=request.getParameter("mob");
String email=request.getParameter("email");
String address=request.getParameter("address");
String treatmentby=request.getParameter("treatmentby");


if(id!=null && name!=null && gender!=null && disease!=null && age!=null && mob!=null && email!=null && address!=null && !address.trim().isEmpty() && !name.trim().isEmpty() && !gender.trim().isEmpty() && !disease.trim().isEmpty() && !age.trim().isEmpty() && !mob.trim().isEmpty() && !email.trim().isEmpty() && !address.trim().isEmpty())
{
	ResultSet re=null;
	Connection con=null;
	PreparedStatement ps=null;
	String query="insert into patient(id,name,gender,disease,age,mob,email,address,treatmentby) values(?,?,?,?,?,?,?,?,?)";
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/viewpatient", "root", "uday");
		ps=con.prepareStatement(query);
		ps.setString(1,id);
		ps.setString(2,name);
		ps.setString(3,gender);
		ps.setString(4,disease);
		ps.setString(5,age);
		ps.setString(6,mob);
		ps.setString(7,email);
		ps.setString(8,address);
		ps.setString(9,treatmentby);
		int i=ps.executeUpdate();
	}
	catch(Exception e)
	{
		out.println("<h3 style='color:red;'> Error:" +e.getMessage()+ "</h3>");
	}
	finally
	{
		try{ if (ps!=null) ps.close();} catch(Exception e){}
		try{ if (con!=null) con.close();} catch(Exception e){}
	}
}
%>
<div class="table-container">
<table class="table table-hover text-center">
<thead>
	<tr align="center">
		<th>Patient id:</th>
		<th>Patient name:</th>
		<th>Patient gender:</th>
		<th>Patient disease:</th>
		<th>Patient age:</th>
		<th>Patient mob:</th>
		<th>Patient email:</th>
		<th>Patient address:</th>
		<th>Treatment by:</th>
		<th>Update record</th>
		<th>Delete record</th>
	</tr>
</thead>	
<tbody>

<%
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/viewpatient", "root", "uday");
		Statement st=con.createStatement();
    	ResultSet set=st.executeQuery("SELECT * FROM patient");
    	while(set.next()) {
%>    	
        <tr align="center">
            <td data-label="Patient id:"><%=set.getString("id") %></td>
            <td data-label="Patient name:"><%=set.getString("name") %></td>
            <td data-label="Patient gender:"><%=set.getString("gender") %></td>
            <td data-label="Patient disease:"><%=set.getString("disease") %></td>
            <td data-label="Patient age:"><%=set.getString("age") %></td>
            <td data-label="Patient mob:"><%=set.getString("mob") %></td>
            <td data-label="Patient email:"><%=set.getString("email") %></td>
            <td data-label="Patient address:"><%=set.getString("address") %></td>
            <td data-label="Patient treatmentby:"><%=set.getString("treatmentby") %></td>
            <td data-label="Update record">
                <a href='update.jsp?id=<%=set.getString("id") %>'><i class="fa-solid fa-pen"></i></a>
            </td>
            <td data-label="Delete record">
                <a href='delete.jsp?id=<%=set.getString("id") %>'><i class="fa-solid fa-trash"></i></a>
            </td>
        </tr>
<%
    	}
    	set.close();
		st.close();
		con.close();
    }
    catch(Exception e) {
		System.out.println(e);
    }
%>

</tbody>
</table>
</div>
</body>
</html>

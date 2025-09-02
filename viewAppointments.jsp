<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hospital", "root", "uday");

// Get today's appointments
PreparedStatement pst = con.prepareStatement(
    "SELECT * FROM appointments WHERE DATE(appointment_date) = CURDATE()");

ResultSet rs = pst.executeQuery();
%>

<h2>Today's Appointments</h2>
<table border="1">
<tr>
    <th>ID</th>
    <th>Patient Name</th>
    <th>Contact</th>
    <th>Date</th>
    <th>Time</th>
    <th>Doctor Username</th>
</tr>
<%
while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("patient_name") %></td>
    <td><%= rs.getString("patient_contact") %></td>
    <td><%= rs.getDate("appointment_date") %></td>
    <td><%= rs.getTime("appointment_time") %></td>
    <td><%= rs.getString("doctor_username") %></td>
</tr>
<%
}
con.close();
%>
</table>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
    String message = "";
    String id = request.getParameter("id"); 
    String name = "";
    String gender ="";
    String disease="";
    String age = "";
    String mob ="";
    String email="";
    String address="";


    String jdbcURL = "jdbc:mysql://localhost:3306/viewpatient";
    String dbUser = "root";
    String dbPassword = "uday";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
       
        Class.forName("com.mysql.cj.jdbc.Driver");

       
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        
        if (id != null) {
            String fetchQuery = "SELECT * FROM patient WHERE id=?";
            pstmt = conn.prepareStatement(fetchQuery);
            pstmt.setInt(1, Integer.parseInt(id));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                gender = rs.getString("gender");
                disease = rs.getString("disease");
                age = rs.getString("age");
                mob = rs.getString("mob");
                email = rs.getString("email");
                address = rs.getString("address");
            }
            rs.close();
            pstmt.close();
        }

        
        if (request.getParameter("update") != null) {
           
            name = request.getParameter("name");
            gender = request.getParameter("gender");
            disease = request.getParameter("disease");
            age = request.getParameter("age");
            mob = request.getParameter("mob");
            email = request.getParameter("email");
            address = request.getParameter("address");
            String updateQuery = "UPDATE patient SET name=?,gender=?,disease=?,age=?,mob=?,email=?,address=? WHERE id=?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, name);
            pstmt.setString(2, gender);
            pstmt.setString(3,disease);
            pstmt.setString(4,age);
            pstmt.setString(5,mob);
            pstmt.setString(6,email);
            pstmt.setString(7,address);
            pstmt.setString(8, id); 

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
            	response.sendRedirect("patientdetails.jsp");
            	return;
            } else {
                message = "<div class='alert alert-danger'>Update Failed! patient not found.</div>";
            }
        }
    } catch (Exception e) {
        message = "<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>";
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (Exception ignored) {}
        try { if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
%>


<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card" style="width: 25rem;">
        <div class="card-header text-center"><h4>Update Form</h4></div>
        <div class="container">
            <%= message %>
            <form action="update.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" value="<%= name %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">gender</label>
                    <input type="text" name="gender" class="form-control" value="<%= gender %>" >
                </div>
                <div class="mb-3">
                    <label class="form-label">disease</label>
                    <input type="text" name="disease" class="form-control" value="<%= disease %>" >
                </div>
                <div class="mb-3">
                    <label class="form-label">Age</label>
                    <input type="text" name="age" class="form-control" value="<%= age %>" >
                </div>
                <div class="mb-3">
                    <label class="form-label">mobile no</label>
                    <input type="text" name="mob" class="form-control" value="<%= mob %>" >
                </div>
                <div class="mb-3">
                    <label class="form-label">email:</label>
                    <input type="text" name="email" class="form-control" value="<%= email %>" >
                </div>
                <div class="mb-3">
                    <label class="form-label">address</label>
                    <input type="text" name="address" class="form-control" value="<%= address %>" >
                </div>
                <button type="submit" name="update" class="btn btn-primary mb-3">Update</button>
            </form>
            
        </div>
    </div>
</div>
</body>
</html>
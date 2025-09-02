<%@ page import="java.sql.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

if(username != null && password != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "uday");
        
        String query = "SELECT * FROM login WHERE username=? AND password=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, password);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {
            response.sendRedirect("drHome.html");
        } else {
            out.println("<h2 style='color:red;text-align:center;'>Invalid username or password</h2>");
           %><div style="text-align:center" ><a href="login.jsp"><button style="padding:10px 10px; background-color:skyblue; border-radius:20px; color:white; border: 1px solid white;">Try again</button></a></div>
           <%
        }
        
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
} else {
    out.println("<h3>No data received</h3>");
}
%>

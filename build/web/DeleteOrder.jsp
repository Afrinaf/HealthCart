<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>

<%
String pidToDelete = request.getParameter("pid"); // Get the product ID to delete

Connection conn = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "");
    
    String deleteQuery = "DELETE FROM orders WHERE pid = ?";
    ps = conn.prepareStatement(deleteQuery);
    ps.setString(1, pidToDelete);
    
    int rowsDeleted = ps.executeUpdate();
    
    if (rowsDeleted > 0) {
        out.println("Row deleted successfully");
    } else {
        out.println("Row not found or couldn't be deleted");
    }
} catch (Exception e) {
    out.println("Error: " + e);
} finally {
    try { if (ps != null) ps.close(); } catch (Exception e) {};
    try { if (conn != null) conn.close(); } catch (Exception e) {};
}
%>

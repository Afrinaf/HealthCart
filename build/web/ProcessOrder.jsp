<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
// Get the payment details, order_id, name, and phone number from the request parameters
String orderId = request.getParameter("order_id");
System.out.println(orderId);
String paymentId = request.getParameter("payment_id");
String signature = request.getParameter("signature");
int amount = Integer.parseInt(request.getParameter("amount"));
String name = request.getParameter("name");
System.out.println(name);
String phoneNumber = request.getParameter("phone");

// Perform the necessary verification of the payment details using the Razorpay API or your preferred payment gateway's API.
// Ensure that the payment is successful and the signature is valid.

// Once the payment is verified, you can store the order details in your database.
// For example, you can create a new table "orders" to store order information.

// Prepare a SQL query to insert the order details into the "orders" table.
String insertQuery = "INSERT INTO forder (order_id, payment_id, signature, amount, name, phone_number, order_datetime) VALUES (?, ?, ?, ?, ?, ?, ?)";

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "");
    PreparedStatement ps = conn.prepareStatement(insertQuery);
    System.out.println(ps);
    ps.setString(1, orderId);
    ps.setString(2, paymentId);
    ps.setString(3, signature);
    ps.setInt(4, amount);
    ps.setString(5, name);
    ps.setString(6, phoneNumber);
    ps.setTimestamp(7, new Timestamp(System.currentTimeMillis())); // Use the current timestamp as the order date and time
    ps.executeUpdate();

    ps.close();
    conn.close();

    // Send a success response back to the client-side (JavaScript) indicating that the order has been processed and stored.
    response.getWriter().write("Order successfully processed.");
} catch (Exception e) {
    // Handle any exceptions that occur during database operations or payment verification.
    response.getWriter().write("Error processing the order.");
}
%>


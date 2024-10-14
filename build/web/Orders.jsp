<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<link rel="stylesheet" href="css/Orders.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<style>
    input[type="text"],
    input[type="number"] {
    width: 250px;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="text"]:read-only {
    background-color: #f5f5f5;
}
</style>
<body>
<div class="main">
	<div class="topbar1"></div>
	<div class="topbar2">
		<div class="container1">
			<div class="logout-btn">
				<a href="Logout.jsp">Logout</a>
			</div>
		</div>
	</div> 
	<div class="header">
		<div class="container2">
			<div class="navbar">
				<a href="Homepage.jsp">HOME</a>
				<a href="Buy.jsp">BUY</a>
				<a href="Orders.jsp">ORDERS</a>
			</div>
		</div>
	</div>
	</div>
	<div class="active">
	<%@ page import="java.sql.*" %>
	<%@ page import="javax.sql.*" %>
	<%
	HttpSession httpSession = request.getSession();
    String gid=(String)httpSession.getAttribute("currentuser");
    %>
    
    <div class="filler"></div>
    
    <%
    int flag=0;
	ResultSet rs=null;
	CallableStatement cs=null;
	java.sql.Connection conn=null;
		try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase","root","");
		cs = conn.prepareCall("call getorders(?)");
		cs.setString(1, gid);
		rs = cs.executeQuery();
		%><div class="filler2"></div>
		<table class="tables" id="tab">
			<tr>
    			
    			<th>Product ID</th>
    			<th>Price</th>
    			<th>Quantity</th>
    			<th>Seller ID</th>
    			<th>Order Date and Time</th>
                        <th>Action</th>
  			</tr>
		<%while(rs.next()) 
		{
			%>
	  		
  			<tr data-price="<%= rs.getInt("price") %>">
    			
    			<td><%=rs.getString("pid") %></td>
    			<td ><%=rs.getInt("price") %></td>
    			<td><%=rs.getInt("quantity") %></td>
    			<td><%=rs.getString("sid") %></td>
                        <td><%=rs.getTimestamp("orderdatetime") %></td>
                        <td><input type="button" value="Delete" onclick="deleteRow(this)"></td>  
  			</tr>
  			
		<%
	}
		%>
		</table>
                <br><!-- comment -->
                <br>
                Price: <input type="text" id="amount" name="amount" value="" class="form-control" style="width:250px" readonly> <br>
                Name: <input type="text" id="name" name="name" style="width:250px"><br>
                phone Number: <input type="number" id="num" name="num" style="width:250px"><br>
                Email: <input type="text" id="mail" name="mail" style="width:250px">
		</div>
                <div>
                    <center><button id="razorpayBtn">Pay Now</button></center>
                </div>
		<% 
	}
	catch(Exception e)
	{
		out.println("error: "+e);
	}
		finally {
		    try { if (rs != null) rs.close(); } catch (Exception e) {};
		    try { if (cs != null) cs.close(); } catch (Exception e) {};
		    try { if (conn != null) conn.close(); } catch (Exception e) {};
	}
	%>
</body>

<script>
  $(document).ready(function() {
    var sumVal = 0;
    $('.tables td:nth-child(2)').each(function() {
      sumVal += parseInt($(this).text());
    });
    $('#amount').val(sumVal);
    console.log(sumVal);
  });
  function deleteRow(button) {
    var row = button.parentNode.parentNode;
    var table = row.parentNode;
    var price = parseInt(row.getAttribute("data-price"));
    var pid = row.cells[0].textContent;

    $.ajax({
        type: "POST",
        url: "DeleteOrder.jsp",
        data: { pid: pid },
        success: function (data) {
            if (data.trim() === "Row deleted successfully") {
                // Successful deletion in the database, now update the table on the web page
                table.deleteRow(row.rowIndex);
                updateTotalPrice(-price);
            } else {
                alert("Failed to delete the row.");
            }
        },
        error: function (xhr, status, error) {
            alert("Error: " + error);
        }
    });
}

function updateTotalPrice(priceChange) {
    var total = parseInt($('#amount').val());
    total += priceChange;
    $('#amount').val(total);
}


  function initiateRazorpayPayment() {
    var amount = parseInt($('#amount').val());
    var orderId = ''; // You need to generate the order_id on your server-side and pass it here
    var name = $('#name').val();
    var phoneNumber = $('#num').val();
    var email = $('#mail').val();

    var options = {
      key: "rzp_test_H0KqHhdAvOGByu", // Replace with your Razorpay API key
      amount: amount * 100, // Amount in paise, so multiply by 100
      currency: "INR",
      name: "MEDIMART",
      description: "Payment for Orders",
      image: "your_logo_url.png",
      order_id: orderId,
      handler: function (response) {
        // Handle payment success
        var paymentId = response.razorpay_payment_id;
        console.log(paymentId);
        var orderId = response.razorpay_order_id;
        console.log(orderId);
        var signature = response.razorpay_signature;

        // Now, send the payment details along with the order_id, name, and phone number to the server-side for verification
        $.ajax({
          url: 'http://localhost:8080/WebApplication1/ProcessOrder.jsp', // Replace with the URL of your server-side processing page
          type: 'POST',
          data: {
            order_id: orderId,
            payment_id: paymentId,
            signature: signature,
            amount: amount,
            name: name,
            phone: phoneNumber,
            email: email
          },
          success: function (data) {
            // Handle the server-side response, e.g., show a success message to the user
          },
          error: function (xhr, status, error) {
            // Handle any errors, e.g., show an error message to the user
          }
        });
      },
      prefill: {
        name: name,
        email: email,
        contact: phoneNumber
      }
    };

    var rzp = new Razorpay(options);
    rzp.open();
  }

  // Attach a click event to the Razorpay payment button
  $('#razorpayBtn').click(function () {
    initiateRazorpayPayment();
  });
</script>


</html>

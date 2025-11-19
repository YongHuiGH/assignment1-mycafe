<%@ page import="model.Customer, model.Order" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cust Payment</title>
...
</head>
<body>
<div class="container-fluid">
    <h3>MyCafe</h3>
    <h5>Payment</h5>
    <form method="post" action="CustomerPaymentServlet">
        <div class="col-lg-5">
        <%
            Customer customer = (Customer) session.getAttribute("customerData");
            Order order = (Order) session.getAttribute("orderData");
            if(customer != null && order != null){
        %>
            <h5>Customer Information</h5>
            <p>Full Name: <%= customer.getFullname() %></p>
            <p>Age: <%= customer.getAge() %></p>
            <p>Address: <%= customer.getAddress() %></p>
            <p>Membership: <%= customer.getMembership() %></p>

            <h5>Order Information</h5>
            <p>Set 1 Selected: <%= order.isSet1() %>, Drink: <%= order.getDrink1() %>, Quantity: <%= order.getSet1Quantity() %></p>
            <p>Set 2 Selected: <%= order.isSet2() %>, Drink: <%= order.getDrink2() %>, Quantity: <%= order.getSet2Quantity() %></p>

            <p>Total Amount: $<%= order.calculateTotal() %></p>
            <p>Final Amount (after discount): $<%= order.calculateFinalAmount(customer) %></p>
        <%
            } else {
        %>
            <p>No customer or order information found.</p>
        <%
            }
        %>

        <div class="form-group">
            <label for="payment">Payment Method:</label>
            <select required name="payment" class="form-control">
                <option value="" disabled selected>Select your payment method...</option>
                <option value="online banking">Online Banking</option>
                <option value="card">Credit/Debit Card</option>
                <option value="e-wallet">E-Wallet</option>
            </select>
            <br><br>
        </div>
        <input class="btn" type="submit" value="Confirm Payment" name="orderBtn" />
    </div>
    </form>
</div>
</body>
</html>

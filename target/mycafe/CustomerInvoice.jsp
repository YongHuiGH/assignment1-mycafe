<%@ page import="model.Customer, model.Order" %>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Invoice</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body { padding: 20px; font-family: Arial, sans-serif; }
        .invoice { max-width: 800px; margin: auto; border: 1px solid #ddd; padding: 20px; }
        .invoice h2 { color: #008080; margin-bottom: 20px; }
        .table th, .table td { padding: 10px; }
        .total { font-weight: bold; }
    </style>
</head>
<body>
<div class="invoice">
    <h2>MyCafe - Invoice</h2>

<%
    Customer customer = (Customer) session.getAttribute("customerData");
    Order order = (Order) session.getAttribute("orderData");
    String paymentMethod = (String) session.getAttribute("paymentMethod");

    if(customer != null && order != null && paymentMethod != null) {
%>
    <h4>Customer Information</h4>
    <p><strong>Name:</strong> <%= customer.getFullname() %></p>
    <p><strong>Age:</strong> <%= customer.getAge() %></p>
    <p><strong>Address:</strong> <%= customer.getAddress() %></p>
    <p><strong>Membership:</strong> <%= customer.getMembership() %></p>

    <h4>Order Details</h4>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Set</th>
                <th>Drink</th>
                <th>Quantity</th>
                <th>Price per Item ($)</th>
                <th>Subtotal ($)</th>
            </tr>
        </thead>
        <tbody>
            <% if(order.isSet1()) { %>
            <tr>
                <td>Set 1</td>
                <td><%= order.getDrink1() %></td>
                <td><%= order.getSet1Quantity() %></td>
                <td><%= order.getPricePerItem() %></td>
                <td><%= order.getSet1Quantity() * order.getPricePerItem() %></td>
            </tr>
            <% } %>
            <% if(order.isSet2()) { %>
            <tr>
                <td>Set 2</td>
                <td><%= order.getDrink2() %></td>
                <td><%= order.getSet2Quantity() %></td>
                <td><%= order.getPricePerItem() %></td>
                <td><%= order.getSet2Quantity() * order.getPricePerItem() %></td>
            </tr>
            <% } %>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" class="total">Total Amount ($)</td>
                <td class="total"><%= order.calculateTotal() %></td>
            </tr>
            <tr>
                <td colspan="4" class="total">Final Amount (after discounts) ($)</td>
                <td class="total"><%= order.calculateFinalAmount(customer) %></td>
            </tr>
            <tr>
                <td colspan="4" class="total">Payment Method</td>
                <td class="total"><%= paymentMethod %></td>
            </tr>
        </tfoot>
    </table>

    <h5>Thank you for your order!</h5>

<%
    } else {
%>
    <p>No invoice data available.</p>
<%
    }
%>
</div>
</body>
</html>

<%@ page import="model.Customer, model.Order" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cust Payment</title>
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
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Set</th>
                        <th>Selected</th>
                        <th>Drink</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (order.isSet1()) { %>
                    <tr>
                        <td>Set 1 (Hashbrown)</td>
                        <td>Yes</td>
                        <td><%= order.getDrink1() %></td>
                        <td><%= order.getSet1Quantity() %></td>
                    </tr>
                    <% } %>

                    <% if (order.isSet2()) { %>
                    <tr>
                        <td>Set 2 (Hot Pancakes)</td>
                        <td>Yes</td>
                        <td><%= order.getDrink2() %></td>
                        <td><%= order.getSet2Quantity() %></td>
                    </tr>
                    <% } %>

                    <% if (!order.isSet1() && !order.isSet2()) { %>
                    <tr>
                        <td colspan="4" style="text-align:center;">No sets selected.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <table class="table table-bordered">
                <tr>
                    <td><strong>Total Amount:</strong></td>
                    <td>$<%= String.format("%.2f", order.calculateTotal()) %></td>
                </tr>
                <tr>
                    <td><strong>Final Amount (after discount):</strong></td>
                    <td>$<%= String.format("%.2f", order.calculateFinalAmount(customer)) %></td>
                </tr>
            </table>
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

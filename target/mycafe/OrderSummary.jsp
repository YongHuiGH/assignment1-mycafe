<%@ page import="model.Order" %>

<%
    Order order = (Order) session.getAttribute("orderData");
    if (order == null) {
        out.print("No order found.");
        return;
    }
%>

<h3>Your Order Summary</h3>

<p>Set 1 selected: <%= order.isSet1() %></p>
<p>Set 1 drink: <%= order.getDrink1() %></p>
<p>Set 1 quantity: <%= order.getSet1Quantity() %></p>

<p>Set 2 selected: <%= order.isSet2() %></p>
<p>Set 2 drink: <%= order.getDrink2() %></p>
<p>Set 2 quantity: <%= order.getSet2Quantity() %></p>

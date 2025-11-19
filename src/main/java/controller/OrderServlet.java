package controller;

import model.Order;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Order order = new Order();

        order.setSet1(request.getParameter("hashbrownChkbox") != null);
        order.setSet2(request.getParameter("hotcakesChkbox") != null);

        order.setDrink1(request.getParameter("drink1"));
        order.setDrink2(request.getParameter("drink2"));

        order.setSet1Quantity(Integer.parseInt(request.getParameter("set1Quantity")));
        order.setSet2Quantity(Integer.parseInt(request.getParameter("set2Quantity")));

        HttpSession session = request.getSession();
        session.setAttribute("orderData", order);

        Cookie lastOrder = new Cookie("lastDrink1", order.getDrink1());
        lastOrder.setMaxAge(60 * 60); // 1 hour
        response.addCookie(lastOrder);

        response.sendRedirect("CustomerPayment.jsp");
    }
}

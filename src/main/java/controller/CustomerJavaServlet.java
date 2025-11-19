package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Customer;

@WebServlet("/CustomerJavaServlet")
public class CustomerJavaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String ageStr = request.getParameter("age");
        String address = request.getParameter("address");
        String membership = request.getParameter("membership");

        int age = 0;
        try {
            age = Integer.parseInt(ageStr);
        } catch (Exception e) {
            age = 0;
        }

        Customer customer = new Customer();
        customer.setFullname(fullname);
        customer.setAge(age);
        customer.setAddress(address);
        customer.setMembership(membership);

        HttpSession session = request.getSession();
        session.setAttribute("customerData", customer);

        Cookie cookie = new Cookie("fullname", fullname);
        cookie.setMaxAge(60 * 60 * 24); // 1 day
        response.addCookie(cookie);

        response.sendRedirect("CustomerOrder.jsp");
    }
}

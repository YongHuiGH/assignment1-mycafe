package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CustomerPaymentServlet")
public class CustomerPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentMethod = request.getParameter("payment");

        HttpSession session = request.getSession();
        session.setAttribute("paymentMethod", paymentMethod);

        Cookie paymentCookie = new Cookie("paymentMethod", paymentMethod);
        paymentCookie.setMaxAge(60 * 60); // 1 hour
        response.addCookie(paymentCookie);

        response.sendRedirect("CustomerInvoice.jsp");
    }
}

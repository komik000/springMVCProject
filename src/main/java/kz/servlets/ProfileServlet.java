package kz.servlets;

import kz.Entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet( value = "/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        System.out.println(session.getAttribute("user"));
//        if (request.getAttribute("user") == null){
//        }else{

            User user = (User) session.getAttribute("user");
            if (user != null){
                request.setAttribute("user", user);
                request.getRequestDispatcher("jsp/profile.jsp").forward(request, response);
            }else{
            response.sendRedirect(request.getContextPath()+"/login");

            }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

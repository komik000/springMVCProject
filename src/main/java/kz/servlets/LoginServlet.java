package kz.servlets;

import kz.Entity.User;
import kz.db.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login/login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Perform input validation
        List<String> errors = new ArrayList<>();
        if (email == null || email.isEmpty()) {
            errors.add("Email is required.");
        }
        if (password == null || password.isEmpty()) {
            errors.add("Password is required.");
        }
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("login/login.jsp").forward(request, response);
            return;
        }

        UserDAO userDao = new UserDAO();
            User user = userDao.getUserByEmail(email);
            if (user != null && user.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                Cookie emailCookie = new Cookie("email",user.getEmail());
                Cookie passwordCookie = new Cookie("password",user.getPassword());
                emailCookie.setMaxAge(60*60*24*30);
                passwordCookie.setMaxAge(60*60*24*30);
                response.addCookie(emailCookie);
                response.addCookie(passwordCookie);
                response.sendRedirect(request.getContextPath()+"/");
            } else {
                errors.add("Invalid email or password.");
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
            }

    }

}

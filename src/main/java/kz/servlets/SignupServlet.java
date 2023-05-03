package kz.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kz.Entity.User;
import kz.db.UserDAO;


@WebServlet(value = "/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String fullName = request.getParameter("fullname");

        List<String> errors = new ArrayList<>();
        if (email == null || email.isEmpty()) {
            errors.add("Email is required.");
        }
        if (password == null || password.isEmpty()) {
            errors.add("Password is required.");
        }
        if (!password.equals(confirm)) {
            errors.add("Passwords do not match.");
        }
        if (fullName == null || fullName.isEmpty()) {
            errors.add("Full name is required.");
        }
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("jsp/signup.jsp").forward(request, response);
            return;
        }

        User user = new User(0,email, password, fullName);
        UserDAO userDao = new UserDAO();
        userDao.createUser(user);
        response.sendRedirect(request.getContextPath() + "jsp/login.jsp");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("jsp/signup.jsp").forward(request,response);
    }
}


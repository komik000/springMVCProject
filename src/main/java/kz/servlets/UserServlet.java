package kz.servlets;

import kz.Entity.User;
import kz.db.UserDAO;

import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {
    private UserDAO userDao;

    @Override
    public void init() throws ServletException {
        super.init();
        userDao = new UserDAO();
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            // If no action is specified, show all users
            showAllUsers(request, response);
        } else if (action.equals("edit")) {
            // If the action is "edit", show the edit form for a single user
            showEditForm(request, response);
        } else if (action.equals("delete")) {
            // If the action is "delete", delete a single user and redirect to the list of users
            deleteUser(request, response);
        } else {
            // If the action is not recognized, show all users
            showAllUsers(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            // If no action is specified, create a new user and redirect to the list of users
            createUser(request, response);
        } else if (action.equals("update")) {
            // If the action is "update", update a single user and redirect to the list of users
            updateUser(request, response);
        } else {
            // If the action is not recognized, create a new user and redirect to the list of users
            createUser(request, response);
        }
    }

    private void showAllUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userDao.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/user-list.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userDao.getUserByID(id);
        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/user-edit.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/user");
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDao.deleteUser(id);
        response.sendRedirect(request.getContextPath() + "/user");
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        User user = new User(0,email, password, fullName);
        userDao.createUser(user);
        response.sendRedirect(request.getContextPath() + "/user");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        User user = new User(id, email, password, fullName);
        userDao.updateUser(user);
        response.sendRedirect(request.getContextPath() + "/user");
    }
}


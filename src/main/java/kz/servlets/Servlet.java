package kz.servlets;

import kz.db.DBManager;
import kz.Entity.Items;
import kz.db.ItemsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/home")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Items> items = ItemsDAO.getItems();
        System.out.println();
        request.setAttribute("tovary",items);
        request.getRequestDispatcher("jsp/home.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

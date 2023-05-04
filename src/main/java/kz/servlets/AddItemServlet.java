package kz.servlets;

import kz.db.DBManager;
import kz.Entity.Items;
import kz.db.ItemsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/additem")
public class AddItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("jsp/addItem.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int price = Integer.parseInt(request.getParameter("price"));
        String link = request.getParameter("link");

        Items it = new Items(null,name,price,amount,link);
        ItemsDAO.addItem(it);
        System.out.println(it);

        response.sendRedirect("/additem?success");
    }
}

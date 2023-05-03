package kz.servlets;

import kz.db.DBManager;
import kz.Entity.Items;
import kz.db.ItemsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = 0L;
        try{
            id = Long.parseLong(request.getParameter("id"));
        }catch (Exception e) {
            e.printStackTrace();
        }
        Items item = ItemsDAO.getItem(id);

        if(item != null) {
            request.setAttribute("item", item);
            request.getRequestDispatcher("jsp/details.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("jsp/404.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

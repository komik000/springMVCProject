package kz.servlets;

import kz.db.ItemsDAO;
import kz.Entity.Items;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("jsp/edit.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Items item = ItemsDAO.getItem(id);

        if(item != null) {
            if(ItemsDAO.deleteItem(item)) {
                response.sendRedirect("/");
            } else{
                response.sendRedirect("/edit?id="+id+"&error");
            }
        }
        else {
            response.sendRedirect("/");
        }
    }
}

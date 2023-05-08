package kz.servlets;

import kz.Entity.Comment;
import kz.Entity.User;
//import kz.db.CommentDAO;
import kz.db.DBManager;
import kz.Entity.Items;
import kz.db.ItemsDAO;
import kz.db.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

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
//            CommentDAO commentDAO = new CommentDAO();
//            List<Comment> comments = commentDAO.getCommentsByItemId((int) item.getId());
            request.setAttribute("item", item);
//            request.setAttribute("comments", comments);
            request.getRequestDispatcher("jsp/details.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("jsp/404.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

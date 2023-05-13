package kz.servlets;

import kz.Entity.Comment;
import kz.Entity.User;
//import kz.db.CommentDAO;
import kz.db.CommentDAO;
import kz.db.DBManager;
import kz.Entity.Items;
import kz.db.ItemsDAO;
import kz.db.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
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
            CommentDAO commentDAO = new CommentDAO();
//            List<Comment> comments = commentDAO.getCommentsByItemId((int) item.getId());
//            System.out.println(comments.get(0).getComment());
            request.setAttribute("item", item);
//            request.setAttribute("comments", comments);
            request.getRequestDispatcher("jsp/details.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("jsp/404.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null){
            System.out.println("AK DASJDB SADBJKSADJJAS NDJKAS d");
            request.getRequestDispatcher("/details?id="+Integer.parseInt(request.getParameter("id"))).forward(request, response);
        } else {
            System.out.println("111AK DASJDB SADBJKSADJJAS NDJKAS d");

            User user = (User)session.getAttribute("user");
            System.out.println(user.getEmail()+" "+user.getId());
            int itemId = Integer.parseInt(request.getParameter("id"));
            int userId = user.getId();
            String comment = request.getParameter("comment");
            Timestamp now = new Timestamp(System.currentTimeMillis());
            Comment newComment = new Comment(itemId, userId, comment, now);
            CommentDAO commentDAO = new CommentDAO();

            System.out.println(""+newComment.getItemId()+" "+newComment.getUserId()+" "+newComment.getComment()+" "+newComment.getDate());

            commentDAO.addComment(newComment);

            response.sendRedirect("details?id=" + itemId);
        }
    }
}

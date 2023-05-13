package kz.servlets;

import kz.Entity.Items;
import kz.db.ItemsDAO;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@WebServlet(value = "/additem")
@MultipartConfig
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

        Part filePart = request.getPart("link");

        String fileName = filePart.getSubmittedFileName();
        String link = String.valueOf(System.currentTimeMillis())+"_"+fileName;
        for (Part part : request.getParts()) {
            String path = ("/Users/admin/Desktop/java/springMVCProject/src/main/webapp/img/");
//            String path = "C:\\Users\\akimi\\IdeaProjects\\springMVCProject\\src\\main\\webapp\\img\\";
            part.write(path+""+ link);
        }
        Items it = new Items(null,name,price,amount,link);
        ItemsDAO.addItem(it);


        response.sendRedirect("/additem?success");
    }

}

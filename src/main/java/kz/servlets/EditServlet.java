package kz.servlets;

import kz.db.ItemsDAO;
import kz.Entity.Items;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet(value = "/edit")
public class EditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = 0L;
        try{
            id = Long.parseLong(request.getParameter("id"));
        }catch (Exception e) {
            e.printStackTrace();
        }
        Items item = ItemsDAO.getItem(id);

        if(item != null) {
            request.setAttribute("item", item);
            request.getRequestDispatcher("jsp/edit.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("jsp/404.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("id"));
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int price = Integer.parseInt(request.getParameter("price"));

        Part filePart = request.getPart("link");

        // Read the file content and convert it to a string
        InputStream fileContent = filePart.getInputStream();
        String link = convertStreamToString(fileContent);



        Items item = ItemsDAO.getItem(id);

        if(item != null) {
            item.setAmount(amount);
            item.setPrice(price);
            item.setName(name);
            item.setLink(link);



            if(ItemsDAO.saveItem(item)) {
                response.sendRedirect("/edit?id="+id+"&success");
            } else{
                response.sendRedirect("/edit?id="+id+"&error");
            }
        }
        else {
            response.sendRedirect("/");
        }
    }
    private String convertStreamToString(InputStream inputStream) throws IOException {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            StringBuilder stringBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
            }
            return stringBuilder.toString();
        }
    }
}

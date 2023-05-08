<%@ page import="kz.Entity.Items" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
  <head lang="en">
    <title>Title</title>
    <%@include file="../vendor/head.jsp"%>
  </head>
  <body>
    <%@include file="../vendor/navbar.jsp"%>
    <div class="container text-center" style="">
      <div class="row row-cols-3">
        <%
          ArrayList<Items> items = (ArrayList<Items>) request.getAttribute("tovary");
          if(items != null) {
            for(Items it : items) {
        %>
        <div class="col">
          <div class="card mt-4" style="width: 18rem;border-radius: 16px;">


            <img src="/img/<%=it.getLink()%>" class="card-img-top mt-4" alt="Iphone 13 Pro">
            <div class="card-body">
              <h5 class="card-title"><%=it.getName()%></h5>
              <p class="card-text"><%=it.getPrice()%></p>
              <a href="/details?id=<%=it.getId()%>" class="btn btn-info btn-sm"> Details </a>
            </div>

          </div>
        </div>
        <%
            }
          }
        %>
      </div>
    </div>
  </body>
</html>

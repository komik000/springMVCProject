<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.Entity.Items" %>
<!doctype html>
<html lang="en">
  <head>
    <title>Title</title>
    <%@include file="../vendor/head.jsp"%>
  </head>
  <body>
  <%@include file="../vendor/navbar.jsp"%>
  <div class="container">
    <div class="row mt-5">
      <div class="col-sm-6 offset-3">
        <%
          String success = request.getParameter("success");
          if(success!=null){
        %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          Item added successfully
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <%
          }
        %>
        <form action="/additem" method="post" enctype="multipart/form-data">
          <div class="form-group" >
            <label>
              NAME:
            </label>
            <input type="text" name="name" class="form-control">
          </div>
          <div class="form-group">
            <label>
              AMOUNT:
            </label>
            <input type="number" name="amount" class="form-control">
          </div>
          <div class="form-group">
            <label>
              PRICE:
            </label>
            <input type="number" name="price" class="form-control">
          </div>
          <div class="form-group">
            <label>
              LINK:
            </label>
            <input type="file" name="link" class="form-control">
          </div>
          <div class="form-group">
            <button class="btn btn-success">
              ADD ITEM
            </button>
          </div>

        </form>


      </div>
    </div>
  </div>
  <% if (request.getAttribute("image") != null){
    Part filePart = (Part) request.getAttribute("image");
    out.print(filePart.getSubmittedFileName());}%>
  </body>
</html>
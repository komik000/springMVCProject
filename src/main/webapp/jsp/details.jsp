<%@ page import="kz.Entity.Items" %>
<%@ page import="kz.Entity.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="kz.Entity.User" %>
<%@ page import="kz.db.UserDAO" %>
<!doctype html>
<html lang="en">
<head>
    <%@include file="../vendor/head.jsp"%>
</head>
<body>
  <div class="container">
      <div class="row mt-5">
          <div class="col-sm-12">
            <%
              Items item = (Items)request.getAttribute("item");
              if(item != null) {

            %>
            <div class="jumbotron">
                <h1 class="display-4"><%=item.getName()%></h1>
                <p class="lead">PRICE: <%=item.getPrice()%> USD</p>
                <hr class="my-4">
                <p>AMOUNT: <%=item.getAmount()%> ITEMS</p>
                <p class="lead">
                  <a class="btn btn-primary btn-sm" href="/edit?id=<%=item.getId()%>" role="button">EDIT</a>
                </p>
            </div>
          </div>
          <%
              }
          %>
      </div>



      <section style="background-color: #e9ecef;">

          <div class="container my-5 py-5">

                  <div class="col-md-12 col-lg-10">

                      <%
                          Long id = Long.parseLong(request.getParameter("id"));
                          System.out.println(id);
                      %>
                      <form action="/details?id=<%=id%>" method="post">


                          <div class="form-group">
                              <label for="exampleFormControlTextarea1">Add comment</label>
                              <textarea name="comment" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                          </div>
                            <button type="submit" class="btn btn-primary "> Submit</button>
                      </form>


                  <div class="">
                      <div class="card text-dark">
                          <% List<Comment> comments = (List<Comment>) request.getAttribute("comments");
                              if (comments != null){
                                  for (Comment comment: comments){
                                      UserDAO userDAO = new UserDAO();
                                      User user = userDAO.getUserByID(comment.getUserId());
                          %>
                          <div class="card-body p-4">
                              <h4 class="mb-0">Recent comments</h4>
                              <p class="fw-light mb-4 pb-2">Latest Comments section by users</p>

                              <div class="d-flex flex-start">
                                  <img class="rounded-circle shadow-1-strong me-3"
                                       src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp" alt="avatar" width="60"
                                       height="60" />
                                  <div>
                                      <h6 class="fw-bold mb-1"><%=user.getFullName()%></h6>
                                      <div class="d-flex align-items-center mb-3">
                                          <p class="mb-0">
                                              <%=comment.getDate()%>
                                          </p>
                                          <a href="#!" class="link-muted"><i class="fas fa-pencil-alt ms-2"></i></a>
                                          <a href="#!" class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a>
                                          <a href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a>
                                      </div>
                                      <p class="mb-0">
                                          <%=comment.getComment()%>
                                      </p>
                                  </div>
                              </div>
                          </div>
                          <hr class="my-0" />
                          <% }
                          }%>
                      </div>
                  </div>
              </div>
          </div>
      </section>
  </div>

</body>
</html>
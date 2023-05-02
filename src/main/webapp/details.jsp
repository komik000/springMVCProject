<%@ page import="kz.javaeee.db.Items" %>
<!doctype html>
<html lang="en">
<head>
    <%@include file="vendor/head.jsp"%>
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
  </div>
</body>
</html>
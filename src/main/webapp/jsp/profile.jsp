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
  <div style="display: flex;justify-content: center">
    <div>
      <% if (request.getAttribute("user")!=null)
      {
        User user = (User)request.getAttribute("user");
      %>

      <h1>Hello <%=user.getFullName()%> </h1>
      <%}%>

      <h5>This is your profile page</h5>

    </div>
  </div>
</body>
</html>
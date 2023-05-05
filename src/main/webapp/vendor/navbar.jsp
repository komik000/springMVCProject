<%@ page import="kz.Entity.User" %>

<div style="width: 75%;margin: auto;">

  <div class="navbar navbar-expand-lg navbar-light" style="display:flex;justify-content: center;">
    <div style="width:30%">
      <a class="navbar-brand" href="/home"><%=siteName%></a>
    </div>
    <ul class="nav justify-content-center">
      <li class="nav-item active">
        <a class="nav-link text-dark" href="/home">Home<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark" href="/additem">Add Item</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark" href="/card">Products</a>
      </li>
      <%if(session.getAttribute("user") != null){
        User user = (User) session.getAttribute("user");%>
      <li class="nav-item">
        <a class="nav-link text-dark" href="/profile"><%=user.getFullName()%></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark" href="logout">Logout</a>
      </li>
      <%}else{%>
      <li class="nav-item">
        <a class="nav-link text-dark" href="login">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark" href="signup">Signup</a>
      </li>
      <%}%>
    </ul>

  </div>
  <hr style="width: 100%">

</div>

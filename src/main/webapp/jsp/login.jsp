<%@ page import="kz.Entity.Items" %>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<html lang="en">
    <head>
        <title>Title</title>
        <%@include file="/vendor/head.jsp"%>
    </head>
    <body>
        <%@include file="/vendor/navbar.jsp"%>
        <%
            String success = request.getParameter("success");
            if(success!=null){
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            Incorrect email or password
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <%
            }
        %>
        <div style="height: 50px;"></div>
        <div class="" style="border-style: solid;width: 70%;margin: auto;border-color: #a7acb1;-webkit-box-shadow: 0 0 10px #fff;box-shadow: 0 0 10px #fff;">
            <div class="" style="">
                <div class="mb-4" style="background: gainsboro;width: 100%;height: 50px;">
                    <h2 class="fw-bold " style="margin: 20px;">Login Page</h2>
                </div>

                <form action="/login" method="post">

                    <!-- Email input -->
                    <div class="form-outline mb-4" style="display: flex;">
                        <label class="form-label" for="form3Example4" style="width: 20%;margin-left: 20px">Email</label>
                        <input type="text" name="email" id="form2Example4" style="width: 80%" class="form-control" />
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-4" style="display: flex;">
                        <label class="form-label" for="form3Example4" style="width: 20%;margin-left: 20px">Password</label>
                        <input type="password" name="password" id="form3Example4" style="width: 80%" class="form-control" />

                    </div>



                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-block mb-4 btn-success" style="width:10%;margin-left: 20px" >
                        Login
                    </button>

                </form>
            </div>
            <%
                ArrayList<String> items = (ArrayList<String>) request.getAttribute("errors");
                if (items!=null){
                    if (!items.isEmpty()){
                        for (String i: items){
            %>
            <p style="color: red;"> <% out.println(i); %> </p>
            <%
                        }
                    }
                }
            %>
        </div>

        <!-- Section: Design Block -->

    </body>
</html>
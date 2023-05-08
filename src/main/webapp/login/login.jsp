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
<%--<div style="height: 50px;"></div>--%>
<%--<div class="" style="border-style: solid;width: 70%;margin: auto;border-color: #a7acb1;-webkit-box-shadow: 0 0 10px #fff;box-shadow: 0 0 10px #fff;">--%>
<%--    <div class="" style="">--%>
<%--        <div class="mb-4" style="background: gainsboro;width: 100%;height: 50px;">--%>
<%--            <h2 class="fw-bold " style="margin: 20px;">Login Page</h2>--%>
<%--        </div>--%>

<%--        <form action="/login" method="post">--%>
<%--            <!-- Email input -->--%>

<%--            <div class="form-outline mb-4" style="display: flex;">--%>
<%--                <label class="form-label" for="form3Example4" style="width: 20%;margin-left: 20px">Email</label>--%>
                <% Cookie[] cookies = request.getCookies();
                    String email = "";
                    String password = "";
                    if (cookies!=null){
                        for (Cookie cookie: cookies){
                            if (cookie.getName().equals( "email"))
                                email = cookie.getValue();
                            if (cookie.getName().equals( "password"))
                                password = cookie.getValue();
                            System.out.println(cookie.getName()+" "+cookie.getValue());
                        }
                    }
                %>
<%--                <input type="text" name="email" value="<% out.println(email); %>" id="form2Example4" style="width: 80%" class="form-control" />--%>
<%--            </div>--%>

<%--            <!-- Password input -->--%>
<%--            <div class="form-outline mb-4" style="display: flex;">--%>
<%--                <label class="form-label" for="form3Example4" style="width: 20%;margin-left: 20px">Password</label>--%>
<%--                <input type="password" name="password" value="<% out.println(password); %>" id="form3Example4" style="width: 80%" class="form-control" />--%>

<%--            </div>--%>

<%--            <!-- Submit button -->--%>
<%--            <button type="submit" class="btn btn-primary btn-block mb-4 btn-success" style="width:10%;margin-left: 20px" >--%>
<%--                Login--%>
<%--            </button>--%>

<%--        </form>--%>
<%--    </div>--%>
    <%
        ArrayList<String> items = (ArrayList<String>) request.getAttribute("errors");
        if (items!=null){
            if (!items.isEmpty()){
                for (String i: items){
    %>
<%--    <p style="color: red;"> <% out.println(i); %> </p>--%>
    <%
                }
            }
        }
    %>
<%--</div>--%>

<!-- Section: Design Block -->

<%--</body>--%>
<%--</html>--%>
<%--<!------ Include the above in your HEAD tag ---------->--%>
<!-- Pills navs -->
    <div style="height: 100px"></div>
    <div style="display:flex;justify-content: center">
        <div style="width: 30%;">
            <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="tab-login" data-mdb-toggle="pill" href="#pills-login" role="tab"
                       aria-controls="pills-login" aria-selected="true">Login</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="tab-register" data-mdb-toggle="pill" href="#pills-register" role="tab"
                       aria-controls="pills-register" aria-selected="false">Register</a>
                </li>
            </ul>
            <!-- Pills navs -->

            <!-- Pills content -->
            <div class="tab-content">
                <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                    <form action="/login" method="post">
                        <div class="text-center mb-3">
                            <p>Sign in with:</p>
                            <button type="button" class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-facebook-f"></i>
                            </button>

                            <button type="button" class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-google"></i>
                            </button>

                            <button type="button" class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-twitter"></i>
                            </button>

                            <button type="button" class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-github"></i>
                            </button>
                        </div>

                        <p class="text-center">or:</p>

                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" id="loginName" class="form-control" value="<% out.println(email);%>"/>
<%--                            <label class="form-label" for="loginName">Email or username</label>--%>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" id="loginPassword" class="form-control" value="<% out.println(password);%>"/>
<%--                            <label class="form-label" for="loginPassword">Password</label>--%>
                        </div>

                        <!-- 2 column grid layout -->
                        <div class="row mb-4">
                            <div class="col-md-6 d-flex justify-content-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-3 mb-md-0">
                                    <input class="form-check-input" type="checkbox" value="" id="loginCheck" checked />
                                    <label class="form-check-label" for="loginCheck"> Remember me </label>
                                </div>
                            </div>

                            <div class="col-md-6 d-flex justify-content-center">
                                <!-- Simple link -->
                                <a href="#!">Forgot password?</a>
                            </div>
                        </div>

                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>


                        <!-- Register buttons -->
                        <div class="text-center">
                            <p>Not a member? <a href="#!">Register</a></p>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
                    <form>
                        <div class="text-center mb-3">
                            <p>Sign up with:</p>
                            <button type="button" class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-facebook-f"></i>
                            </button>

                            <button type="button" class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-google"></i>
                            </button>

                            <button type="button" class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-twitter"></i>
                            </button>

                            <button type="button" class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-github"></i>
                            </button>
                        </div>

                        <p class="text-center">or:</p>

                        <!-- Name input -->
                        <div class="form-outline mb-4">
                            <input type="text" id="registerName" class="form-control" />
                            <label class="form-label" for="registerName">Name</label>
                        </div>

                        <!-- Username input -->
                        <div class="form-outline mb-4">
                            <input type="text" id="registerUsername" class="form-control" />
                            <label class="form-label" for="registerUsername">Username</label>
                        </div>

                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" id="registerEmail" class="form-control" />
                            <label class="form-label" for="registerEmail">Email</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" id="registerPassword" class="form-control" />
                            <label class="form-label" for="registerPassword">Password</label>
                        </div>

                        <!-- Repeat Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" id="registerRepeatPassword" class="form-control" />
                            <label class="form-label" for="registerRepeatPassword">Repeat password</label>
                        </div>

                        <!-- Checkbox -->
                        <div class="form-check d-flex justify-content-center mb-4">
                            <input class="form-check-input me-2" type="checkbox" value="" id="registerCheck" checked
                                   aria-describedby="registerCheckHelpText" />
                            <label class="form-check-label" for="registerCheck">
                                I have read and agree to the terms
                            </label>
                        </div>

                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-block mb-3">Sign in</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

<!-- Pills content -->
    </body>
</html>
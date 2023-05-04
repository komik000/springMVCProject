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
                <input type="text" name="email" value="<% out.println(email); %>" id="form2Example4" style="width: 80%" class="form-control" />
            </div>

            <!-- Password input -->
            <div class="form-outline mb-4" style="display: flex;">
                <label class="form-label" for="form3Example4" style="width: 20%;margin-left: 20px">Password</label>
                <input type="password" name="password" value="<% out.println(password); %>" id="form3Example4" style="width: 80%" class="form-control" />

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

<%--</body>--%>
<%--</html>--%>
<%--<!------ Include the above in your HEAD tag ---------->--%>

<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <div class="col-md-6 col-md-offset-3">--%>
<%--            <div class="panel panel-login">--%>
<%--                <div class="panel-heading">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-xs-6">--%>
<%--                            <a href="#" class="active" id="login-form-link">Login</a>--%>
<%--                        </div>--%>
<%--                        <div class="col-xs-6">--%>
<%--                            <a href="#" id="register-form-link">Register</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <hr>--%>
<%--                </div>--%>
<%--                <div class="panel-body">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <form id="login-form" action="/login" method="post" role="form" style="display: block;">--%>
<%--                                <div class="form-group">--%>
<%--                                    <input type="text" name="username" id="" tabindex="1" class="form-control" placeholder="Username" value="">--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">--%>
<%--                                </div>--%>
<%--                                <div class="form-group text-center">--%>
<%--                                    <input type="checkbox" tabindex="3" class="" name="remember" id="remember">--%>
<%--                                    <label for="remember"> Remember Me</label>--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-sm-6 col-sm-offset-3">--%>
<%--                                            <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login btn-success" value="Log In">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-lg-12">--%>
<%--                                            <div class="text-center">--%>
<%--                                                <a href="#" tabindex="5" class="forgot-password">Forgot Password?</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                            <form id="register-form" action="/login" method="post" role="form" style="display: none;">--%>
<%--                                <div class="form-group">--%>
<%--                                    <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <input type="password" name="password" id="password1" tabindex="2" class="form-control" placeholder="Password">--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-sm-6 col-sm-offset-3">--%>
<%--                                            <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<style>--%>
<%--    body {--%>
<%--        padding-top: 90px;--%>
<%--    }--%>
<%--    .panel-login {--%>
<%--        border-color: #ccc;--%>
<%--        -webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);--%>
<%--        -moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);--%>
<%--        box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);--%>
<%--    }--%>
<%--    .panel-login>.panel-heading {--%>
<%--        color: #00415d;--%>
<%--        background-color: #fff;--%>
<%--        border-color: #fff;--%>
<%--        text-align:center;--%>
<%--    }--%>
<%--    .panel-login>.panel-heading a{--%>
<%--        text-decoration: none;--%>
<%--        color: #666;--%>
<%--        font-weight: bold;--%>
<%--        font-size: 15px;--%>
<%--        -webkit-transition: all 0.1s linear;--%>
<%--        -moz-transition: all 0.1s linear;--%>
<%--        transition: all 0.1s linear;--%>
<%--    }--%>
<%--    .panel-login>.panel-heading a.active{--%>
<%--        color: #029f5b;--%>
<%--        font-size: 18px;--%>
<%--    }--%>
<%--    .panel-login>.panel-heading hr{--%>
<%--        margin-top: 10px;--%>
<%--        margin-bottom: 0px;--%>
<%--        clear: both;--%>
<%--        border: 0;--%>
<%--        height: 1px;--%>
<%--        background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));--%>
<%--        background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));--%>
<%--        background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));--%>
<%--        background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));--%>
<%--    }--%>
<%--    .panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {--%>
<%--        height: 45px;--%>
<%--        border: 1px solid #ddd;--%>
<%--        font-size: 16px;--%>
<%--        -webkit-transition: all 0.1s linear;--%>
<%--        -moz-transition: all 0.1s linear;--%>
<%--        transition: all 0.1s linear;--%>
<%--    }--%>
<%--    .panel-login input:hover,--%>
<%--    .panel-login input:focus {--%>
<%--        outline:none;--%>
<%--        -webkit-box-shadow: none;--%>
<%--        -moz-box-shadow: none;--%>
<%--        box-shadow: none;--%>
<%--        border-color: #ccc;--%>
<%--    }--%>
<%--    .btn-login {--%>
<%--        background-color: #59B2E0;--%>
<%--        outline: none;--%>
<%--        color: #fff;--%>
<%--        font-size: 14px;--%>
<%--        height: auto;--%>
<%--        font-weight: normal;--%>
<%--        padding: 14px 0;--%>
<%--        text-transform: uppercase;--%>
<%--        border-color: #59B2E6;--%>
<%--    }--%>
<%--    .btn-login:hover,--%>
<%--    .btn-login:focus {--%>
<%--        color: #fff;--%>
<%--        background-color: #53A3CD;--%>
<%--        border-color: #53A3CD;--%>
<%--    }--%>
<%--    .forgot-password {--%>
<%--        text-decoration: underline;--%>
<%--        color: #888;--%>
<%--    }--%>
<%--    .forgot-password:hover,--%>
<%--    .forgot-password:focus {--%>
<%--        text-decoration: underline;--%>
<%--        color: #666;--%>
<%--    }--%>

<%--    .btn-register {--%>
<%--        background-color: #1CB94E;--%>
<%--        outline: none;--%>
<%--        color: #fff;--%>
<%--        font-size: 14px;--%>
<%--        height: auto;--%>
<%--        font-weight: normal;--%>
<%--        padding: 14px 0;--%>
<%--        text-transform: uppercase;--%>
<%--        border-color: #1CB94A;--%>
<%--    }--%>
<%--    .btn-register:hover,--%>
<%--    .btn-register:focus {--%>
<%--        color: #fff;--%>
<%--        background-color: #1CA347;--%>
<%--        border-color: #1CA347;--%>
<%--    }--%>

<%--</style>--%>
<%--<script>--%>
<%--    $(function() {--%>

<%--        $('#login-form-link').click(function(e) {--%>
<%--            $("#login-form").delay(100).fadeIn(100);--%>
<%--            $("#register-form").fadeOut(100);--%>
<%--            $('#register-form-link').removeClass('active');--%>
<%--            $(this).addClass('active');--%>
<%--            e.preventDefault();--%>
<%--        });--%>
<%--        $('#register-form-link').click(function(e) {--%>
<%--            $("#register-form").delay(100).fadeIn(100);--%>
<%--            $("#login-form").fadeOut(100);--%>
<%--            $('#login-form-link').removeClass('active');--%>
<%--            $(this).addClass('active');--%>
<%--            e.preventDefault();--%>
<%--        });--%>

<%--    });--%>

<%--</script>--%>
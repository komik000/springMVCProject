<%@ page import="kz.javaeee.db.Items" %>
<!doctype html>
<html lang="en">
<head>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <%
                Items item = (Items)request.getAttribute("item");
                if(item != null) {

            %>
                <%
                    String success = request.getParameter("success");
                    if(success!=null){
                %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    Item saved successfully
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%
                    }
                %>
                <%
                    String error = request.getParameter("error");
                    if(error!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Something went wrong
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%
                    }
                %>
                <form action="/edit" method="post">
                    <input type="hidden" name="id" value="<%=item.getId()%>">
                    <div class="form-group">
                        <label>
                            NAME:
                        </label>
                        <input type="text" name="name" class="form-control" value="<%=item.getName()%>">
                    </div>
                    <div class="form-group">
                        <label>
                            AMOUNT:
                        </label>
                        <input type="number" name="amount" class="form-control" value="<%=item.getAmount()%>">
                    </div>

                    <div class="form-group">
                        <label>
                            PRICE:
                        </label>
                        <input type="number" name="price" class="form-control" value="<%=item.getPrice()%>">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-success">
                            SAVE ITEM
                        </button>
                        <button type="button" class="btn btn-danger float-right" data-toggle="modal" data-target="#deleteItemMod">
                        REMOVE ITEM
                        </button>
                    </div>

                </form>

                <div class="modal fade" id="deleteItemMod" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form action="/delete" method="post">
                                <input type="hidden" name="id" value="<%=item.getId()%>">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Confirm Remove Process</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Are you sure?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                                    <button class="btn btn-primary">YES</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
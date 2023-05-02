<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.javaeee.db.Items" %>
<!doctype html>
<html lang="en">
    <head>
        <title>Title</title>
        <%@include file="vendor/head.jsp"%>
    </head>
    <body>
    <%@include file="vendor/navbar.jsp"%>
        <div class="container">
            <div class="row mt-5">
                <div class="col-sm-12">
                    <h4 class="mb-4">
                        CONTENTS OF <%=siteName%>
                    </h4>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>
                                   ID
                                </th>
                                <th>
                                    NAME
                                </th>
                                <th>
                                    AMOUNT
                                </th>
                                <th>
                                    PRICE
                                </th>
                                <th>
                                    DETAILS
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Items> items = (ArrayList<Items>) request.getAttribute("tovary");
                                if(items != null) {
                                    for(Items it : items) {

                            %>

                            <tr>
                                <td>
                                    <%
                                        out.print(it.getId());
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.print(it.getName());
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.print(it.getAmount());
                                    %>
                                </td>
                                <td>
                                    <%
                                        out.print(it.getPrice());
                                    %>
                                </td>
                                <td>
                                    <a href="/details?id=<%=it.getId()%>" class="btn btn-info btn-sm"> Details </a>
                                </td>
                            </tr>

                            <%
                                    }
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
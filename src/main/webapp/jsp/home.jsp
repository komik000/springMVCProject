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
                    <div style="height: 80px"></div>
                    <div class="kaspi-shop__title" style="font-size: 50px;font-weight: 500;text-align: center;">
                        Online-shop on Shop.kz
                    </div>
                    <div style="height: 50px"></div>
                    <div class="kaspi-shop__slider-wrapper" style="display: flex;flex-wrap: wrap;">
                        <a href="https://kaspi.kz/shop/c/smartphones%20and%20gadgets/?source=kaspikz" class="kaspi-shop__slider-item category-card" tabindex="0">
                          <span class="category-card__title">
                              Smartphone, <br> gadgets
                          </span>
                            <span class="category-card__image">
                              <img src="/img/products/iphone_gadget.png" srcset="/img/products/iphone_gadget.png 2x" alt="">
                          </span>
                        </a>
                        <a href="https://kaspi.kz/shop/c/computers/?source=kaspikz" class="kaspi-shop__slider-item category-card" tabindex="0">
                          <span class="category-card__title">
                              Computers
                          </span>
                            <span class="category-card__image">
                              <img src="/img/products/Computer.png" srcset="/img/products/Computer.png 2x" alt="">
                          </span>
                        </a>
                        <a href="https://kaspi.kz/shop/c/shoes/?source=kaspikz" class="kaspi-shop__slider-item category-card" tabindex="0">
                          <span class="category-card__title">
                              Shoes
                          </span>
                            <span class="category-card__image">
                              <img src="/img/products/Shoes1.png" srcset="/img/products/Shoes1.png 2x" alt="">
                          </span>
                        </a>
                        <a href="https://kaspi.kz/shop/c/fashion/?source=kaspikz" class="kaspi-shop__slider-item category-card" tabindex="0">
                          <span class="category-card__title">
                              Clothes
                          </span>
                            <span class="category-card__image">
                              <img src="/img/products/Clothes1.png" srcset="/img/products/Clothes1.png 2x" alt="">
                          </span>
                        </a>
                        <a href="https://kaspi.kz/shop/c/jewelry%20and%20bijouterie/all/?source=kaspikz" class="kaspi-shop__slider-item category-card" tabindex="0">
                          <span class="category-card__title">
                              Jewelers
                          </span>
                            <span class="category-card__image">
                              <img src="/img/products/Jewelry.png" srcset="/img/products/Jewelry.png 2x" alt="">
                          </span>
                        </a>
                        <a href="https://kaspi.kz/shop/c/sports%20and%20outdoors/?source=kaspikz" class="kaspi-shop__slider-item category-card" tabindex="0">
                          <span class="category-card__title">
                              Sport, <br> tourism
                          </span>
                            <span class="category-card__image">
                              <img src="/img/products/Sport1.png" srcset="/img/products/Sport1.png 2x" alt="">
                          </span>
                        </a>
                        <a href="https://kaspi.kz/shop/c/beauty%20care/?source=kaspikz" class="kaspi-shop__slider-item category-card" tabindex="0">
                          <span class="category-card__title">
                              Beauty, <br> health
                          </span>
                            <span class="category-card__image">
                              <img src="/img/products/Beauty1.png" srcset="/img/products/Beauty1.png 2x" alt="">
                          </span>
                        </a>
                        <a href="https://kaspi.kz/shop/c/pet%20goods/?source=kaspikz" class="kaspi-shop__slider-item category-card" tabindex="0">
                          <span class="category-card__title">
                              Products for <br> pets
                          </span>
                            <span class="category-card__image">
                              <img src="/img/products/Animals.png" srcset="/img/products/Animals.png 2x" alt="">
                          </span>
                        </a>
                        <a href="https://kaspi.kz/shop/c/gifts%20and%20party%20supplies/?source=kaspikz" class="kaspi-shop__slider-item category-card" tabindex="0">
                          <span class="category-card__title">
                              Gifts, product <br> for holidays
                          </span>
                            <span class="category-card__image">
                              <img src="/img/products/Holidays.png" srcset="/img/products/Holidays.png 2x" alt="">
                          </span>
                        </a>
                        <a href="https://kaspi.kz/shop/c/tv_audio/?source=kaspikz" class="kaspi-shop__slider-item category-card" tabindex="0">
                          <span class="category-card__title">
                              TV, Audio, <br> Video
                          </span>
                            <span class="category-card__image">
                              <img src="/img/products/TV.png" srcset="/img/products/TV.png 2x" alt="">
                          </span>
                        </a>

                    </div>
                    <div style="height: 80px"></div>
                </div>
            </div>
        </div>
        <%@include file="../vendor/footer.jsp"%>
    </body>
</html>
<style>
    .category-card {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 20px;
        height: 260px;
        max-width: 220px;
        min-width: 220px;
        box-sizing: border-box;
        transition: box-shadow .4s ease;
    }
    .category-card {
        border-radius: 16px;
        background: #fff;
    }
    kaspi-shop__slider-item:first-child, .kaspi-shop__slider-item:nth-child(6) {
        margin-left: 0;
    }
    .category-card__title {
        text-align: center;
        font-size: 20px;
        line-height: 23.44px;
        display: block;
        color: rgba(0,0,0,.88);
    }
    .category-card__image {
        display: block;
        margin-top: 5px;
    }
</style>
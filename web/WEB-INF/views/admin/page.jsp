<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-11-24
  Time: 오후 6:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="../includes/header2.jsp"%>

<div class="hero-wrap hero-bread" style="background-image: url('/resources/shop/images/bg_6.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="${root}">Home</a></span> <span>Shop</span></p>
                <h1 class="mb-0 bread">Admin Page</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="row mt-5">
        <div class="col-md-12 nav-link-wrap">
            <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">회원관리</a>

                <a class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">상품관리</a>

                <a class="nav-link ftco-animate" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">주문관리</a>

            </div>
        </div>
    </div>
    <div class="col-md-12 tab-wrap">

        <div class="tab-content bg-light" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                <div class="p-4">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">회원 이 름</th>
                            <th scope="col">회원 아이디</th>
                            <th scope="col">가입 일</th>
                            <th scope="col">회원 등급</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="member" items="${memberList}" varStatus="idx">
                        <tr>
                            <td>${idx.count}</td>
                            <td>${member.userName}</td>
                            <td>${member.userid}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}"/></td>
                            <td>${member.authList}</td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
                <div class="p-4">
                    <h3 class="mb-4">Manufactured By Nike</h3>
                    <p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didn’t take long until a few insidious Copy Writers ambushed her, made her drunk with Longe and Parole and dragged her into their agency, where they abused her for their.</p>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
                <div class="row p-4">
                    <div class="col-md-12">
                        <h3 class="mb-4">23 Reviews</h3>
                        <button type="button" class="btn btn-link btn-lg float-right" id="regBtn">리뷰작성</button>
                        <div class="review_wrapper">
                            <div class="review">
                                <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                                <div class="desc">
                                    <h4>
                                        <span class="text-left">Jacob Webb</span>
                                        <span class="text-right">14 March 2018</span>
                                    </h4>
                                    <p class="star">
                                                        <span>
                                                            <i class="ion-ios-star-outline"></i>
                                                            <i class="ion-ios-star-outline"></i>
                                                            <i class="ion-ios-star-outline"></i>
                                                            <i class="ion-ios-star-outline"></i>
                                                            <i class="ion-ios-star-outline"></i>
                                                        </span>
                                        <%-- <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>--%>
                                    </p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Review MODAL</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>별점</label>
                    <input id="input-21b" value="4" type="text" class="rating" data-min=0 data-max=5 data-step=0.5 data-size="lg"
                           required title="">
                    <div class="clearfix"></div>
                </div>
                <div class="form-group">
                    <label>리뷰 제목</label>
                    <input class="form-control" name="review_title" value="New Reply!!">
                </div>
                <div class="form-group">
                    <label>리뷰 본문</label>
                    <input class="form-control" name="review_content" value="New Reply!!">
                </div>
                <div class="form-group">
                    <label>작성자</label>
                    <input class="form-control" name="userid" value="replyer" readonly>
                </div>
                <div class="form-group">
                    <label>작성날짜</label>
                    <input class="form-control" name="review_date" value="">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlFile1">사진 첨부</label>
                    <input type="file" class="form-control-file" id="exampleFormControlFile1" multiple>
                </div>
            </div>
            <div class="modal-footer">
                <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
                <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
                <button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
                <button id="modalCloseBtn" type="button" class="btn btn-info">Close</button>
            </div>
        </div>
    </div>
</div>
<script src="/resources/shop/js/jquery.min.js"></script>
<script src="/resources/shop/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/shop/js/popper.min.js"></script>
<script src="/resources/shop/js/bootstrap.min.js"></script>
<script src="/resources/shop/js/jquery.easing.1.3.js"></script>
<script src="/resources/shop/js/jquery.waypoints.min.js"></script>
<script src="/resources/shop/js/jquery.stellar.min.js"></script>
<script src="/resources/shop/js/owl.carousel.min.js"></script>
<script src="/resources/shop/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/shop/js/aos.js"></script>
<script src="/resources/shop/js/jquery.animateNumber.min.js"></script>
<script src="/resources/shop/js/bootstrap-datepicker.js"></script>
<script src="/resources/shop/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/shop/js/google-map.js"></script>
<script src="/resources/shop/js/main.js"></script>

<%@ include file="../includes/footer.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-06
  Time: 오후 4:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}/"/>
<%@ include file="../includes/header2.jsp" %>

<br/><br/><br/><br/>

<section id="home-section" class="d-flex justify-content-center col-lg-12">

<div class="col-lg-9">
    <div class="row">
        <div class="col align-content-center">
            <div class="card">
                <div class="card-header">
                    Board
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <form action="/board/register" method="post">
                            <input type="hidden" name="pageNum" value="${cri.pageNum}">
                            <input type="hidden" name="amount" value="${cri.amount}">
                            <div class="form-group">
                                <label for="bno">bno</label>
                                <input type="text" class="form-control" placeholder="Enter title" name="bno" id="bno"
                                       value="<c:out value='${board.bno}'/>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="title">title</label>
                                <input type="text" class="form-control" placeholder="Enter title" name="title"
                                       id="title" value="<c:out value='${board.title}'/>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="regDate">date</label>
                                <input type="text" class="form-control" name="regDate" id="regDate"
                                       value="<fmt:formatDate pattern="yyyy-MM-dd" value='${board.regDate}'/>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="content">content</label>
                                <textarea class="form-control" name="content" id="content" readonly><c:out
                                        value="${board.content}"/></textarea>
                            </div>
                            <div class="form-group">
                                <label for="writer">writer</label>
                                <input type="text" class="form-control" placeholder="Enter writer" name="writer"
                                       id="writer" value="<c:out value='${board.writer}'/>" readonly>
                            </div>
                        </form>

                        <a href="/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}">
                            <button id="listBtn" type="button" class="btn btn-info">목록</button>
                        </a>
                        <a href="/board/modifyForm?bno=${board.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}"
                           class="float-right">
                            <button id="modBtn" type="button" class="btn btn-danger">수정</button>
                        </a>&nbsp; &nbsp; &nbsp;
                        <button id="removeBtn" type="button" class="btn btn-warning">삭제</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</section>


    <br/><Br/>


<section id="home-section" class="d-flex justify-content-center col-lg-12">

    <div class="col-lg-9">
        <div>
            <div class="card">
                <div class="card-header">
                    <span class="lnr lnr-bubble"> Comments</span>&nbsp;<span id="replyCnt" class="badge badge-info">${board.replyCnt}</span>
                    <button class="btn btn-link float-right" id="regBtn">New</button>
                </div>
                <div class="card-body">
                    <ul class="chat list-group-flush">
                        <li class="left clearfix" data-rno='12'>
                            <div>
                                <div class="header">
                                    <strong class="font-weight-bold">user00</strong>
                                    <small class="float-right text-muted">2020-10-12</small>
                                </div>
                                <p>Good Job</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="card-footer">

                </div>
            </div>

        </div>
            <div class="float-right">

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
                <h4 class="modal-title" id="myModalLabel">Comments MODAL</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Reply</label>
                    <input class="form-control" name="reply" value="New Reply!!">
                </div>
                <div class="form-group">
                    <label>Replyer</label>
                    <input class="form-control" name="replyer" value="replyer" readonly>
                </div>
                <div class="form-group">
                    <label>ReplyDate</label>
                    <input class="form-control" name="replyDate" value="">
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
<br/>

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
<script type="text/javascript" src="/resources/reply.js"></script>
<script>
    var bnoValue = '<c:out value="${board.bno}"/>';

</script>
<script>
    $(document).ready(function () {

        $("#removeBtn").on("click", function () {
            formObj.attr("action", "/board/remove");

            formObj.submit();
        });

        var formObj = $("form");

        var bnoValue = '${board.bno}';
        var replyUL = $(".chat");

        showList(1);

        function showList(page) {

            replyService.getList({bno: bnoValue, page: page || 1}, function (replyCnt, list) {

                console.log("replyCnt : " + replyCnt);
                console.log("list :" + list);
                console.log(list);

                if (page == -1) {
                    var pageNum = Math.ceil(replyCnt / 10.0);
                    showList(pageNum);
                    return;
                }

                var str = "";
                if (list == null || list.length == 0) {
                    return;
                }
                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str += "<li class='list-group-item' data-rno='" + list[i].rno + "'>";
                    str += "  <div><div class='header'><strong class='font-weight-bold'>" + list[i].replyer + "</strong>";
                    str += "    <small class='float-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
                    str += "    <p>" + list[i].reply + "</p></div></li>";
                }

                replyUL.html(str);

                showReplyPage(replyCnt);
            });
        }

        var modal = $(".modal");
        var modalInputReply = modal.find("input[name='reply']");
        var modalInputReplyer = modal.find("input[name='replyer']");
        var modalInputReplyDate = modal.find("input[name='replyDate']");

        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalRegisterBtn = $("#modalRegisterBtn");

        var replyer = null;

        <sec:authorize access="isAuthenticated()">
            replyer = '<sec:authentication property="principal.member.userid"/>';
        </sec:authorize>


        // Ajax spring security header.
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
        });

        $("#regBtn").on("click", function (e) {

            <sec:authorize access="isAuthenticated()">
            modal.find("input").val("");
            modal.find(modalInputReplyer).val("<sec:authentication property='principal.member.userid'/>");
            modalInputReplyDate.closest("div").hide();
            modal.find("button[id != 'modalCloseBtn']").hide();

            modalRegisterBtn.show();

            $(".modal").modal("show");

            return ;
            </sec:authorize>

            alert("로그인 해주세요");
        });



        modalRegisterBtn.on("click", function (e) {

            reply = {
                reply: modalInputReply.val(),
                replyer: modalInputReplyer.val(),
                bno: bnoValue,
            };

            replyService.add(reply, function (result) {
                alert(result);

                modal.find("input").val("");
                modal.modal("hide");

                showList(-1);
            });

            replyService.getReplyCnt(bnoValue, function (result) {
                $("#replyCnt").html(result);
            });
        });

        $(".chat").on("click", "li", function (e) {

            var rno = $(this).data("rno");

            replyService.get(rno, function (reply) {

                modalInputReply.val(reply.reply);
                modalInputReplyer.val(reply.replyer);
                modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
                modal.data("rno", reply.rno);

                modal.find("button[id != 'modalCloseBtn']").hide();
                modalModBtn.show();
                modalRemoveBtn.show();

                $(".modal").modal("show");
            });
        });

        modalModBtn.on("click", function (e) {


            var reply = {
                rno: modal.data("rno"),
                reply: modalInputReply.val()
            };

            if (!replyer) {
                alert("로그인 후 다시 시도해주세요.");
                modal.modal("hide");
                return ;
            }

            var originalReplyer = modalInputReplyer.val();

            if (replyer != 'admin' && replyer != originalReplyer ) {
                alert("권한이 없습니다.");
                modal.modal("hide");
                return ;
            }

            replyService.update(reply, function (result) {

                alert(result);
                modal.modal("hide");
                showList(1);
            });
        });

        modalRemoveBtn.on("click", function (e) {
            var rno = modal.data("rno");

            console.log(rno);
            console.log(replyer);

            if (!replyer) {
                alert("로그인 후 시도해주세요.");
                modal.modal("hide");
                return ;
            }

            var originalReplyer = modalInputReplyer.val();

            console.log("Original Replyer : " + originalReplyer);  // 댓글 원 작성자

            if (replyer != originalReplyer) {
                alert("권한이 없습니다.");
                modal.modal("hide");
                return ;
            }

            replyService.remove(rno, originalReplyer, function (result) {
                alert(result);
                modal.modal("hide");
                showList(-1);

            });
        });

        var pageNum = 1;
        var replyPageFooter = $(".card-footer");

        function showReplyPage(replyCnt) {

            var endNum = Math.ceil(pageNum / 10.0) * 10;
            var startNum = endNum - 9;

            var prev = startNum != 1;
            var next = false;

            if (endNum * 10 >= replyCnt) {
                endNum = Math.ceil(replyCnt / 10.0);
            }

            if (endNum * 10 < replyCnt) {
                next = true;
            }

            var str = "<ul class='pagination float-right'>";

            if (prev) {
                str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1)+"'>Previous</a></li>";
            }

            for (var i = startNum; i <= endNum; i++) {

                var active = pageNum == i ? "active" : "";

                str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
            }

            if (next) {
                str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
            }

            str += "</ul></div>";

            console.log(str);

            replyPageFooter.html(str);
        }

        replyPageFooter.on("click", "li a", function (e) {
            e.preventDefault();

            var targetNum = $(this).attr("href");

            console.log("targetPageNum = " + targetNum);

            pageNum = targetNum;

            showList(pageNum);
        });

    });
</script>


<br/><br/>

<%@ include file="../includes/footer.jsp" %>
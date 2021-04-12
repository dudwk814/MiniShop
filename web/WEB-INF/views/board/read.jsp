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
<%@ include file="../includes/header.jsp" %>


<br/><br/><br/><br/>

<section id="home-section" class="d-flex justify-content-center col-lg-12">

    <div class="col-lg-9">
        <div class="row">
            <div class="col-lg-12">
                <div class="card border-white">
                    <div class="card-header bg-transparent">
                        <strong><h1><c:out value="${board.title}"/></h1></strong>
                        <small class="card-title">
                            &nbsp;<c:out value="${board.writer}"/>&nbsp; | &nbsp;<fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd. H:m"/>
                        </small>
                    </div>
                    <div class="card-body" style="border-bottom: 0px;">
                        <article class="content-area">
                            <c:out value="${board.content}" escapeXml="false"/>
                        </article>
                    </div>
                    <div class="card-body bg-transparent">
                        <a href="/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}">
                            <button id="listBtn" type="button" class="btn btn-outline-secondary">목록</button>
                        </a>
                        <sec:authorize access="isAuthenticated()">
                            <c:if test="${board.writer == userid}">


                                <div class="float-right dropdown">
                                    <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black;">
                                        <i class="fa fa-gear fa-lg" data-toggle="tooltip" data-placement="bottom" title="게시물 메뉴"></i>
                                    </a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li>
                                            <a href="#" id="modBtn" style="color: black;">
                                                &nbsp; <i class="fa fa-edit fa-fw"></i>   수정
                                            </a>
                                        </li>
                                        <li>
                                            <a id="removeBtn" href="#" style="color: black;">
                                                &nbsp; <i class="fa fa-trash-o fa-fw"></i>  삭제
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </c:if>

                        </sec:authorize>
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
                <sec:authorize access="isAnonymous()">
                    <div class="card-header">
                        <span class="lnr lnr-bubble"> 비회원은 댓글을 작성할 수 없습니다. <a href="#" class="loginBtn"> [로그인]</a></span>
                    </div>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <div class="card-header">
                        <span class="lnr lnr-bubble"> Comments</span>&nbsp;<span id="replyCnt"
                                                                                 class="badge badge-info">${board.replyCnt}</span>
                    </div>
                </sec:authorize>

                <div class="card-body">
                    <ul class="chat list-group-flush">

                    </ul>
                    <div class="form-group">
                        <details>
                            <summary>
                                <sec:authorize access="isAnonymous()">
                                    <strong>비회원은 댓글을 작성할 수 없습니다. <a href="#" class="loginBtn"> [로그인]</a> </strong>
                            </summary><br/>
                                </sec:authorize>


                            <sec:authorize access="isAuthenticated()">
                                    <strong>댓글 작성</strong>
                                </summary><br/>

                                    <input type="text" class="form-control" name="reply" id="replyContent" placeholder="댓글을 작성해주세요.">
                            </sec:authorize>
                            <a href="#" class="btn btn-link float-right replyRegBtn">등록</a>
                        </details>
                    </div>
                </div>
                <div class="card-footer reply-footer d-flex justify-content-center">

                </div>
            </div>

        </div>
    </div>
</section>

<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Comments MODAL</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>댓글</label>
                    <input class="form-control" name="reply" value="New Reply!!">
                </div>
                <div class="form-group">
                    <label>작성자</label>
                    <input class="form-control-plaintext" name="replyer" value="replyer" readonly>
                </div>
                <div class="form-group">
                    <label>작성일</label>
                    <input class="form-control-plaintext" name="replyDate" value="">
                </div>
            </div>
            <div class="modal-footer">
                <button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
                <button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
                <button id="modalRegisterBtn" type="button" class="btn btn-primary">등록</button>
                <button id="modalCloseBtn" type="button" class="btn btn-info">닫기</button>
            </div>
        </div>
    </div>
</div>
<br/>

<script>
    var bnoValue = '<c:out value="${board.bno}"/>';



</script>


<script>
    $(document).ready(function () {

        <!-- Bootstrap Tooltips -->
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        });

        // 게시글 작성자
        var writer = '<c:out value="${board.writer}"/>';

        <sec:authorize access="isAuthenticated()">
            var userid = '<sec:authentication property="principal.member.userid"/>';
        </sec:authorize>



        <!-- 게시글 수정 버튼 클릭 시 /board/modifyForm으로 이동 -->
        $("#modBtn").on("click", function (e) {
            //create element (form)
            var modForm = $('<form></form>');
            modForm.attr("name","modForm");
            modForm.attr("method","post");
            modForm.attr("action","/board/modifyForm");

            modForm.append($('<input/>', {type: 'hidden', name: 'bno', value:'<c:out value="${board.bno}"/>'}));
            modForm.append($('<input/>', {type: 'hidden', name: 'pageNum', value:'<c:out value="${cri.pageNum}"/>'}));
            modForm.append($('<input/>', {type: 'hidden', name: 'amount', value:'<c:out value="${cri.amount}"/>'}));
            modForm.append($('<input/>', {type: 'hidden', name: 'type', value:'<c:out value="${cri.type}"/>'}));
            modForm.append($('<input/>', {type: 'hidden', name: 'keyword', value:'<c:out value="${cri.keyword}"/>'}));
            modForm.append($('<input/>', {type: 'hidden', name: '${_csrf.parameterName}', value:'${_csrf.token}'}));

            modForm.appendTo('body');
            modForm.submit();

        });


        <!-- 삭제 버튼 클릭 시 게시글 삭제 -->
        $("#removeBtn").on("click", function () {

            <sec:authorize access="isAnonymous()">
            alert("로그인 후 이용가능합니다.");
            return;
            </sec:authorize>

            var removeForm = $('<form></form>');
            removeForm.attr("name","removeForm");
            removeForm.attr("method","post");
            removeForm.attr("action","/board/remove");

            removeForm.append($('<input/>', {type: 'hidden', name: 'bno', value:'<c:out value="${board.bno}"/>'}));
            removeForm.append($('<input/>', {type: 'hidden', name: 'pageNum', value:'<c:out value="${cri.pageNum}"/>'}));
            removeForm.append($('<input/>', {type: 'hidden', name: 'amount', value:'<c:out value="${cri.amount}"/>'}));
            removeForm.append($('<input/>', {type: 'hidden', name: 'type', value:'<c:out value="${cri.type}"/>'}));
            removeForm.append($('<input/>', {type: 'hidden', name: 'keyword', value:'<c:out value="${cri.keyword}"/>'}));
            removeForm.append($('<input/>', {type: 'hidden', name: '${_csrf.parameterName}', value:'${_csrf.token}'}));

            removeForm.appendTo('body');

            if (userid == writer || userid == 'admin') {
                if (confirm("글을 삭제하시겠습니까?") == true) {

                    removeForm.submit();
                } else {
                    return;
                }
            } else {
                alert("작성자 본인만 삭제할 수 있습니다.");
                return;
            }

        });

        var formObj = $("#form");

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

                if (replyCnt == 0) {
                    replyUL.html("");
                    return;
                }

                var str = "";
                if (list == null || list.length == 0) {
                    return;
                }
                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str += "<li class='list-group-item' data-rno='" + list[i].rno + "' data-replyer = '" + list[i].replyer + "'>";
                    str += "  <div><div class='header'><strong class='font-weight-bold'>" + list[i].replyer + "</strong>";
                    str += "    <small class='float-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
                    str += "    <p>" + list[i].reply + "</p></div></li>";
                }

                replyUL.html(str);

                showReplyPage(replyCnt);
            });
        }

        var modal = $("#replyModal");
        var modalInputReply = modal.find("input[name='reply']");
        var modalInputReplyer = modal.find("input[name='replyer']");
        var modalInputReplyDate = modal.find("input[name='replyDate']");

        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalRegisterBtn = $("#modalRegisterBtn");
        var modalCloseBtn = $("#modalCloseBtn");



        var replyer = null;

        <sec:authorize access="isAuthenticated()">
        replyer = '<sec:authentication property="principal.member.userid"/>';
        </sec:authorize>

        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";


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

            modal.modal("show");

            return;
            </sec:authorize>

            alert("로그인 해주세요");
        });

        <!-- 리뷰 등록 버튼 클릭 이벤트 (리뷰 등록) -->
        $(".replyRegBtn").on("click", function (e) {
            e.preventDefault();

            var replyContent = $("#replyContent");

            if (replyContent.val().trim() == '') {
                alert("댓글을 작성해주세요.");
                return;
            }

            reply = {
                reply : replyContent.val(),
                replyer : replyer,
                bno : bnoValue
            };

            replyService.add(reply, function (result) {
                alert(result);

                replyContent.val("");

                showList(1);

            });

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

            var replyer = $(this).data("replyer");

            <sec:authorize access="isAnonymous()">
                return;
            </sec:authorize>

            if (replyer == userid) {

                replyService.get(rno, function (reply) {

                    modalInputReply.val(reply.reply);
                    modalInputReplyer.val(reply.replyer);
                    modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
                    modal.data("rno", reply.rno);

                    modal.find("button[id != 'modalCloseBtn']").hide();
                    modalModBtn.show();
                    modalRemoveBtn.show();

                    modal.modal("show");
                });
            } else {
                return;
            }
        });

        modalModBtn.on("click", function (e) {


            var reply = {
                rno: modal.data("rno"),
                reply: modalInputReply.val()
            };

            if (!replyer) {
                alert("로그인 후 다시 시도해주세요.");
                modal.modal("hide");
                return;
            }

            var originalReplyer = modalInputReplyer.val();

            if (replyer != 'admin' && replyer != originalReplyer) {
                alert("권한이 없습니다.");
                modal.modal("hide");
                return;
            }

            replyService.update(reply, function (result) {

                alert(result);
                modal.modal("hide");
                showList(1);
            });
        });

        modalCloseBtn.on("click", function (e) {
            modal.modal("hide");
        });

        modalRemoveBtn.on("click", function (e) {
            var rno = modal.data("rno");

            console.log(rno);
            console.log(replyer);

            if (!replyer) {
                alert("로그인 후 시도해주세요.");
                modal.modal("hide");
                return;
            }

            var originalReplyer = modalInputReplyer.val();

            console.log("Original Replyer : " + originalReplyer);  // 댓글 원 작성자

            if (replyer != originalReplyer) {
                alert("권한이 없습니다.");
                modal.modal("hide");
                return;
            }

            replyService.remove(rno, originalReplyer, function (result) {
                alert(result);
                modal.modal("hide");
                showList(1);

            });
        });

        var pageNum = 1;
        var replyPageFooter = $(".reply-footer");

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

            var str = "<ul class='pagination'>";

            if (prev) {
                str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
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
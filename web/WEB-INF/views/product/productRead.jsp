<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-27
  Time: 오후 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="../includes/header.jsp"%>



<div class="col-lg-9">

    <div class="col-lg-6" style="width: 22rem;">
        <img class="card-img-top" src="/resources/shop/image/product/${product.product_url}">
    </div>

    <p>제품 명 : ${product.product_name}</p>
    <p>가격 : ₩ ${product.product_price}원</p>
    ${product.product_desc}
</div>



    <hr/>


    <div class="row">



        <c:forEach var="pList" items="${pList}">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <a href="/product/read?product_id=${pList.product_id}"><img class="card-img-top" src="/resources/shop/image/product/${pList.product_url}" alt=""></a>
                    <div class="card-body">
                        <h5 class="card-title">
                            <a href="/product/read?product_id=${pList.product_id}">${pList.product_name}</a>
                        </h5>
                        <h5><fmt:formatNumber type="currency" value="${pList.product_price}" currencySymbol="₩"/></h5>
                    </div>
                </div>
            </div>
        </c:forEach>


    </div>
    <!-- /.row -->

</div>
<!-- /.col-lg-9 -->

</div>
<!-- /.row -->

</div>
<!-- /.container -->

<%@ include file="../includes/footer.jsp"%>
console.log("Review Module......");

var reviewService = (function (){

    // 리뷰 등록
    function add(review, callback, error) {
        console.log("add review");

        $.ajax({
            type : 'post',
            url : '/review/new',
            data : JSON.stringify(review),
            contentType : "application/json; charset=utf-8",
            success : function (result, status, xhr) {
                if(callback) {
                    callback(result)
                }
            },
            error : function (xhr, status, er) {
                if(error) {
                    error(er);
                }
            }
        });
    };

    // 리뷰 목록 조회
    function getList(param, callback, error) {

        var product_id = param.product_id;

        var page = param.page || 1;

        $.getJSON("/review/pages/" + product_id + "/" + page + ".json",
            function (data) {
                if(callback) {
                   // callback(data);
                    callback(data.reviewCnt, data.list);
                }
            }).fail(function (xhr, status, err) {
            if(error) {
                error();
            }
        });

        };

    // 리뷰 삭제
    function remove(review_no, callback, error) {
        $.ajax({
            type: 'delete',
            url : '/review/' + review_no,
            success : function (deleteResult, status, xhr) {
                if (callback) {
                    callback(deleteResult);
                }
            },
            error : function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    };

    // 리뷰 수정
    function update(review, callback, error) {

        console.log("review_no : " + review.review_no);

        $.ajax({
            type : 'put',
            url : '/review/' + review.review_no,
            data : JSON.stringify(review),
            contentType: "application/json; charset=utf-8",
            success : function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error : function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    };

    // 리뷰 작성 시간 (당일이면 시간, 아니면 날짜)
    function displayTime(timeValue) {

        var today = new Date();

        var gap = today.getTime() - timeValue;

        var dateObj = new Date(timeValue);
        var str = "";

        if (gap < (1000 * 60 * 60 * 24)) {

            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();

            return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
                ':', (ss > 9 ? '' : '0') + ss ].join('');

        } else {
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
            var dd = dateObj.getDate();

            return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
                (dd > 9 ? '' : '0') + dd ].join('');
        }
    };

    // 리뷰 조회
    function get(review_no, callback, error) {
        $.get("/review/" + review_no + ".json", function (result) {
          if(result) {
              callback(result);
          }
        }).fail(function (xhr, status, err) {
            if (error) {
                error();
            }
        });
    };



    return {
        add:add,
        getList : getList,
        remove : remove,
        update : update,
        get : get,
        displayTime : displayTime
    };
})();
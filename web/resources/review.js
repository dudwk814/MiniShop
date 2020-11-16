console.log("Review Module......");

var reviewServie = (function (){

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
        })
    }

    function getList(param, callback, error) {

        var product_id = param.product_id;

        var page = param.page || 1;

        $.getJSON("/review/pages/" + product_id + "/" + page + ".json",
            function (data) {
                if(callback) {
                    callback(data);
                }
            }).fail(function (xhr, status, err) {
            if(error) {
                error();
            }
        });

        }

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
    }

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
    }

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
    }

    return {
        add:add,
        getList : getList,
        remove : remove,
        update : update,
        get : get
    };
})();
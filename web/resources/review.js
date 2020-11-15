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

    return {
        add:add
    };
})();
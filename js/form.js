$(function () {
    form.init();
});

var form = (function () {

    var set = function (el) {
        var form = el;

        $.ajax({
            url: 'mail.php',
            method: 'POST',
            data: {
                input: form.serialize()
            }
        }).done(function(data) {
            console.log(data);
        });
    };

    return {
        init : function () {
            $('#order-form').on('submit', function(e) {
                set($(this));
                return false;
            });
        }
    }
})();
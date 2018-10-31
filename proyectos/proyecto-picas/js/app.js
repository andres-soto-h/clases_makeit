nuevo_juego();

$(document).on("click", "#new-game", function () {
    location.reload();
});

function nuevo_juego() {

    gues_num = rand_between();
    console.log(gues_num);

    $('table tbody').html('')

    $(document).keypress(function (e) {
        if (e.which == 13) {

            e.preventDefault();
            num = $('.box').val()

            

            if (num.length == 4 && !validate_number(num)) {
                var results = picas_fijas(gues_num, num);
                $('table tbody').prepend('<tr><td>' + num + '</td><td>' + results.picas + '</td><td>' + results.fijas + '</td></tr>')
                $('.box').val('')
                if (results.fijas == 4) {
                    $('.box').blur()
                    $("#overlay").show()
                }
            } else {
                
                $("#box-container").effect("shake")
            }
        }
    });

    $(document).on('keyup', '.box', function (e) {
        var num = $('.box').val()
        if (num.length > 4 || validate_number(num)) {
            $(".box").addClass("is-invalid");
            $("#error").addClass("error");
        } else {
            $(".box").removeClass("is-invalid");
            $("#error").removeClass("error");
        }
    });

    function validate_number(numero) {
        return (/([0-9]).*?\1/).test(numero)
    }

    function rand_between() {
        var rand = Math.floor(Math.random() * 8999) + 1000
        if (validate_number(rand)) {
            return rand_between()
        } else {
            return rand
        }
    }

    function picas_fijas(rand, usr) {
        var arr_usr = String(rand).split('').map(Number);
        var arr_rand = usr.split('').map(Number);

        var picas = 0
        var fijas = 0

        function results(a, b) {
            this.picas = a;
            this.fijas = b;
        }

        for (i = 0; i < 4; i++) {
            for (j = 0; j < 4; j++) {
                if (arr_usr[i] == arr_rand[j] && i == j) {
                    fijas += 1
                } else if (arr_usr[i] == arr_rand[j]) {
                    picas += 1
                }
            }
        }

        return new results(picas, fijas);
    }

}
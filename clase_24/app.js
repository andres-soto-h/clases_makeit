function getDogs() {

    //var requestJquery =$.get('https://dog.ceo/api/breed/african/images')
    event.preventDefault()
    var selector = document.getElementById('dogBreeds');
    var value = selector[selector.selectedIndex].value;

    var requestAjax = $.ajax({
        method: "GET",
        url: "https://dog.ceo/api/breed/" + value + "/images"
    })

    requestAjax.done(function (data) {

        var json = JSON.stringify(data);
        var obj = JSON.parse(json);
        i = 0;

        $('.img-container').html('')

        while (i < obj.message.length) {
            $('.img-container').append('<a href=' + obj.message[i] + ' target="_blanck"><img class="images" width="200" height="200" src=' + obj.message[i] + '></a>');
            i += 1;

            if (i == 10) {
                break;
            }
        }

    }).fail(function (data) {
        console.log("Algo salió mal");
        console.log(data);
    }).always(function () {
        console.log("Siempre ejecuta jquery")
    });

}
function countdown(inputDate, artworkId) {
    console.log("Countdown function loaded for artwork:", artworkId);
    var countDownDate = new Date(inputDate).getTime();

    var x = setInterval(function() {
        var now = new Date().getTime();
        var distance = countDownDate - now;

        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        var countdownElement = document.getElementById("countdown-" + artworkId);
        if (countdownElement) {
            countdownElement.innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s ";
        }

        if (distance < 0) {
            clearInterval(x);
            if (countdownElement) {
                countdownElement.innerHTML = "ENDED";
            }
        }
    }, 1000);
}

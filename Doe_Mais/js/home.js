/*--Aumentando os números--*/

var executou = false;
$(window).scroll(function () {
    if (!executou && $('#homepgn').height()) {
        window.onload = aumentar();
        function aumentar() {
            var itens = document.getElementById('lblObjetos');
            var itensmax = document.getElementById('lblObjetos').innerHTML;
            var doacao = document.getElementById('lblDoados');
            var doacaomax = document.getElementById('lblDoados').innerHTML;

            for (var i = 0; i <= itensmax; i++) {
                setTimeout(function (nr) {
                    itens.innerHTML = nr;
                }, i * 2000 / itensmax, i);
            }

            for (var i = 0; i <= doacaomax; i++) {
                setTimeout(function (nr) {
                    doacao.innerHTML = nr;
                }, i * 2000 / doacaomax, i);
            }
        };
        executou = true;
    }
});

/*--x--*/

function x() {
    document.getElementById("Su1").style.display = "none";
}
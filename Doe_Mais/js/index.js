/*--Aumentando os números--*/

var executou = false;
$(window).scroll(function () {
    if (!executou && $('#itens').height()) {
        window.onload = aumentar();
        function aumentar() {
            var itens = document.getElementById('lblItens');
            var itensmax = document.getElementById('lblItens').innerHTML;
            var doacao = document.getElementById('lblDoacao');
            var doacaomax = document.getElementById('lblDoacao').innerHTML;

            for (var i = 0; i <= itensmax; i++) {
                setTimeout(function (nr) {
                    itens.innerHTML = nr;
                }, i * 2500 / itensmax, i);
            }

            for (var i = 0; i <= doacaomax; i++) {
                setTimeout(function (nr) {
                    doacao.innerHTML = nr;
                }, i * 2500 / doacaomax, i);
            }
        };
        executou = true;
    }
});
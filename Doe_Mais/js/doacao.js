/*----Validar antes de enviar-----*/
function validardoacao() {
    if (document.getElementById("txtdata").value == "") {
        document.getElementById("lblErData").innerText = "Escolha uma data";
        return false;
    } else {
        document.getElementById("lblErData").innerText = "";
    }

    var txt = document.getElementsByClassName('txtdoar');
    var x = 0;

    for (var i = 0; i < txt.length; i++) {
        var numeros = txt[i].value;

        if (!$.isNumeric(numeros)) {
            x++;
        }
    }

    if (x == txt.length) {
        document.getElementById("lblItens").innerText = "Quantidades incorretas";
        return false;
    } else {
        document.getElementById("lblItens").innerText = "";
    }
    return true;
}

/*----Bloqueando as letras-----*/
function somenteNumeros(num) {
    var er = /[^0-9.]/;
    er.lastIndex = 0;
    var campo = num;
    if (er.test(campo.value)) {
        campo.value = "";
    }
}

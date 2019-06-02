/*---------------- validar contato ------------------------*/
function contato() {
    if (document.getElementById("txtNomeContato") == "" || document.getElementById("txtNomeContato").value.length < 8) {
        document.getElementById("txtNomeContato").focus();
        document.getElementById("lblErNomeContato").innerHTML = "Digite seu nome completo";
        return false;
    } else {
        document.getElementById("lblErNomeContato").innerHTML = "";
    }
    if (document.getElementById("txtEmailContato") == "" || document.getElementById("txtEmailContato").value.length < 10) {
        document.getElementById('lblErEmailContato').innerHTML = "E-mail inválido";
        document.getElementById('txtEmailContato').focus();
        return false;
    } else if (document.getElementById("txtEmailContato").value.search("@") == -1) {
        document.getElementById('lblErEmailContato').innerHTML = 'E-mail faltando "@"';
        document.getElementById('txtEmailContato').focus();
        return false;
    } else if (document.getElementById("txtEmailContato").value.indexOf(".") == -1) {
        document.getElementById('lblErEmailContato').innerHTML = 'E-mail faltando "."';
        document.getElementById('txtEmailContato').focus();
        return false;
    } else {
        document.getElementById('lblErEmailContato').innerHTML = "";
    }
    if (document.getElementById("txtMensagemContato") == "" || document.getElementById("txtMensagemContato").value.length < 30) {
        document.getElementById("txtMensagemContato").focus();
        document.getElementById("lblErMensagemContato").innerHTML = "A mensagem deve conter mais de 30 caracteres";
        return false;
    } else {
        document.getElementById('lblErEmailContato').innerHTML = "";
    }
    return true;
}



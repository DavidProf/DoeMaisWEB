/*----Validando campos-----*/
function recuperar() {
    if (document.getElementById("txtEmail").value == "" || document.getElementById("txtEmail").value.indexOf("@") == -1 ||
        document.getElementById("txtEmail").value.indexOf(".") == -1 || document.getElementById('lblErEmail').innerText.length >= 1) {
        document.getElementById('txtEmail').focus();
        return false;
    }
    return true;
}

function senharecuperar() {
    if (document.getElementById("txtSenha").value == "" || document.getElementById("txtSenha").value.length < 6) {
        document.getElementById('txtSenha').focus();
        return false;
    } else if (document.getElementById("txtSenha").value != document.getElementById("txtSenha1").value) {
        document.getElementById('txtSenha1').focus();
        return false;
    }
    return perguntaRecuperar();
    return true;
}
/*--------------------Pergunta--------------------------*/
function perguntaRecuperar() {
    if (document.getElementById("txtResposta").value == "" || document.getElementById("txtResposta").value.length < 2) {
        document.getElementById('txtResposta').focus;
        document.getElementById('lblErResp').innerHTML = "Resposta inválida";
        return false;
    }
}

/*--------------------Senha--------------------------*/
function senha() {

    var senha = document.getElementById("txtSenha").value;
    var Senha1 = document.getElementById("txtSenha1").value;

    if (senha.length >= 8 && senha.match(/[a-z]+/) && senha.match(/[A-Z]+/) && senha.match(/[\d]/)) {
        document.getElementById('lblErSenha').innerHTML = "";
        document.getElementById('txtSenha').style.borderBottom = "solid 2px #3870c9";
        document.getElementById('txtSenha1').style.borderBottom = "solid 2px #3870c9";
    }
    else {
        document.getElementById("lblErSenha").innerHTML = "Senha fora do padrão";
        document.getElementById('txtSenha').style.borderBottom = "solid 2px red";
        document.getElementById('txtSenha').focus();
        return false;
    }

    if (Senha1.localeCompare(senha)) {
        document.getElementById('lblErSenha').innerHTML = "Senhas diferentes";
        document.getElementById('txtSenha').style.borderBottom = "solid 2px red";
        document.getElementById('txtSenha1').style.borderBottom = "solid 2px red";
        return false;
    }
    else {
        document.getElementById('lblErSenha').innerHTML = "";
        document.getElementById('txtSenha').style.borderBottom = "solid 2px #3870c9";
        document.getElementById('txtSenha1').style.borderBottom = "solid 2px #3870c9";
    }
    return true;
}

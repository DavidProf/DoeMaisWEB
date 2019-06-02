/*------------------------BLUR---------------------------*/
$(document).ready(function () {

    $("#txEmail").blur(function () {
        var Email = $(this).val().trim();

        if (Email == "" || Email.length < 10) {
            document.getElementById('lblErrEmail').innerHTML = "Email inválido";
            document.getElementById("txEmail").style.borderBottom = "solid 2px red";
            return;
        } else {
            if (Email.search("@") == -1) {
                document.getElementById('lblErrEmail').innerHTML = 'Email faltando "@"';
                document.getElementById('txEmail').style.borderBottom = "solid 2px red";
                return;
            }
            else if (Email.indexOf('.') == -1) {
                document.getElementById('lblErrEmail').innerHTML = 'Email faltando "."';
                document.getElementById('txEmail').style.borderBottom = "solid 2px red";
                return;
            }
            else {
                document.getElementById('lblErrEmail').innerHTML = "";
                document.getElementById('txEmail').style.borderBottom = "solid 2px #3870c9";
            }
        }

    });

    $("#txtSenhaLog").blur(function () {
        var Senha = $(this).val().trim();

        if (Senha == "" || Senha.length < 8) {
            document.getElementById('lblErrSenha').innerHTML = "Senha incorreta";
            document.getElementById('txtSenhaLog').style.borderBottom = "solid 2px red";
        }
        else {
            document.getElementById('lblErrSenha').innerHTML = "";
            document.getElementById('txtSenhaLog').style.borderBottom = "solid 2px #3870c9";
        }
    });
});


/*------------JS-------------------------- */
function logarusuario() {

    var email = document.getElementById("txEmail").value;
    var senha = document.getElementById("txtSenhaLog").value;

    if (email.length < 1 || email.indexOf("@") == -1 || email.indexOf(".") == -1 || document.getElementById('lblErrEmail').innerText.length >= 1) {
        document.getElementById('lblErrEmail').innerHTML = "Insira um e-mail válido";
        document.getElementById('txEmail').style.borderBottom = "solid 2px red";
        return false;
    } else {
        document.getElementById('lblErrEmail').innerHTML = "";
        document.getElementById('txEmail').style.borderBottom = "solid 2px #3870c9";

        if (senha.length >= 8 && senha.match(/[a-z]+/) && senha.match(/[A-Z]+/) && senha.match(/[\d]/)) {
            document.getElementById('lblErrSenha').innerHTML = "";
            document.getElementById('txtSenhaLog').style.borderBottom = "solid 2px #3870c9";
            return true;
        }
        else {
            document.getElementById("lblErrSenha").innerHTML = "Senha fora do padrão";
            document.getElementById('txtSenhaLog').style.borderBottom = "solid 2px red";
            document.getElementById('txtSenhaLog').focus();
            return false;
        }
    }
}
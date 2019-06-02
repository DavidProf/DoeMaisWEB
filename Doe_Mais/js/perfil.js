/*----Div de alerta-----*/
window.onload = perfil1;
function perfil1() {

    var erro = document.getElementById("lblErPerfil").innerText;
    if (erro == "Seus dados foram atualizados :D") {
        document.getElementById("erroPerfil").style.backgroundColor = "green";
    } else if (erro.length > 1) {
        document.getElementById("erroPerfil").style.backgroundColor = "Red";
    }
}

/*----Alterar dados-----*/
function alterarDados() {
    document.getElementById("lblErPerfil").innerText = "";
    document.getElementById("erroPerfil").style.backgroundColor = "white";
    document.getElementById("btnEnviarCadastro").style.display = "block";
    document.getElementById("btnCancelar").style.display = "block";
    document.getElementById("txtCep").disabled = false;
    document.getElementById("txtNumero").disabled = false;
    document.getElementById("txtComplemento").disabled = false;
    document.getElementById("txtTelUm").disabled = false;
    document.getElementById("txtTelDois").disabled = false;
    document.getElementById("txtEmail").disabled = false;
    document.getElementById("txtSenha").disabled = false;
    document.getElementById("txtSenha1").disabled = false;
    document.getElementById("Pergunta").disabled = false;
    document.getElementById("txtResposta").disabled = false;
    window.scrollTo(0, 1050);
}

/*----Botao cancelar alteraçao-----*/
function cancelar() {
    document.getElementById("lblErPerfil").innerText = "";
    document.getElementById("erroPerfil").style.backgroundColor = "white";
    return true;
}

/*----Validando os campos-----*/
function revisarPerfil() {
    var habilitado = document.getElementById("txtCep").disabled;
    if (habilitado == false) {
        if (document.getElementById("txtCep").value == "" || document.getElementById('lblErCep').innerText.length >= 1) {
            document.getElementById('lblErCep').innerHTML = "Campo Obrigatório";
            document.getElementById('txtCep').style.borderBottom = "solid 2px red";
            document.getElementById('txtCep').focus();
            return false;
        }
        if (document.getElementById("txtNumero").value == "" || document.getElementById('lblErNumero').innerText.length >= 1) {
            document.getElementById('lblErNumero').innerHTML = "Campo Obrigatório";
            document.getElementById('txtNumero').style.borderBottom = "solid 2px red";
            document.getElementById('txtNumero').focus();
            return false;
        }
        if (document.getElementById("txtTelUm").value == "" || document.getElementById('lblErTel1').innerText.length >= 1) {
            document.getElementById('lblErTel1').innerHTML = "Campo Obrigatório";
            document.getElementById('txtTelUm').style.borderBottom = "solid 2px red";
            document.getElementById('txtTelUm').focus();
            return false;
        }
        if (document.getElementById("txtEmail").value == "" || document.getElementById('lblErEmail').innerText.length >= 1) {
            document.getElementById('lblErEmail').innerHTML = "Campo Obrigatório";
            document.getElementById('txtEmail').style.borderBottom = "solid 2px red";
            document.getElementById('txtEmail').focus();
            return false;
        }

        document.getElementById("txtLogradouro").disabled = false;
        document.getElementById("txtBairro").disabled = false;
        document.getElementById("txtCidade").disabled = false;
        document.getElementById("txtUf").disabled = false;
        return true;
    }
}

/*-------------------Senha validaçoes e efeitos ---------------*/
function valide() {
    var senha = document.getElementById("txtSenha").value;
    var Senha1 = document.getElementById("txtSenha1").value;

    if (senha.length >= 8 && senha.match(/[a-z]+/) && senha.match(/[A-Z]+/) && senha.match(/[\d]/)) {
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
            return true;
        }
    }
    else {
        document.getElementById("lblErSenha").innerHTML = "Senha fora do padrão";
        document.getElementById('txtSenha').style.borderBottom = "solid 2px red";
        return false;
    }
}

/*---------------*/

function aparecersenha() {
    document.getElementById("senhasperfil").style.display = "block";
}

function cancelarsenha() {
    document.getElementById("senhasperfil").style.display = "none";
    return false;
}

/*-------------------Pergunta e resposta validaçoes e efeitos ---------------*/

function validePergunta() {
    var perg = document.getElementById("Pergunta").value;
    if (perg == "-Selecione-") {
        document.getElementById('lblErPerg').innerHTML = "Resposta Inválida";
        return false;
    } else {
        document.getElementById('lblErPerg').innerHTML = "";
        if (document.getElementById("txtResposta").value.length < 1) {
            document.getElementById('lblErPerg').innerHTML = "Escreva sua resposta";
            document.getElementById('txtResposta').style.borderBottom = "solid 2px red";
            return false;
        } else {
            document.getElementById('lblErPerg').innerHTML = "";
            document.getElementById('txtResposta').style.borderBottom = "solid 2px #3870c9";
            return true;
        }
    }
}

/*---------------*/

function aparecerPergunta() {
    document.getElementById("perguntasperfil").style.display = "block";
}

function cancelarPerguntaperfil() {
    document.getElementById("perguntasperfil").style.display = "none";
    return false;
}
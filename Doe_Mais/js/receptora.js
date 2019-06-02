/*----Resumo limitado à 300 caracteres-----*/
function CheckLength() {
    var textbox = document.getElementById("txtResumo").value;
    if (textbox.trim().length >= 300) {
        return false;
    }
    else {
        return true;
    }
}

/*----Fazendo aparecer a div com todos os dias da semana-----*/
function outrosDias() {
    document.getElementById('divFuncionamento').style.display = "block";
}
function fim() {
    document.getElementById('divFuncionamento').style.display = "none";
}
function semana() {
    document.getElementById('divFuncionamento').style.display = "none";
}
function todos() {
    document.getElementById('divFuncionamento').style.display = "none";
}

/*----validando antes de enviar-----*/
function validarreceptora() {

    if (document.getElementById("txtTel2Rec").value == "" || document.getElementById('lblErTel2Rec').innerText.length >= 1) {
        document.getElementById('lblErTel2Rec').innerHTML = "Campo Obrigatório";
        document.getElementById('txtTel2Rec').style.borderBottom = "solid 2px red";
        document.getElementById('txtTel2Rec').focus();
        return false;
    }

    if (document.getElementById('radOutro').checked == true) {
        if (document.getElementById('Segunda').checked == false &&
            document.getElementById('Terça').checked == false &&
            document.getElementById('Quarta').checked == false &&
            document.getElementById('Quinta').checked == false &&
            document.getElementById('Sexta').checked == false &&
            document.getElementById('Sábado').checked == false &&
            document.getElementById('Domingo').checked == false) {
            document.getElementById('lblErDia').innerHTML = "Selecione os dias";
            document.getElementById('divFuncionamento').style.border = "solid 2px red";
            return false;
        }
        else {
            document.getElementById('divFuncionamento').style.border = "solid 2px #3870c9";
            document.getElementById('lblErDia').innerHTML = "";
        }
    }

    if (document.getElementById('txtResumo').value.length < 250) {
        document.getElementById('lblErResumo').innerHTML = "Faça um resumo de pelo menos 230 caracteres";
        document.getElementById('lblErResumo').focus();
        return false;
    }else {
        document.getElementById('lblErResumo').innerHTML = "";
    }

    if (document.getElementById('txtResumo').value.length >300) {
        document.getElementById('lblErResumo').innerHTML = "O máximo de caracteres é 300";
        document.getElementById('lblErResumo').focus();
        return false;
    } else {
        document.getElementById('lblErResumo').innerHTML = "";
    }

    if (document.getElementById('droHora1').value.localeCompare(document.getElementById('droHora2').value)) {
        document.getElementById('lblErHr').innerHTML = "";
    } else {
        document.getElementById('lblErHr').innerHTML = "Escolha horas diferentes";
        document.getElementById('droHora1').focus();
        return false;
    }

    if (document.getElementById('txtFantasia').value == "" || document.getElementById('lblErFantasia').innerText.length >= 1) {
        document.getElementById('lblErFantasia').innerHTML = "Campo Obrigatório";
        document.getElementById('txtFantasia').style.borderBottom = "solid 2px red";
        document.getElementById('txtFantasia').focus();
        return false;
    }
    return validarcnpj();
}


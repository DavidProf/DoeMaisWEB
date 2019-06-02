function porcidade() {
    document.getElementById("porEstado").style.display = "block";
    document.getElementById("porNome").style.display = "none";
    document.getElementById("porOrdem").style.display = "none";
    limpar();
}

function pornome() {
    document.getElementById("porEstado").style.display = "none";
    document.getElementById("porNome").style.display = "block";
    document.getElementById("porOrdem").style.display = "none";
    limpar();
}

function porordem() {
    document.getElementById("porEstado").style.display = "none";
    document.getElementById("porNome").style.display = "none";
    document.getElementById("porOrdem").style.display = "block";
    limpar();
}

function portudo() {
    document.getElementById("porEstado").style.display = "none";
    document.getElementById("porNome").style.display = "none";
    document.getElementById("porOrdem").style.display = "none";
    document.getElementById("btnRecep").style.display = "none";
    limpar();
    document.getElementById("imgbusca").style.width = "40%";
    document.getElementById("btnRecep").style.display = "none";
}

function limpar() {
    document.getElementById("dropCidade2").disabled = true;
    document.getElementById("dropEstado2").selectedIndex = 0;
    document.getElementById("dropCidade2").selectedIndex = 0;
    document.getElementById("dropLetra").selectedIndex = 0;
    document.getElementById("txtInstituicao").value = "";
    document.getElementById("lblErFiltro").innerText = " ";
    document.getElementById("imgbusca").style.width = "20%";
    document.getElementById("btnRecep").style.display = "block";
}
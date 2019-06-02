function popsenha() {
    var pop = document.getElementById('duvidas').style.display;
    var modal = document.getElementById('duvidas');

    if (pop == "block") {
        document.getElementById('duvidas').style.display = "none";
        modal.classList.remove("mostrar");
    } else {
        document.getElementById('duvidas').style.display = "block";
        modal.classList.add("mostrar");
    }
}
/*----------------sumir menuslide aparecer------------------------*/
function menu() {
    var slider = document.getElementById("slide");
    if (slider.style.left == "0px") {
        slider.style.left = "-70%";
        document.getElementById("sumirslide2").style.display = 'none';
    }
    else {
        slide.style.left = "0px";
        document.getElementById("sumirslide2").style.display = 'block';
    }
}

/*----------------sumir menuslide sumir------------------------*/
function sumirslide() {
    var slider = document.getElementById("slide");

    if (slider.style.left == "0px") {
        slider.style.left = "-70%";
        document.getElementById("sumirslide2").style.display = 'none';
    }
    else {
        slide.style.left = "0px";
        document.getElementById("sumirslide2").style.display = 'block';
    }
}

/*----------------menu cadastrar aparecer ------------------------*/
function mudaestado() {
    var display = document.getElementById("cadastrar").style.display;
    if (display == "block") {
        document.getElementById("cadastrar").style.display = 'none';
        document.getElementById("sumirmenu").style.display = 'none';
    }
    else {
        document.getElementById("cadastrar").style.display = 'block';
        document.getElementById("sumirmenu").style.display = 'block';
    }
}

/*----------------menu cadastrar sumir ------------------------*/
function sumirmenu() {
    var display = document.getElementById("cadastrar").style.display;
    if (display == "block") {
        document.getElementById("cadastrar").style.display = 'none';
        document.getElementById("sumirmenu").style.display = 'none';
    }
    else {
        document.getElementById("cadastrar").style.display = 'block';
        document.getElementById("sumirmenu").style.display = 'block';
    }
}
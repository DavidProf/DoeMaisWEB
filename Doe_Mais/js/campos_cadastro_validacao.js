/*---------------------- Máscaras ------------------------*/
jQuery(function ($) {
    $("#txtCpf").mask("xxx.xxx.xxx-xx", { translation: { 'x': { pattern: /[0-9]/ } } });
    $("#txtCep").mask("xxxxx-xxx", { translation: { 'x': { pattern: /[0-9]/ } } });
    $("#txtTelUm").mask("(xx)xxxxx-xxxx", { translation: { 'x': { pattern: /[0-9]/ } } });
    $("#txtTelDois").mask("(xx)xxxxx-xxxx", { translation: { 'x': { pattern: /[0-9]/ } } });

    $("#txtTel2Rec").mask("(xx)xxxxx-xxxx", { translation: { 'x': { pattern: /[0-9]/ } } });
    $("#txtCnpj").mask("xx.xxx.xxx/xxxx-xx", { translation: { 'x': { pattern: /[0-9]/ } } });
});

/*----------------------Cep ------------------------*/
$(document).ready(function () {
    function limpa_formulário_cep() {
        $("#txtLogradouro").val("");
        $("#txtBairro").val("");
        $("#txtCidade").val("");
        $("#txtUf").val("");
    }
    $("#txtCep").blur(function () {
        var cep = $(this).val().replace(/\D/g, '');
        if (cep != "") {
            var validacep = /^[0-9]{8}$/;
            if (validacep.test(cep)) {
                $("#txtLogradouro").val("...");
                $("#txtBairro").val("...");
                $("#txtCidade").val("...");
                $("#txtUf").val("...");
                $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {
                    if (!("erro" in dados)) {
                        $("#txtLogradouro").val(dados.logradouro);
                        $("#txtBairro").val(dados.bairro);
                        $("#txtCidade").val(dados.localidade);
                        $("#txtUf").val(dados.uf);
                        document.getElementById('lblErCep').innerHTML = "";
                        document.getElementById('txtCep').style.borderBottom = "solid 2px #3870c9";
                    }
                    else {
                        limpa_formulário_cep();
                        document.getElementById('lblErCep').innerHTML = "Cep não encontrado";
                        document.getElementById('txtCep').style.borderBottom = "solid 2px red";
                    }
                });
            }
            else {
                limpa_formulário_cep();
                document.getElementById('lblErCep').innerHTML = "Cep inválido";
                document.getElementById('txtCep').style.borderBottom = "solid 2px red";
            }
        }
        else {
            limpa_formulário_cep();
            document.getElementById('lblErCep').innerHTML = "Cep inválido";
            document.getElementById('txtCep').style.borderBottom = "solid 2px red";
        }
    });
});

/*---------------------------Validação do CPF------------------------------------------*/
$(document).ready(function cpf() {

    $("#txtCpf").blur(function () {
        var Cpf = $(this).val().trim().replace("-", "").replace(".", "").replace(".", "");

        if (!Cpf == "" || !Cpf.length < 11) {
            var Soma;
            var Resto;
            Soma = 0;
            if (Cpf == "00000000000" ||
                Cpf == "11111111111" ||
                Cpf == "22222222222" ||
                Cpf == "33333333333" ||
                Cpf == "44444444444" ||
                Cpf == "55555555555" ||
                Cpf == "66666666666" ||
                Cpf == "77777777777" ||
                Cpf == "88888888888" ||
                Cpf == "99999999999") {
                document.getElementById('lblErCpf').innerHTML = "CPF inválido";
                document.getElementById('txtCpf').style.borderBottom = "solid 2px red";
                return false;
            } else {
                for (i = 1; i <= 9; i++) Soma = Soma + parseInt(Cpf.substring(i - 1, i)) * (11 - i);
                Resto = (Soma * 10) % 11;
                if ((Resto == 10) || (Resto == 11)) {
                    Resto = 0;
                }
                if (Resto != parseInt(Cpf.substring(9, 10))) {
                    document.getElementById('lblErCpf').innerHTML = "CPF inválido";
                    document.getElementById('txtCpf').style.borderBottom = "solid 2px red";
                    return false;
                }
                Soma = 0;
                for (i = 1; i <= 10; i++) Soma = Soma + parseInt(Cpf.substring(i - 1, i)) * (12 - i);
                Resto = (Soma * 10) % 11;
                if ((Resto == 10) || (Resto == 11)) {
                    Resto = 0;
                }
                if (Resto != parseInt(Cpf.substring(10, 11))) {
                    document.getElementById('lblErCpf').innerHTML = "CPF inválido";
                    document.getElementById('txtCpf').style.borderBottom = "solid 2px red";
                    return false;
                }
                document.getElementById('txtCpf').style.borderBottom = "solid 2px #3870c9";
                document.getElementById('lblErCpf').innerHTML = "";
                return true;
            }
        } else {
            document.getElementById('lblErCpf').innerHTML = "CPF inválido";
            document.getElementById('txtCpf').style.borderBottom = "solid 2px red";
            return false;
        }
    });
});

/*---------------------------Validação do CNPJ------------------------------------------*/
$(document).ready(function cpf() {

    $("#txtCnpj").blur(function () {
        var Cnpj = $(this).val().trim().replace("-", "").replace(".", "").replace(".", "").replace("/", "");

        if (Cnpj == "" || Cnpj.length < 14) {
            document.getElementById('lblErCnpj').innerHTML = "CNPJ inválido";
            document.getElementById('txtCnpj').style.borderBottom = "solid 2px red";
            return false;
        } else {
            if (Cnpj == "00000000000000" ||
                Cnpj == "11111111111111" ||
                Cnpj == "22222222222222" ||
                Cnpj == "33333333333333" ||
                Cnpj == "44444444444444" ||
                Cnpj == "55555555555555" ||
                Cnpj == "66666666666666" ||
                Cnpj == "77777777777777" ||
                Cnpj == "88888888888888" ||
                Cnpj == "99999999999999") {
                document.getElementById('lblErCnpj').innerHTML = "CNPJ inválido";
                document.getElementById('txtCnpj').style.borderBottom = "solid 2px red";
                return false;
            } else {

                tamanho = Cnpj.length - 2
                numeros = Cnpj.substring(0, tamanho);
                digitos = Cnpj.substring(tamanho);
                soma = 0;
                pos = tamanho - 7;
                for (i = tamanho; i >= 1; i--) {
                    soma += numeros.charAt(tamanho - i) * pos--;
                    if (pos < 2)
                        pos = 9;
                }
                resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
                if (resultado != digitos.charAt(0)) {
                    document.getElementById('lblErCnpj').innerHTML = "CNPJ inválido";
                    document.getElementById('txtCnpj').style.borderBottom = "solid 2px red";
                    return false;
                }
                tamanho = tamanho + 1;
                numeros = Cnpj.substring(0, tamanho);
                soma = 0;
                pos = tamanho - 7;
                for (i = tamanho; i >= 1; i--) {
                    soma += numeros.charAt(tamanho - i) * pos--;
                    if (pos < 2)
                        pos = 9;
                }
                resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
                if (resultado != digitos.charAt(1)) {
                    document.getElementById('lblErCnpj').innerHTML = "CNPJ inválido";
                    document.getElementById('txtCnpj').style.borderBottom = "solid 2px red";
                    return false;
                }
                document.getElementById('lblErCnpj').innerHTML = "";
                document.getElementById('txtCnpj').style.borderBottom = "solid 2px #3870c9";
                return true;
            }
        }
    });
});

/*---------------------------Validação dos campos de cadastro com .blur------------------------------------------*/
$(document).ready(function () {

    $("#txtNome").blur(function () {
        var nome = $(this).val().trim();
        if (nome == "" || nome.length < 3) {
            document.getElementById('lblErNome').innerHTML = "Nome inválido";
            document.getElementById('txtNome').style.borderBottom = "solid 2px red";
        } else {
            document.getElementById('lblErNome').innerHTML = "";
            document.getElementById('txtNome').style.borderBottom = "solid 2px #3870c9";
        }
    });

    $("#txtRazao").blur(function () {
        var Razao = $(this).val().trim();
        if (Razao == "" || Razao.length < 5) {
            document.getElementById('lblErRazao').innerHTML = "Razão inválida";
            document.getElementById('txtRazao').style.borderBottom = "solid 2px red";
        } else {
            document.getElementById('lblErRazao').innerHTML = "";
            document.getElementById('txtRazao').style.borderBottom = "solid 2px #3870c9";
        }
    });

    $("#txtSobrenome").blur(function () {
        var Sobrenome = $(this).val().trim();
        if (Sobrenome == "" || Sobrenome.length < 3) {
            document.getElementById('lblErSobrenome').innerHTML = "Sobrenome inválido";
            document.getElementById('txtSobrenome').style.borderBottom = "solid 2px red";
        } else {
            document.getElementById('lblErSobrenome').innerHTML = "";
            document.getElementById('txtSobrenome').style.borderBottom = "solid 2px #3870c9";
        }
    });

    $("#txtFantasia").blur(function () {
        var Fantasia = $(this).val().trim();
        if (Fantasia == "" || Fantasia.length < 3) {
            document.getElementById('lblErFantasia').innerHTML = "Nome Fantasia inválido";
            document.getElementById('txtFantasia').style.borderBottom = "solid 2px red";
        } else {
            document.getElementById('lblErFantasia').innerHTML = "";
            document.getElementById('txtFantasia').style.borderBottom = "solid 2px #3870c9";
        }
    });

    $("#txtNumero").blur(function () {
        var Numero = $(this).val().trim();
        if (Numero == "") {
            document.getElementById('lblErNumero').innerHTML = "Número inválido";
            document.getElementById('txtNumero').style.borderBottom = "solid 2px red";
        } else {
            document.getElementById('lblErNumero').innerHTML = "";
            document.getElementById('txtNumero').style.borderBottom = "solid 2px #3870c9";
        }
    });

    $("#txtTelUm").blur(function () {
        var Tel1 = $(this).val().trim().replace("-", "").replace("(", "").replace(")", "");
        if (Tel1 == "" || Tel1.length < 10) {
            document.getElementById('lblErTel1').innerHTML = "Tel.1: inválido";
            document.getElementById('txtTelUm').style.borderBottom = "solid 2px red";
        } else if (Tel1 == 11111111111 ||
            Tel1 == 22222222222 ||
            Tel1 == 33333333333 ||
            Tel1 == 44444444444 ||
            Tel1 == 55555555555 ||
            Tel1 == 66666666666 ||
            Tel1 == 77777777777 ||
            Tel1 == 88888888888 ||
            Tel1 == 99999999999 ||
            Tel1 == 00000000000) {
            document.getElementById('lblErTel1').innerHTML = "Tel.1: inválido";
            document.getElementById('txtTelUm').style.borderBottom = "solid 2px red";
        }
        else {
            document.getElementById('lblErTel1').innerHTML = "";
            document.getElementById('txtTelUm').style.borderBottom = "solid 2px #3870c9";
        }
    });

    $("#txtTelDois").blur(function () {
        var Tel2 = $(this).val().trim().replace("-", "").replace("(", "").replace(")", "");
        if (Tel2.length >= 1) {
            if (Tel2.length < 10) {
                document.getElementById('lblErTel2').innerHTML = "Tel.2: inválido";
                document.getElementById('txtTelDois').style.borderBottom = "solid 2px red";
            }
            else if (Tel2 == 11111111111 ||
                Tel2 == 22222222222 ||
                Tel2 == 33333333333 ||
                Tel2 == 44444444444 ||
                Tel2 == 55555555555 ||
                Tel2 == 66666666666 ||
                Tel2 == 77777777777 ||
                Tel2 == 88888888888 ||
                Tel2 == 99999999999 ||
                Tel2 == 00000000000) {
                document.getElementById('lblErTel2').innerHTML = "Tel.2: inválido";
                document.getElementById('txtTelDois').style.borderBottom = "solid 2px red";
            } else {
                document.getElementById('lblErTel2').innerHTML = "";
                document.getElementById('txtTelDois').style.borderBottom = "solid 2px #3870c9";
            }
        }
        else {
            document.getElementById('lblErTel2').innerHTML = "";
            document.getElementById('txtTelDois').style.borderBottom = "solid 2px #3870c9";
        }
    });

    $("#txtTel2Rec").blur(function () {
        var Tel2Rec = $(this).val().trim().replace("-", "").replace("(", "").replace(")", "");
        if (Tel2Rec == "" || Tel2Rec.length < 10) {
            document.getElementById('lblErTel2Rec').innerHTML = "Tel.2: inválido";
            document.getElementById('txtTel2Rec').style.borderBottom = "solid 2px red";
        } else if (Tel2Rec == 11111111111 ||
            Tel2Rec == 22222222222 ||
            Tel2Rec == 33333333333 ||
            Tel2Rec == 44444444444 ||
            Tel2Rec == 55555555555 ||
            Tel2Rec == 66666666666 ||
            Tel2Rec == 77777777777 ||
            Tel2Rec == 88888888888 ||
            Tel2Rec == 99999999999 ||
            Tel2Rec == 00000000000) {
            document.getElementById('lblErTel2Rec').innerHTML = "Tel.2: inválido";
            document.getElementById('txtTel2Rec').style.borderBottom = "solid 2px red";
        }
        else {
            document.getElementById('lblErTel2Rec').innerHTML = "";
            document.getElementById('txtTel2Rec').style.borderBottom = "solid 2px #3870c9";
        }
    });

    $("#txtEmail").blur(function () {
        var Email = $(this).val().trim();

        if (Email == "" || Email.length < 10) {
            document.getElementById('lblErEmail').innerHTML = "E-mail inválido";
            document.getElementById('txtEmail').style.borderBottom = "solid 2px red";
            return;
        } else {
            if (Email.search("@") == -1) {
                document.getElementById('lblErEmail').innerHTML = 'E-mail faltando "@"';
                document.getElementById('txtEmail').style.borderBottom = "solid 2px red";
                return;
            }
            if (Email.indexOf(".") == -1) {
                document.getElementById('lblErEmail').innerHTML = 'E-mail faltando "."';
                document.getElementById('txtEmail').style.borderBottom = "solid 2px red";
                return;
            }
            else {
                document.getElementById('lblErEmail').innerHTML = "";
                document.getElementById('txtEmail').style.borderBottom = "solid 2px #3870c9";
            }
        }
    });

    $("#txtSenha").blur(function () {
        var Senha = $(this).val().trim();

        if (Senha == "" || Senha.length < 8) {
            document.getElementById('lblErSenha').innerHTML = "8 dígitos no mínimo ";
            document.getElementById('txtSenha').style.borderBottom = "solid 2px red";
        }
        else {
            document.getElementById('lblErSenha').innerHTML = "";
            document.getElementById('txtSenha').style.borderBottom = "solid 2px #3870c9";
        }
    });

    $("#txtSenha1").blur(function () {
        var Senha = document.getElementById('txtSenha').value.trim();
        var Senha1 = $(this).val().trim();

        if (Senha == "" && Senha1 == "") {
            document.getElementById('lblErSenha').innerHTML = "Senhas vazias";
            document.getElementById('txtSenha').style.borderBottom = "solid 2px red";
            document.getElementById('txtSenha1').style.borderBottom = "solid 2px red";
        } else {
            if (Senha1.localeCompare(Senha)) {
                document.getElementById('lblErSenha').innerHTML = "Senhas diferentes";
                document.getElementById('txtSenha').style.borderBottom = "solid 2px red";
                document.getElementById('txtSenha1').style.borderBottom = "solid 2px red";
            }
            else {
                document.getElementById('lblErSenha').innerHTML = "";
                document.getElementById('txtSenha').style.borderBottom = "solid 2px #3870c9";
                document.getElementById('txtSenha1').style.borderBottom = "solid 2px #3870c9";
            }
        }
    });

    $("#txtResposta").blur(function () {
        var resp = $(this).val().trim();
        if (resp == "" || resp.length < 2) {
            document.getElementById('lblErResp').innerHTML = "Resposta Invalida";
            document.getElementById('txtResposta').style.borderBottom = "solid 2px red";
        } else {
            document.getElementById('lblErResp').innerHTML = "";
            document.getElementById('txtResposta').style.borderBottom = "solid 2px #3870c9";
        }
    });

    $("#Pergunta").blur(function () {
        var perg = $(this).val().trim();
        if (perg == "-Selecione-") {
            document.getElementById('lblErPerg').innerHTML = "Resposta Inválida";
        } else {
            document.getElementById('lblErPerg').innerHTML = "";
        }
    });
});
/*---------------------------Validação dos campos de cadastro com o botão cpf ------------------------------------------*/
function validarcpf() {


    if (document.getElementById("txtNome").value == "" || document.getElementById('lblErNome').innerText.length >= 1) {
        document.getElementById('lblErNome').innerHTML = "Campo Obrigatório";
        document.getElementById('txtNome').style.borderBottom = "solid 2px red";
        document.getElementById('txtNome').focus();
        return false;
    }
    else if (document.getElementById("txtSobrenome").value == "" || document.getElementById('lblErSobrenome').innerText.length >= 1) {
        document.getElementById('lblErSobrenome').innerHTML = "Campo Obrigatório";
        document.getElementById('txtSobrenome').style.borderBottom = "solid 2px red";
        document.getElementById('txtSobrenome').focus();
        return false;
    }
    else if (document.getElementById("txtCpf").value == "" || document.getElementById('lblErCpf').innerText.length >= 1) {
        document.getElementById('lblErCpf').innerHTML = "Campo Obrigatório";
        document.getElementById('txtCpf').style.borderBottom = "solid 2px red";
        document.getElementById('txtCpf').focus();
        return false;
    }
    return validar();
}
/*---------------------------Validação dos campos de cadastro com o botão cnpj ------------------------------------------*/
function validarcnpj() {
    if (document.getElementById("txtRazao").value == "" || document.getElementById('lblErRazao').innerText.length >= 1) {
        document.getElementById('lblErRazao').innerHTML = "Campo Obrigatório";
        document.getElementById('txtRazao').style.borderBottom = "solid 2px red";
        document.getElementById('txtRazao').focus();
        return false;
    }
    else if (document.getElementById("txtCnpj").value == "" || document.getElementById('lblErCnpj').innerText.length >= 1) {
        document.getElementById('lblErCnpj').innerHTML = "Campo Obrigatório";
        document.getElementById('txtCnpj').style.borderBottom = "solid 2px red";
        document.getElementById('txtCnpj').focus();
        return false;
    }
    
    return validar();
}

/*---------------------------Validação dos campos de cadastro com o botão------------------------------------------*/
function validar() {
    
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
    if (document.getElementById("Pergunta").value == "-Selecione-" || document.getElementById('lblErPerg').innerText.length >= 1) {
        document.getElementById('lblErPerg').innerHTML = "Selecione uma Pergunta";
        return false;
    }
    if (document.getElementById("txtResposta").value == "" || document.getElementById('lblErResp').innerText.length >= 1) {
        document.getElementById("lblErResp").innerHTML = "Campo Obrigatório";
        document.getElementById('txtResposta').style.borderBottom = "solid 2px red";
        return false;
    }
    if (document.getElementById("txtSenha").value == "" || document.getElementById('lblErSenha').innerText.length >= 1) {
        document.getElementById('lblErSenha').innerHTML = "Senhas incorretas";
        document.getElementById('txtSenha').style.borderBottom = "solid 2px red";
        return false;
    }
    if (document.getElementById("txtSenha1").value == "") {
        document.getElementById('lblErSenha').innerHTML = "Repita a senha";
        document.getElementById('txtSenha1').style.borderBottom = "solid 2px red";
        return false;
    }
    document.getElementById("txtLogradouro").disabled = false;
    document.getElementById("txtBairro").disabled = false;
    document.getElementById("txtCidade").disabled = false;
    document.getElementById("txtUf").disabled = false;
    return validarsenha();
    return true;
}

/*---------------------------------Validaçao senha----------------------------------------------*/

function validarsenha() {

    var senha = document.getElementById("txtSenha").value;

    if (senha.length >=8 && senha.match(/[a-z]+/) && senha.match(/[A-Z]+/) && senha.match(/[\d]/)) {
    }
    else {
        document.getElementById("lblErSenha").innerHTML = "Senha fora do padrão";
        document.getElementById('txtSenha').style.borderBottom = "solid 2px red";
        document.getElementById('txtSenha').focus();
        return false;
    }
}

/*---------------------------------duvida----------------------------------------------*/



<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="cadastrodoador.aspx.cs" Inherits="cadastrodoador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Banner-->
    <div class="banner">
        <img id="banner" src="img/fundo.png">
        <div class="bannerconteudo">
            <div id="bannerfundo">
                <div id="bannerfrente">
                    <p id="fraseum">Doe Mais Amor. O universo</p>
                    <p id="frasedois">te devolve gratidão ;D</p>
                </div>
            </div>
            <div class="btnbanner">
                <a href="#" class="btnsBanner">DOADOR!</a>
                <a href="cadastroreceptora.aspx" class="btnsBanner">RECEPTORA!</a>
            </div>
        </div>
    </div>
    <!--Conteudo-->
    <article>
        <div class="conteudo">
            <div class="titulo">
                <p>Cadastro</p>
            </div>
            <div class="cadastro_frase">
                <p>Faça aqui o seu cadastro de doador e nos ajude a trazer sorrisos ;) </p>
            </div>
            <div class="folhade_cadastro">
                <div class="passos_cadastro">
                    <img id="one" src="img/one.png" />
                    <label for="one">Escolha um tipo de pessoa !</label>
                </div>
                <table class="tipo_pessoa" id="tipo_pessoa">
                    <tr>
                        <td>
                            <a class="btnCnpj" href="cadastropf.aspx" style="color:black;">Pessoa Física</a>
                        </td>
                        <td>
                            <a class="btnCnpj" href="cadastropj.aspx" style="color:black;">Pessoa Jurídica</a>
                        </td>
                    </tr>
                </table>
                <br />
                <img id="img_formulario" src="img/formulario.png" />
            </div>
            <br />
        </div>
    </article>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="cadastropj.aspx.cs" Inherits="cadastropj" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/popupduvida.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Banner-->
    <div class="banner">
        <img id="banner" src="img/fundo.png">
        <div class="bannerconteudo">
            <div id="bannerfundo">
                <div id="bannerfrente">
                    <p id="fraseum">A solidariedade é contagiosa.</p>
                    <p id="frasedois">Contagie e se deixe contagiar!!</p>
                </div>
            </div>
            <div class="btnbanner">
                <a href="cadastrodoador.aspx" class="btnsBanner">DOADOR!</a>
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
                <p>Faça aqui o seu cadastaro de doador e nos ajude a trazer sorrisos ;) </p>
            </div>
            <div class="folhade_cadastro">
                <div class="passos_cadastro">
                    <img id="two" src="img/two.png" />
                    <label for="two">Preencha os campos !</label>
                </div>
                <div id="divErCadastro">
                    <br />
                    <asp:Label ID="lblErCadastro" runat="server" ClientIDMode="Static"></asp:Label>
                </div>
                <br />
                <div id="marcador">
                    <br />
                    <div class="marcador_cadastro">
                        <p>Digite seus dados </p>
                    </div>
                    <br />
                </div>
                <div class="campos_cnpj" id="campos_cnpj">

                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="lblRazao" runat="server" Text="*Razão Social:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="lblCnpj" runat="server" Text="*CNPJ:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtRazao" runat="server" TabIndex="1" ClientIDMode="Static" MaxLength="25" placeholder="Ex. DoeMais"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtCnpj" runat="server" MaxLength="14" TabIndex="2" ClientIDMode="Static" placeholder="Ex. 12.345.678/9012-34"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErRazao" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErCnpj" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="cadastro_dados" id="cadastro_dados">
                    <br />
                    <div class="marcador_cadastro" id="marcador_dois">
                        <p>Digite seu endereço </p>
                    </div>
                    <br />
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label8" runat="server" Text="*Cep:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label9" runat="server" Text="Logradouro:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtCep" runat="server" TabIndex="3" MaxLength="8" ClientIDMode="Static" placeholder="Ex. 99999-999"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtLogradouro" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErCep" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErLogradouro" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label10" runat="server" Text="Bairro:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label11" runat="server" Text="Cidade:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtBairro" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtCidade" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErBairro" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErCidade" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label12" runat="server" Text="UF:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtUf" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_erros" runat="server" ID="lblErUf" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label13" runat="server" Text="*Número:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="lblComplemento" runat="server" Text="Complemento:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtNumero" runat="server" TabIndex="4" ClientIDMode="Static" MaxLength="5" placeholder="Ex. 2111"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtComplemento" runat="server" TabIndex="5" ClientIDMode="Static" MaxLength="25"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErNumero" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>

                    <div class="marcador_cadastro" id="marcador_tres">
                        <p>Digite seus contatos </p>
                    </div>
                    <br />
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label14" runat="server" Text="*Tel. 1:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label15" runat="server" Text="Tel. 2:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtTelUm" runat="server" TabIndex="6" MaxLength="11" ClientIDMode="Static" placeholder="Ex. (99)99999-9999"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtTelDois" runat="server" TabIndex="7" MaxLength="11" ClientIDMode="Static" placeholder="Ex. (99)99999-9999"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErTel1" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErTel2" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>

                    <div class="marcador_cadastro" id="marcador_quatro">
                        <p>Seja um doador ;)</p>
                    </div>
                    <br />
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label7" runat="server" Text="*E-mail:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtEmail" runat="server" TabIndex="8" ClientIDMode="Static" MaxLength="80" placeholder="Ex. Doe_Mais@hotmail.com"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErEmail" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label17" runat="server" Text="*Senha:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label1" runat="server" Text="*Repita sua Senha:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:TextBox CssClass="campos_cadastro" ID="txtSenha" runat="server" MaxLength="10" TabIndex="9" TextMode="Password" ClientIDMode="Static" onkeyup="validarsenha()"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:TextBox CssClass="campos_cadastro" ID="txtSenha1" runat="server" MaxLength="10" TabIndex="10" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErSenha" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/duvida.png" id="duvida" onclick="popsenha()" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="duvida" id="duvidas">
                                    <p>Sua senha deve conter pelo menos:</p>
                                    <br />
                                    <ul class="lista">
                                        <li>8 caracteres;</li>
                                        <li>Uma letra minúscula;</li>
                                        <li>Uma letra maiúscula;</li>
                                        <li>Um número.</li>
                                    </ul>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label2" runat="server" Text="*Pergunta secreta:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label4" runat="server" Text="*Resposta:" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList CssClass="drops" ID="Pergunta" runat="server" ClientIDMode="Static">
                                    <asp:ListItem>-Selecione-</asp:ListItem>
                                    <asp:ListItem>Qual seu animal de estimação favorito?</asp:ListItem>
                                    <asp:ListItem>Qual sua cor favorita?</asp:ListItem>
                                    <asp:ListItem>Qual o nome de solteira da sua mãe?</asp:ListItem>
                                    <asp:ListItem>Em que cidade seu pai nasceu?</asp:ListItem>
                                    <asp:ListItem>Em qual escola estudou no Ensino Médio?</asp:ListItem>

                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtResposta" runat="server" TabIndex="13" MaxLength="25" ClientIDMode="Static"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErPerg" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErResp" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>

                    <table class="botoes_meio">
                        <tr>
                            <td>
                                <asp:Button ID="btnEnviarCadastro" runat="server" Text="Enviar" CssClass="btnEnviar" OnClientClick="return validarcnpj()" ClientIDMode="Static" OnClick="btnEnviarCadastro_Click" TabIndex="11" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <p id="lblObrigatorio">* Campos Obrigatórios</p>
                    <br />
                </div>
            </div>
            <br />
        </div>
    </article>
</asp:Content>


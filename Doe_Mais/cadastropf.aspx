<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="cadastropf.aspx.cs" Inherits="cadastropf" %>

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
                    <p id="fraseum">Doar faz bem</p>
                    <p id="frasedois">para o coração :D</p>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="conteudo">
            <div class="titulo">
                <p>Cadastro</p>
            </div>
            <div class="cadastro_frase">
                <p>Faça aqui o seu cadastro de doador e nos ajude a trazer sorrisos ;) </p>
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
                    <div class="marcador_cadastro">
                        <p>Digite seus dados </p>
                    </div>
                    <br />
                </div>

                <div class="campos_cpf" id="campos_cpf">
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label ID="lblNome" runat="server" Text="*Nome:" CssClass="lbls_cadastro"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblSobrenome" runat="server" Text="*Sobrenome:" CssClass="lbls_cadastro"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtNome" runat="server" CssClass="campos_cadastro" ClientIDMode="Static" TabIndex="1" placeholder="Ex. Pedro" MaxLength="18"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSobrenome" runat="server" TabIndex="2" CssClass="campos_cadastro" ClientIDMode="Static" placeholder="Ex. dos Santos" MaxLength="40"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErNome" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErSobrenome" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="lblCpf" runat="server" Text="*CPF:"></asp:Label>

                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="lblSexo" runat="server" Text="*Sexo:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtCpf" runat="server" MaxLength="11" TabIndex="3" ClientIDMode="Static" placeholder="Ex. 000.000.000-00"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButton CssClass="radios" ID="radMasc" runat="server" GroupName="sexo" Text=" Masculino" ClientIDMode="Static" Checked="True" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErCpf" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButton CssClass="radios" ID="radFemi" runat="server" GroupName="sexo" Text=" Feminino" ClientIDMode="Static" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label runat="server" ID="lblErSexo" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="cadastro_dados" id="cadastro_dados">
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
                                <asp:TextBox CssClass="campos_cadastro" ID="txtCep" runat="server" TabIndex="5" MaxLength="8" ClientIDMode="Static" placeholder="Ex. 99999-999"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtLogradouro" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErCep" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
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
                                <asp:Label CssClass="lbls_erros" ID="lblErBairro" runat="server"></asp:Label>
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
                                <asp:Label CssClass="lbls_erros" ID="lblErUf" runat="server"></asp:Label>
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
                                <asp:TextBox CssClass="campos_cadastro" ID="txtNumero" runat="server" TabIndex="6" ClientIDMode="Static" placeholder="Ex. 2111" MaxLength="5"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtComplemento" runat="server" TabIndex="7" ClientIDMode="Static" MaxLength="25"></asp:TextBox>
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
                                <asp:TextBox CssClass="campos_cadastro" ID="txtTelUm" runat="server" TabIndex="8" MaxLength="11" ClientIDMode="Static" placeholder="Ex. (99)99999-9999"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtTelDois" runat="server" TabIndex="9" MaxLength="11" ClientIDMode="Static" placeholder="Ex. (99)99999-9999"></asp:TextBox>
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
                                <asp:TextBox CssClass="campos_cadastro" ID="txtEmail" runat="server" TabIndex="10" ClientIDMode="Static" placeholder="Ex. PedrodosSantos@hotmail.com" MaxLength="80"></asp:TextBox>
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
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtSenha" runat="server" MaxLength="10" TabIndex="11" TextMode="Password" ClientIDMode="Static" onkeyup="validarsenha()"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtSenha1" runat="server" MaxLength="10" TabIndex="12" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
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
                                <asp:Label CssClass="lbls_cadastro" ID="Label3" runat="server" Text="*Resposta:" ClientIDMode="Static"></asp:Label>
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
                                <asp:Button ID="btnEnviarCadastro" runat="server" Text="Enviar" CssClass="btnEnviar" OnClientClick="return validarcpf()" ClientIDMode="Static" OnClick="btnEnviarCadastro_Click" />
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

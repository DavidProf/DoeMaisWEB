<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="perfil.aspx.cs" Inherits="perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/perfil.js"></script>
    <script src="js/popupduvida.js"></script>
    <script src="js/campos_cadastro_validacao.js"></script>
    <script src="js/confirmacao.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!--Banner-->
    <div class="bannerLogado">
        <img id="bannerLogado" src="img/fundo2.png" class="auto-style1">
    </div>
    <!--Conteudo-->
    <article>
        <div class="conteudoLogado" style="margin-top: 200px;">

            <div class="titulo">
                <p>Seu Perfil :D</p>
            </div>

            <div class="folhade_perfil">
                <div id="erroPerfil">
                    <asp:Label ID="lblErPerfil" CssClass="lblErPerfil" runat="server" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="ft_perfil">
                    <img src="img/perfil.png" />
                    <br />
                    <br />

                    <div id="alterarDados">
                        <img id="alterar" src="img/alterar.png" onclick="alterarDados()" />
                        <br />
                        <label for="alterar">Alterar Dados</label>
                        <br />
                        <br />
                        <img id="inativar" runat="server" src="img/inativar.png" clientidmode="Static" />
                        <br />
                        <label for="inativar">Inativar perfil</label>
                        <br />
                    </div>
                </div>
                <br />
                <br />
                <br />
                <div class="perfilPessoas">
                    <div id="marcador">
                        <div class="marcador_perfil" id="marcador_perfil">
                            <p>Seus Dados </p>
                        </div>
                    </div>
                    <br />
                    <asp:Panel ID="panDados" runat="server">
                        <div class="campos_cpf" id="campos_cpf">
                            <table class="tabelas_perfil">
                                <asp:Panel ID="dadosPF" runat="server">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblNome" runat="server" Text="Nome:" CssClass="lbls_perfil"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtNome" runat="server" CssClass="campos_perfil" ClientIDMode="Static" TabIndex="1" placeholder="Ex. Pedro" MaxLength="18" Enabled="False"></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="lblErNome" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblSobrenome" runat="server" Text="Sobrenome:" CssClass="lbls_perfil"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtSobrenome" runat="server" TabIndex="2" CssClass="campos_perfil" ClientIDMode="Static" placeholder="Ex. dos Santos" MaxLength="40" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="lblErSobrenome" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:Label ID="lblSexo" runat="server" Text="Sexo:" CssClass="lbls_perfil"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtSexo" CssClass="campos_perfil" runat="server" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="lblErSexo" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCpfCnpj" runat="server" Text="CPF:" CssClass="lbls_perfil"></asp:Label>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox CssClass="campos_perfil" ID="txtCpfCnpj" runat="server" MaxLength="11" TabIndex="3" ClientIDMode="Static" placeholder="Ex. 000.000.000-00" Enabled="False"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="lblErCpf" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel CssClass="panRazao" ID="panRazao" runat="server">
                                <table class="tabelas_perfil">
                                    <tr>
                                        <td>
                                            <asp:Label CssClass="lbls_perfil" ID="lblRazao" runat="server" Text="Razão Social:"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox CssClass="campos_perfil" ID="txtRazao" runat="server" TabIndex="3" ClientIDMode="Static" MaxLength="25" placeholder="Ex. DoeMais" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="lblErRazao" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>

                        </div>
                    </asp:Panel>
                </div>
                <br />
                <br />
                <div class="cadastro_dados" id="cadastro_dados">
                    <div class="marcador_cadastro" id="marcador_dois">
                        <p>Seu endereço </p>
                    </div>
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_perfil" ID="Label8" runat="server" Text="Cep:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label9" runat="server" Text="Logradouro:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtCep" runat="server" TabIndex="5" MaxLength="8" ClientIDMode="Static" placeholder="Ex. 99999-999" Enabled="False"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtLogradouro" runat="server" ClientIDMode="Static" onkeypress="return false" onkeydown="return false" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErCep" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_perfil" ID="Label10" runat="server" Text="Bairro:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_perfil" ID="Label11" runat="server" Text="Cidade:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtBairro" runat="server" ClientIDMode="Static" onkeypress="return false" onkeydown="return false" Enabled="False"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtCidade" runat="server" ClientIDMode="Static" onkeypress="return false" onkeydown="return false" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_erros" ID="lblErBairro" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_perfil" ID="Label12" runat="server" Text="UF:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtUf" runat="server" ClientIDMode="Static" onkeypress="return false" onkeydown="return false" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_erros" ID="lblErUf" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_perfil" ID="Label13" runat="server" Text="Número:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_perfil" ID="lblComplemento" runat="server" Text="Complemento:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtNumero" runat="server" TabIndex="6" ClientIDMode="Static" placeholder="Ex. 2111" MaxLength="5" Enabled="False"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtComplemento" runat="server" TabIndex="7" ClientIDMode="Static" MaxLength="25" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErNumero" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>

                    <div class="marcador_cadastro" id="marcador_tres">
                        <p>Seus contatos </p>
                    </div>
                    <br />
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_perfil" ID="Label14" runat="server" Text="Tel. 1:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_perfil" ID="Label15" runat="server" Text="Tel. 2:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtTelUm" runat="server" TabIndex="8" MaxLength="11" ClientIDMode="Static" placeholder="Ex. (99)99999-9999" Enabled="False"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtTelDois" runat="server" TabIndex="9" MaxLength="11" ClientIDMode="Static" placeholder="Ex. (99)99999-9999" Enabled="False"></asp:TextBox>
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
                        <p>Seu login</p>
                    </div>
                    <br />
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_perfil" ID="Label7" runat="server" Text="E-mail Atual:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_perfil" ID="Label2" runat="server" Text="Novo E-mail:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtEmailA" runat="server" TabIndex="10" ClientIDMode="Static" placeholder="Ex. PedrodosSantos@hotmail.com" MaxLength="80" Enabled="False"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_perfil" ID="txtEmail" runat="server" TabIndex="10" ClientIDMode="Static" placeholder="Ex. PedrodosSantos@hotmail.com" MaxLength="80" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErEmailA" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErEmail" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table class="botoes_meio" id="perfil">
                        <tr>
                            <td>
                                <asp:Button ID="btnEnviarCadastro" runat="server" Text="Enviar" CssClass="btnEnviar" OnClientClick="return revisarPerfil()" ClientIDMode="Static" OnClick="btnEnviarCadastro_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancelar" CssClass="btnEnviar" runat="server" Text="Cancelar" ClientIDMode="Static" OnClientClick="return cancelar()" />
                            </td>
                        </tr>
                    </table>
                    <br />

                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <img class="alterarImg" id="senhaPerfil" src="img/key.png" onclick="aparecersenha()" />
                                <label class="lblAlterar" for="senhaPerfil">Alterar senha</label>
                            </td>
                        </tr>
                    </table>
                    <div id="senhasperfil">
                        <table class="tabelas_cadastro">
                            <tr>
                                <td>
                                    <asp:Label CssClass="lbls_perfil" ID="Label17" runat="server" Text="Senha:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label CssClass="lbls_perfil" ID="Label1" runat="server" Text="Repita sua Senha:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox CssClass="campos_perfil" ID="txtSenha" runat="server" MaxLength="10" TabIndex="11" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="campos_perfil" ID="txtSenha1" runat="server" MaxLength="10" TabIndex="12" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
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
                        </table>
                        <table class="botoes_meio" id="senhasPerfil">
                            <tr>
                                <td>
                                    <asp:Button ID="enviarSenha" runat="server" Text="Enviar" CssClass="btnEnviar" ClientIDMode="Static" OnClientClick="return valide()" OnClick="enviarSenha_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="cancelarSenha" CssClass="btnEnviar" runat="server" Text="Cancelar" ClientIDMode="Static" OnClientClick="return cancelarsenha()" />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <br />
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <img class="alterarImg" id="perguntaPerfil" src="img/secret.png" onclick="aparecerPergunta()" />
                                <label class="lblAlterar" for="senhaPerfil">Alterar pergunta secreta</label>
                            </td>
                        </tr>
                    </table>
                    <div id="perguntasperfil">
                        <table class="tabelas_cadastro">
                            <tr>
                                <td>
                                    <asp:Label CssClass="lbls_cadastro" ID="lblPerg" runat="server" Text="*Pergunta secreta:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label CssClass="lbls_cadastro" ID="lblResp" runat="server" Text="*Resposta:" ClientIDMode="Static"></asp:Label>
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
                        <table class="botoes_meio" id="perguntasPerfil">
                            <tr>
                                <td>
                                    <asp:Button ID="enviarPergunta" runat="server" Text="Enviar" CssClass="btnEnviar" ClientIDMode="Static" OnClientClick="return validePergunta()" OnClick="enviarPergunta_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="cancelarPergunta" CssClass="btnEnviar" runat="server" Text="Cancelar" ClientIDMode="Static" OnClientClick="return cancelarPerguntaperfil()" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <!------PopUp Inativar----->
                    <ajaxToolkit:ModalPopupExtender
                        ID="popCancelar" runat="server"
                        TargetControlID="inativar"
                        PopupControlID="popCancelar1"
                        CancelControlID="btnCancelar2"
                        BackgroundCssClass="modalBackground"
                        ClientIDMode="Static"
                        RepositionMode="RepositionOnWindowResize">
                    </ajaxToolkit:ModalPopupExtender>

                    <asp:Panel ID="popCancelar1" CssClass="modalPopup1" runat="server">

                        <div class="titulo" style="background-color: #FA8072; font-size: 20px;">Aviso!</div>
                        <div class="aviso">
                            <p>Voce está prestes a inativar o seu Perfil!</p>
                            <p>Tem certeza que deseja  continuar?</p>
                        </div>
                        <div class="home5" style="margin-top: 50px;">
                            <table class="tabelas_cadastro">
                                <tr>
                                    <td>
                                        <asp:Button CssClass="btnConfirmar" ID="btnConfirmar" runat="server" Text="Continuar" ClientIDMode="Static" OnClick="btnConfirmar_Click" />
                                    </td>
                                    <td>
                                        <asp:Button CssClass="btnConfirmar" ID="btnCancelar2" runat="server" Text="Cancelar" />
                                    </td>
                                </tr>
                            </table>
                        </div>




                    </asp:Panel>
                    <br />
                </div>
            </div>
            <br />
        </div>
    </article>
</asp:Content>


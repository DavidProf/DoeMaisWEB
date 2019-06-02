<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="recuperarsenha.aspx.cs" Inherits="recuperarsenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/recuperarsenha.js"></script>
    <script src="js/popupduvida.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <article>
        <div class="conteudo_recup" style="margin-top: 100px;">
            <div class="titulo_recup">
                <p>Recuperar Senha</p>
            </div>
            <div class="folhade_recup">
                <div id="divErCadastro">
                    <br />
                    <asp:Label ID="lblErRecup" runat="server" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                    <br />
                    <br />
                </div>
                <table class="tabelas_cadastro">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Digite seu Email:" CssClass="lbls_cadastro"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox CssClass="campos_cadastro" ID="txtEmail" runat="server" TabIndex="10" ClientIDMode="Static" placeholder="Ex. PedrodosSantos@hotmail.com" MaxLength="80"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnOk" runat="server" Text="Ok" CssClass="btnEnviar" OnClick="btnOk_Click" ClientIDMode="Static" OnClientClick="return recuperar()" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblErEmail" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table class="botoes_meio">
                    <tr>
                        <td>
                            <asp:Button ID="btnVoltar" runat="server" Text="Voltar ao Login" CssClass="btnEnviar" ClientIDMode="Static" OnClick="btnVoltar_Click" Visible="False" />
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="pergSecreta" runat="server" Style="margin-top: 25px;" Visible="False">
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label ID="lblPergunta" CssClass="lbls_cadastro" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtResposta" CssClass="campos_cadastro" runat="server" ClientIDMode="Static" MaxLength="25"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnVerificar" runat="server" Text="Verificar" CssClass="btnEnviar" OnClientClick="return perguntaRecuperar()" ClientIDMode="Static" OnClick="btnVerificar_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblErResposta" runat="server" ClientIDMode="Static" CssClass="lbls_erros"> </asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="recupSenha" runat="server" Visible="false" Style="margin-top: 25px;">
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Nova Senha:" CssClass="lbls_cadastro"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Confirmar Nova Senha:" CssClass="lbls_cadastro"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtSenha" runat="server" CssClass="campos_cadastro" TextMode="Password" ClientIDMode="Static" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSenha1" runat="server" CssClass="campos_cadastro" MaxLength="10" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
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
                    <br />
                    <table class="botoes_meio">
                        <tr>
                            <td>
                                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btnEnviar" OnClientClick="return senha()" OnClick="btnEnviar_Click" ClientIDMode="Static" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
            </div>
        </div>
    </article>
</asp:Content>


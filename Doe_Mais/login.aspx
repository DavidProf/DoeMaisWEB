<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/login.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Conteúdo-->
    <article>
        <div class="conteudo_Login">
            <div class="titulo_login">
                <p>Login</p>
            </div>
            <br />
            <div class="folhade_login">
                <div class="lblLogin">
                    <img id="entrar_login" class="entrar_login" src="img/entrar_login.png" /><br />
                    <asp:Label CssClass="lblLoginEntrar" ID="lblLoginEntrar" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <br />
                <br />
                <div id="divErLogin">
                    <asp:Label ID="lblErLogin" CssClass="lbls_erros" runat="server" ClientIDMode="Static"></asp:Label>
                    <br />
                    <br />
                </div>
                <table id="tabela_login">
                    <tr>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text="E-mail:" CssClass="lbls_login"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txEmail" runat="server" CssClass="campos_login" ClientIDMode="Static" TabIndex="1" MaxLength="80"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblErrEmail" runat="server" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblSenha" runat="server" Text="Senha:" CssClass="lbls_login"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtSenhaLog" CssClass="campos_login" runat="server" ClientIDMode="Static" TabIndex="2" TextMode="Password" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblErrSenha" runat="server" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a class="esqueceu" href="recuperarsenha.aspx">Esqueceu a senha?</a>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <table class="botoes_meio">
                    <tr>
                        <td>
                            <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="btnEnviar" ClientIDMode="Static" OnClientClick="return logarusuario()" TabIndex="3" OnClick="btnEntrar_Click1" />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
        </div>
    </article>
</asp:Content>


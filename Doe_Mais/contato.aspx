<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="contato.aspx.cs" Inherits="contato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/contato.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Banner-->
    <div class="banner">
        <img id="banner" src="img/fundo.png">
        <div class="bannerconteudo">
            <div id="bannerfundo">
                <div id="bannerfrente">
                    <p id="fraseum">Compartilhe </p>
                    <p id="frasedois">Mais amor pelo mundo :)</p>
                </div>
            </div>
            <div class="btnbanner">
                <a href="cadastrodoador.aspx" class="btnsBanner" id="linkBanner" runat="server">DOADOR!</a>
                <a href="cadastroreceptora.aspx" class="btnsBanner" id="linkBanner2" runat="server">RECEPTORA!</a>
            </div>
        </div>
    </div>
    <!--Conteúdo-->
    <article>
        <div class="conteudo">
            <div class="titulo">
                <p>Contatos</p>
            </div>
            <br>
            <br>
            <br>
            <div class="frase">
                <p>
                    Deixe aqui seu comentário, sugestão, crítica e depoimentos, estamos abertos para todo tipo de mensagem. Esperamos que nosso trabalho e dedicação ajudem milhares de pessoas que passam por algum tipo de necessidade.
                </p>
            </div>
            <div class="contacts">
                <div id="form" class="form">
                    <asp:Panel ID="panMsg" runat="server" Visible="False">
                        <div class="m">
                            <img id="msg" src="img/msg.gif">
                            <label for="msg">Obg pela sua mensagem ;)</label>
                            <br />
                            <br />
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="panForm" runat="server">
                        <div id="divErMsg">
                            <asp:Label ID="lblErMsg" runat="server" CssClass="lbls_contato" ClientIDMode="Static"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <table class="tabelas_contatos" id="lblErMe">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Nome Completo:" CssClass="lbls_contato"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtNomeContato" runat="server" CssClass="campos_contatos" ClientIDMode="Static"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblErNomeContato" runat="server" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="E-mail:" CssClass="lbls_contato"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtEmailContato" runat="server" CssClass="campos_contatos" ClientIDMode="Static"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblErEmailContato" runat="server" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Mensagem:" CssClass="lbls_contato"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtMensagemContato" runat="server" TextMode="MultiLine" CssClass="txtArea" ClientIDMode="Static"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblErMensagemContato" runat="server" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <table class="botoes_meio">
                        <tr>
                            <td>
                                <asp:Button ID="btnEnviarMsg" runat="server" Text="Enviar" CssClass="btnEnviar" ClientIDMode="Static" OnClientClick="return contato()" OnClick="btnEnviarMsg_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnNovaMsg" runat="server" Text="Nova Mensagem" CssClass="btnEnviar" ClientIDMode="Static" Visible="False" OnClick="btnNovaMsg_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
                <div id="desc" class="form">
                    <br />
                    <div class="descricao">
                        <ul>
                            <li><b>Telefone:</b> (11) 99999-9999</li>
                            <li><b>Email:</b> Doe_Mais@hotmail.com</li>
                            <li><b>Endereço:</b> Av. Tiradentes N° 615 </li>
                            <li><b>Facebook:</b> Doe_Mais.com</li>
                            <li><b>Twitter:</b> @Doe_Mais</li>
                            <li><b>Instagram:</b> Doe_Mais </li>
                        </ul>
                    </div>
                    <br />
                    <div class="mapscontato">
                        <iframe class="maps" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d457.34201114240494!2d-46.632374106664386!3d-23.529811065375608!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce48a9f6219853%3A0x87b87331105a3ac3!2sETESP!5e0!3m2!1spt-BR!2sbr!4v1535134142522"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </article>
</asp:Content>


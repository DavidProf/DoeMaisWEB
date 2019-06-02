<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/index.js"></script>
    <style id="sucesso" type="text/css" runat="server">
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Banner-->
    <div class="banner">
        <img id="banner" src="img/fundo.png">
        <div class="bannerconteudo">
            <div id="bannerfundo">
                <div id="bannerfrente">
                    <p id="fraseum">Faça parte do nosso time ;D</p>
                    <p id="frasedois">Seja um doador ou receptora!</p>
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
            <div class="backgrounddados">
                <div class="titulo">
                    <p>Números da DOE MAIS</p>
                </div>
                <div class="dados">
                    <figure class="dados2">
                        <img id="doacao_img" src="img/doacao.png"><br>
                        <figcaption>
                            <div class="numeros">
                                <asp:Label ID="lblDoacao" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                            </div>
                            <p class="lbl">DOAÇÕES</p>
                        </figcaption>
                    </figure>
                    <figure class="dados2">
                        <img id="doacao_img2" src="img/itens.png"><br>
                        <figcaption>
                            <div class="numeros" id="itens">
                                <asp:Label ID="lblItens" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                            </div>
                            <p class="lbl">ITENS</p>
                        </figcaption>
                    </figure>
                </div>
            </div>

            <div class="doacaonecessaria">
                <br>
                <br>
                <div class="doacao">
                    <p>Doações Necessárias</p>
                </div>
                <br>
                <br>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <!--MSG Erro-->
                <asp:Panel ID="panEr" runat="server" Visible="False">
                    <div class="Er1">
                        <img class="msgErro" src="img/erro.png">
                        <div class="Er2">
                            <br />
                            <br />
                            <asp:Label ID="lblMsgEr" CssClass="lblMsgEr" runat="server" Text="Tivemos um erro no nosso servidor, tente novamente mais tarde" ClientIDMode="Static"></asp:Label>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="panNecessario" runat="server">
                    <div class="divgrids">
                        <asp:Label ID="pop" runat="server" Text=""></asp:Label>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="gridsNecessario" CssClass="gridsNecessario" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="3" OnSelectedIndexChanged="gridsNecessario_SelectedIndexChanged" OnPageIndexChanging="gridsNecessario_PageIndexChanging">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/ver.png" ShowSelectButton="True" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="40px" />
                                    <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/img/vai.png" PreviousPageImageUrl="~/img/volta.png" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" Height="40px" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="gridsNecessario" EventName="PageIndexChanging" />
                            </Triggers>
                        </asp:UpdatePanel>

                    </div>
                </asp:Panel>
            </div>
        </div>

        <!--PopUP-->
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="pop" PopupControlID="Popup" CancelControlID="btnVoltar" BackgroundCssClass="modalBackground" ClientIDMode="Static" X="-1" RepositionMode="RepositionOnWindowResizeAndScroll" Y="-1">
        </ajaxToolkit:ModalPopupExtender>

        <asp:Panel ID="Popup" CssClass="panNecessario" runat="server">
            <div class="necessario1">
                <img id="ftNecessario" src="img/list.png" />
            </div>
            <br />
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div>
                        <table class="tblNecessario">
                            <tr>
                                <td>
                                    <p><b>Instituição:</b></p>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblNecessario" ID="lblInstituicao" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <p><b>Estado:</b></p>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label CssClass="lblNecessario" ID="lblEstado" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><b>Cidade:</b></p>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblNecessario" ID="lblCidade" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div class="comentario">
                        <div class="comentario2">
                            <p><b>COMENTÁRIO:</b></p>
                            <asp:Label ID="lblComentario" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                        </div>

                    </div>
                    <br />
                    <div>
                        <asp:GridView ID="gridItens" CssClass="grids1" runat="server" CellPadding="4" CellSpacing="3" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="gridItens_PageIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="30px" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" Height="30px" />
                            <SelectedRowStyle />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger EventName="PageIndexChanging" ControlID="gridItens" />
                    <asp:AsyncPostBackTrigger ControlID="gridsNecessario" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>


            <div class="necessario3">
                <asp:Button ID="btnDoar" CssClass="btnNecessario" runat="server" Text="Doar" OnClick="btnDoar_Click" />
                <asp:Button ID="btnVoltar" CssClass="btnNecessario" runat="server" Text="Voltar" />
            </div>
        </asp:Panel>
    </article>
</asp:Content>


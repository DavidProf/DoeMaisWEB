<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="historico.aspx.cs" Inherits="historico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style id="sucesso" type="text/css" runat="server">
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bannerLogado">
        <img id="bannerLogado" src="img/fundo2.png" class="auto-style1">
    </div>
    <!----------------------------------------------------------Conteudo--------------------------------------------------------------->
    <article>
        <div class="conteudoLogado">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="titulo">
                <p>HISTÓRICO</p>
            </div>
            <!--MSG Erro-->
            <asp:Panel ID="panEr" runat="server" Visible="False">
                <div class="Er1" id="ErHist">
                    <img class="msgErro" src="img/erro.png">
                    <div class="Er2">
                        <br />
                        <br />
                        <asp:Label ID="lblMsgEr" CssClass="lblMsgEr" runat="server" Text="Tivemos um erro no nosso servidor, tente novamente mais tarde" ClientIDMode="Static"></asp:Label>
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="panHist" runat="server">
                <div class="divgrids">
                    <asp:Label ID="pop" runat="server" Text=""></asp:Label>
                    <asp:GridView ID="gridHist" CssClass="gridsHist" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="3" OnPageIndexChanging="gridHist_PageIndexChanging" OnSelectedIndexChanged="gridHist_SelectedIndexChanged1">
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
                </div>
            </asp:Panel>
        </div>

        <!--PopUP-->
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="pop" PopupControlID="Popup" CancelControlID="btnHist" BackgroundCssClass="modalBackground" ClientIDMode="Static" X="-1" RepositionMode="RepositionOnWindowResizeAndScroll" Y="-1">
        </ajaxToolkit:ModalPopupExtender>

        <asp:Panel ID="Popup" CssClass="panHistorico" runat="server">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="hist1">
                        <img id="ftHist" src="img/hist.png" />
                    </div>
                    <br />
                    <div class="hist4">
                        <table class="tblHist">
                            <tr>
                                <td>
                                    <p><b>Instituição:</b></p>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblHist" ID="lblInstituicao" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><b>Data de Registro:</b></p>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblHist" ID="lblRegistro" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label CssClass="lblBold" ID="lblData1" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblHome" ID="lblData2" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div class="hist2">
                        <asp:GridView ID="gridItens" CssClass="grids1" runat="server" CellPadding="4" CellSpacing="3" ForeColor="#333333" GridLines="None" PageSize="5" AllowPaging="True" OnPageIndexChanging="gridItens_PageIndexChanging">
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
                    <asp:AsyncPostBackTrigger ControlID="gridHist" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>


            <div class="hist3">
                <asp:Button ID="btnHist" CssClass="btnHist" runat="server" Text="Voltar" />
            </div>
        </asp:Panel>
    </article>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/home.js"></script>
    <script src="js/popupcomefeito.js"></script>
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
                <p>HOME</p>
            </div>
            <div id="homepgn" class="homepgn">
                <!--Numeros do doador-->
                <div>
                    <div class="doados">
                        <div class="doados1">
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="lblDoados" CssClass="lblDoados" runat="server" Text="308" ClientIDMode="Static"></asp:Label>
                            <br />
                            <br />
                            <p>DOAÇÕES</p>
                            <p>REALIZADAS</p>
                        </div>
                    </div>
                    <div class="objetos">
                        <div class="objetos1">
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="lblObjetos" CssClass="lblDoados" runat="server" Text="1000" ClientIDMode="Static"></asp:Label>
                            <br />
                            <br />
                            <p>OBJETOS</p>
                            <p>DOADOS</p>
                        </div>
                    </div>
                </div>
            </div>

            <!--Doacões em andamento-->
            <asp:Panel ID="panHome" CssClass="doacoes" runat="server">
                <br />
                <div class="marcador_home">
                    <p>DOAÇÕES EM ANDAMENTO</p>
                </div>
                <br />
                <asp:Panel ID="panHist" runat="server">
                    <div class="divgrids">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" ClientIDMode="Static" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="gridHome" runat="server" CssClass="grids" AllowPaging="True" CellPadding="4" CellSpacing="3" ForeColor="#333333" GridLines="None" OnRowCommand="gridHome_RowCommand" OnPageIndexChanging="gridHome_PageIndexChanging" PageSize="10">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:ButtonField ButtonType="Image" CommandName="ver" ImageUrl="~/img/ver.png" />
                                        <asp:ButtonField ButtonType="Image" CommandName="cancelar" ImageUrl="~/img/cancelar.png" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="40px" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" Height="40px" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </asp:Panel>
                <asp:Label ID="cancelarpop" runat="server" Text=""></asp:Label>
                <asp:Label ID="doacaopop" runat="server" Text=""></asp:Label>
            </asp:Panel>

            <!--MSG Erro-->
            <asp:Panel ID="panEr" runat="server" Visible="False">
                <div class="Er1">
                    <img class="msgErro" src="img/erro.png">

                    <div class="Er2">
                        <br />
                        <br />
                        <asp:Label ID="lblMsgEr" CssClass="lblMsgEr" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                    </div>
                </div>
            </asp:Panel>
        </div>

        <!--PopUP sucesso doação cancelada-->
        <asp:Panel ID="panSucesso" runat="server" ClientIDMode="Static" CssClass="panSucesso" Visible="false">
            <div class="x2" onclick="popX2()">
                x
            </div>
            <p>Doação cancelada com sucesso</p>
        </asp:Panel>

        <!--PopUP-->
        <ajaxToolkit:ModalPopupExtender ID="Modal" runat="server" TargetControlID="doacaopop" PopupControlID="Popup" CancelControlID="btnHome" BackgroundCssClass="modalBackground" ClientIDMode="Static" RepositionMode="RepositionOnWindowResize">
        </ajaxToolkit:ModalPopupExtender>

        <asp:Panel ID="Popup" CssClass="panHome" runat="server">
            <div class="home1">
                <img id="ftHome" src="img/home.png" />
            </div>
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="home4">
                        <table class="tblHome">
                            <tr>
                                <td>
                                    <p><b>Instituição:</b></p>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblHome" ID="lblInstituicao" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><b>Data de Registro:</b></p>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblHome" ID="lblRegistro" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblData1" CssClass="lblBold" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblHome" ID="lblData2" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div class="home2">
                        <asp:GridView ID="gridItens" CssClass="grids1" runat="server" CellPadding="4" CellSpacing="3" ForeColor="#333333" GridLines="None" PageSize="5" AllowPaging="True" OnPageIndexChanging="gridItens_PageIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="30px" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" Height="30px" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger EventName="PageIndexChanging" ControlID="gridItens" />
                    <asp:AsyncPostBackTrigger ControlID="gridHome" EventName="RowCommand" />
                </Triggers>
            </asp:UpdatePanel>
            <div class="home3">
                <asp:Button ID="btnHome" CssClass="btnHome" runat="server" Text="Voltar" />
            </div>
        </asp:Panel>

        <!--PopUPcancelar-->
        <ajaxToolkit:ModalPopupExtender ID="popCancelar" runat="server" TargetControlID="cancelarpop" PopupControlID="popCancelar1" CancelControlID="btnCancelar2" BackgroundCssClass="modalBackground" ClientIDMode="Static" RepositionMode="RepositionOnWindowResize">
        </ajaxToolkit:ModalPopupExtender>

        <asp:Panel ID="popCancelar1" CssClass="panHomeCancelar" runat="server">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="home1">
                        <img id="ftCancelar" src="img/atencao.png" />
                    </div>
                    <div class="home5">
                        <p>DESEJA CANCELAR ESTA DOAÇÃO?</p>
                    </div>
                    <div class="home4">
                        <table class="tblHome">
                            <tr>
                                <td>
                                    <p><b>Instituição:</b></p>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblHome" ID="lblInstituicao1" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><b>Data de Registro:</b></p>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblHome" ID="lblRegistro1" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label CssClass="lblBold" ID="lblData3" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label CssClass="lblHome" ID="lblData4" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger EventName="PageIndexChanging" ControlID="gridHome" />
                    <asp:AsyncPostBackTrigger ControlID="gridHome" EventName="RowCommand" />
                </Triggers>
            </asp:UpdatePanel>

            <div class="cancelar">
                <asp:Button ID="btnCancelar" CssClass="btnCancelar" runat="server" Text="Sim" OnClick="btnCancelar_Click" />
                <asp:Button ID="btnCancelar2" CssClass="btnCancelar" runat="server" Text="Não" />
            </div>
        </asp:Panel>
        <!--PopUP novamente ativo-->
        <asp:Panel ID="panAtivo" runat="server" ClientIDMode="Static" CssClass="panAtivo" Visible="false">
            <div class="x1" onclick="popX1()">
                x
            </div>
            <p>Parabéns!</p>
            <p>Seu cadastro esta ativo novamente ;D</p>
        </asp:Panel>
    </article>
</asp:Content>


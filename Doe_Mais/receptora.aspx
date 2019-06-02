<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="receptora.aspx.cs" Inherits="receptora" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/buscaRecep.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 378px;
        }
        .auto-style3 {
            width: 388px;
        }
        .auto-style4 {
            width: 587px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Banner-->
    <div class="banner">
        <img id="banner" src="img/fundo.png">
        <div class="bannerconteudo">
            <div id="bannerfundo">
                <div id="bannerfrente">
                    <p id="fraseum">Ajude quem precisa </p>
                    <p id="frasedois">Doando o que você não precisa!</p>
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
            <asp:ScriptManager ID="scriptRecep" runat="server"></asp:ScriptManager>
            <div class="titulo">
                <p>Receptoras</p>
            </div>
            <br />
            <asp:UpdatePanel ID="upLbl" runat="server" UpdateMode="Conditional" ClientIDMode="Static" ChildrenAsTriggers="True">
                <ContentTemplate>
                    <div class="lblErRecep">
                        <asp:Label ID="lblErFiltro" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="dropEstado2" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="dropCidade2" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <!--Filtro-->
            <div id="divFiltro">
                <div id="escolhaFiltro">
                    <p class="lbl_Recep">Como você prefere filtrar? </p>
                    <br />
                    <img id="map" class="imgFiltro" src="img/map.png" onclick="porcidade()" />
                    <br />
                    <label class="lblsFiltro" for="map">Por Estado e Cidade</label>
                    <br />
                    <br />
                    <img id="nome" class="imgFiltro" src="img/nome.png" onclick="pornome()" />
                    <br />
                    <label class="lblsFiltro" for="map">Por Nome</label>
                    <br />
                    <br />
                    <img id="abc" class="imgFiltro" src="img/abc.png" onclick="porordem()" />
                    <br />
                    <label class="lblsFiltro" for="abc">Por ordem alfabética</label>
                    <br />
                    <br />
                    <asp:ImageButton ID="tudo" CssClass="imgFiltro" runat="server" ImageUrl="~/img/tudo.png" ClientIDMode="Static" OnClick="tudo_Click" OnClientClick="portudo()" />
                    <br />
                    <label class="lblsFiltro" for="abc">Mostrar todas</label>
                    <br />
                </div>

                <div id="divOpcao">
                    <div id="busca" class="busca">
                        <img id="imgbusca" class="imgbusca" src="img/busca.png" />
                    </div>

                    <div id="porEstado">
                        <asp:Label ID="Label23" runat="server" CssClass="lblsRecep" Text="Escolha o Estado"></asp:Label><br />
                        <br />
                        <asp:DropDownList ID="dropEstado2" CssClass="drops" runat="server" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="dropEstado2_SelectedIndexChanged">
                            <asp:ListItem>Selecione</asp:ListItem>
                            <asp:ListItem>AC</asp:ListItem>
                            <asp:ListItem>AL</asp:ListItem>
                            <asp:ListItem>AP</asp:ListItem>
                            <asp:ListItem>AM</asp:ListItem>
                            <asp:ListItem>BA</asp:ListItem>
                            <asp:ListItem>CE</asp:ListItem>
                            <asp:ListItem>DF</asp:ListItem>
                            <asp:ListItem>ES</asp:ListItem>
                            <asp:ListItem>GO</asp:ListItem>
                            <asp:ListItem>MA</asp:ListItem>
                            <asp:ListItem>MT</asp:ListItem>
                            <asp:ListItem>MS</asp:ListItem>
                            <asp:ListItem>MG</asp:ListItem>
                            <asp:ListItem>PA</asp:ListItem>
                            <asp:ListItem>PB</asp:ListItem>
                            <asp:ListItem>PR</asp:ListItem>
                            <asp:ListItem>PE</asp:ListItem>
                            <asp:ListItem>PI</asp:ListItem>
                            <asp:ListItem>RN</asp:ListItem>
                            <asp:ListItem>RS</asp:ListItem>
                            <asp:ListItem>RJ</asp:ListItem>
                            <asp:ListItem>RO</asp:ListItem>
                            <asp:ListItem>RR</asp:ListItem>
                            <asp:ListItem>SC</asp:ListItem>
                            <asp:ListItem>SP</asp:ListItem>
                            <asp:ListItem>SE</asp:ListItem>
                            <asp:ListItem>TO</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:UpdatePanel ID="upEstado" runat="server" UpdateMode="Conditional" ClientIDMode="Static" ChildrenAsTriggers="True">
                            <ContentTemplate>
                                <asp:Label ID="lblCity" runat="server" CssClass="lblsRecep" Text="Escolha a Cidade"></asp:Label><br />
                                <br />
                                <asp:DropDownList ID="dropCidade2" CssClass="drops" runat="server" ClientIDMode="Static" AutoPostBack="True" Enabled="False">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="dropEstado2" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>

                    <div id="porNome">
                        <asp:Label ID="Label20" runat="server" CssClass="lblsRecep" Text="Digite o nome da instituição, ou uma parte dele"></asp:Label><br />
                        <br />
                        <asp:TextBox ID="txtInstituicao" CssClass="txtRecep" runat="server" ClientIDMode="Static"></asp:TextBox>
                    </div>

                    <div id="porOrdem">
                        <asp:Label ID="Label21" runat="server" CssClass="lblsRecep" Text="Escolha uma letra"></asp:Label><br />
                        <br />
                        <asp:DropDownList ID="dropLetra" CssClass="drops" runat="server" ClientIDMode="Static">
                            <asp:ListItem>Selecione</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                            <asp:ListItem>F</asp:ListItem>
                            <asp:ListItem>G</asp:ListItem>
                            <asp:ListItem>H</asp:ListItem>
                            <asp:ListItem>I</asp:ListItem>
                            <asp:ListItem>J</asp:ListItem>
                            <asp:ListItem>K</asp:ListItem>
                            <asp:ListItem>L</asp:ListItem>
                            <asp:ListItem>M</asp:ListItem>
                            <asp:ListItem>N</asp:ListItem>
                            <asp:ListItem>O</asp:ListItem>
                            <asp:ListItem>P</asp:ListItem>
                            <asp:ListItem>Q</asp:ListItem>
                            <asp:ListItem>R</asp:ListItem>
                            <asp:ListItem>S</asp:ListItem>
                            <asp:ListItem>T</asp:ListItem>
                            <asp:ListItem>U</asp:ListItem>
                            <asp:ListItem>V</asp:ListItem>
                            <asp:ListItem>W</asp:ListItem>
                            <asp:ListItem>X</asp:ListItem>
                            <asp:ListItem>Y</asp:ListItem>
                            <asp:ListItem>Z</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="btnRecep" id="btnRecep">
                    <asp:Button ID="btnBuscar" class="btnRecep2" runat="server" Text="Buscar" OnClick="btnBuscar_Click" ClientIDMode="Static" />
                    <br />
                    <br />
                </div>
            </div>
            <!--Repeater-->
            <asp:UpdatePanel ID="upInstituicao" runat="server" UpdateMode="Conditional" ClientIDMode="Static" ChildrenAsTriggers="True">
                <ContentTemplate>
                    <asp:Panel ID="panInsti" runat="server">
                        <div class="divgrids">
                            <asp:Label ID="pop" runat="server" Text=""></asp:Label>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:GridView ID="gridRecep" CssClass="gridsNecessario" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="3" AutoGenerateColumns="False" DataKeyNames="CNPJ" OnRowCommand="gridRecep_RowCommand" PageSize="50">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/ver.png" ShowSelectButton="True" />
                                            <asp:TemplateField HeaderText="Id" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CNPJ") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CNPJ") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Instituição">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NomeFantasia") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("NomeFantasia") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Estado">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UF") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UF") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cidade">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Cidade") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Cidade") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                    <asp:AsyncPostBackTrigger ControlID="gridRecep" EventName="PageIndexChanging" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </asp:Panel>

                    <!--PopUP-->
                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="pop" PopupControlID="Popup" CancelControlID="btnVoltar" BackgroundCssClass="modalBackground" ClientIDMode="Static" X="-1" RepositionMode="RepositionOnWindowResizeAndScroll" Y="-1">
                    </ajaxToolkit:ModalPopupExtender>

                    <asp:Panel ID="Popup" CssClass="panNecessario" runat="server">
                        <div class="necessario1">
                            <img id="ftNecessario" src="img/inst.png" />
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
                                            <td>
                                                <p><b>Endereço:</b></p>
                                            </td>
                                            <td>
                                                <asp:Label CssClass="lblNecessario" ID="lblEndereco" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p><b>CEP:</b></p>
                                            </td>
                                            <td>
                                                <asp:Label CssClass="lblNecessario" ID="lblCep" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <p><b>Cidade:</b></p>
                                            </td>
                                            <td class="auto-style1">
                                                <asp:Label CssClass="lblNecessario" ID="lblCidade" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p><b>Estado:</b></p>
                                            </td>
                                            <td>
                                                <asp:Label CssClass="lblNecessario" ID="lblEstado" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p><b>E-mail:</b></p>
                                            </td>
                                            <td>
                                                <asp:Label CssClass="lblNecessario" ID="lblEmail" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p><b>Telefones:</b></p>
                                            </td>
                                            <td>
                                                <asp:Label CssClass="lblNecessario" ID="lblFones" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p><b>Dias Abertos:</b></p>
                                            </td>
                                            <td>
                                                <asp:Label CssClass="lblNecessario" ID="lblAbertos" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <br />
                                <div class="comentario">
                                    <div class="comentario2">
                                        <p><b>Resumo da instituição:</b></p>
                                        <asp:Label ID="lblResumo" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                    </div>
                                </div>
                                <div>
                                    <table class="tblNecessario">
                                        <tr>
                                            <td class="auto-style4">
                                                <p><b>Notas dadas por doadores</b></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style4">
                                                <p><b>Atendimento do funcionário:</b></p>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label CssClass="lblNecessario" ID="lblAtend" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style4">
                                                <p><b>Agilidade na doação:</b></p>
                                            </td>
                                            <td>
                                                <asp:Label CssClass="lblNecessario" ID="lblAgilidade" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style4">
                                                <p><b>Confiança:</b></p>
                                            </td>
                                            <td class="auto-style1">
                                                <asp:Label CssClass="lblNecessario" ID="lblConfianca" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style4">
                                                <p><b>Transparência do atendimento:</b></p>
                                            </td>
                                            <td>
                                                <asp:Label CssClass="lblNecessario" ID="lblTrans" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style4">
                                                <p><b>Cuidado com a doação:</b></p>
                                            </td>
                                            <td>
                                                <asp:Label CssClass="lblNecessario" ID="lblCuidado" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <br />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="gridRecep" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="necessario3">
                            <asp:Button ID="btnVoltar" CssClass="btnNecessario" runat="server" Text="Voltar" />
                        </div>
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="dropLetra" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="tudo" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </article>
</asp:Content>


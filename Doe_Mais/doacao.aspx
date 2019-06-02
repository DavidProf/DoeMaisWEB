<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="doacao.aspx.cs" Inherits="doacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/doacao.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Banner-->
    <div class="bannerLogado">
        <img id="bannerLogado" src="img/fundo2.png" class="auto-style1">
    </div>
    <!--Conteudo-->
    <article>
        <div class="conteudo" style="margin-top: 200px;">
            <div class="titulo">
                <p>Doação</p>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
            <asp:UpdatePanel ID="upPanDoacao" runat="server" ClientIDMode="Static">
                <ContentTemplate>
                    <div class="divDoar">
                        <br />
                        <asp:Panel ID="panObg" CssClass="panObg" runat="server" Visible="False">
                            <img id="vlw" src="img/vlw.png" />
                            <br />
                            <div class="divObg">
                                <p>Obrigado pela DOAÇÃO ;D</p>
                            </div>
                            <br />
                            <asp:Button ID="btnNova" CssClass="btnNova" runat="server" Text="Nova Doação" OnClick="btnNova_Click" />
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="pan2" CssClass="pan2" runat="server" ClientIDMode="Static" Visible="False">
                        </asp:Panel>
                        <asp:Panel ID="panEstado" runat="server">
                            <div class="pans_doacao">
                                <div class="passos_cadastro">
                                    <img id="one" src="img/one.png" />
                                    <label for="one">Selecione seu Estado !</label>
                                </div>
                                <br />
                                <asp:DropDownList ID="lstUf" CssClass="drops" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstUf_SelectedIndexChanged">
                                    <asp:ListItem>-Selecione-</asp:ListItem>
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
                                <br />
                                <div class="labelsDoar">
                                    <asp:Label ID="lblErCidade" CssClass="lblsDoar" runat="server" align="center"></asp:Label>
                                </div>
                                <br />
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="panCidade" CssClass="pans_doacao" runat="server" Visible="False">
                            <div class="passos_cadastro">
                                <img id="two" src="img/two.png" />
                                <label for="two">Selecione sua Cidade !</label>
                            </div>
                            <br />
                            <asp:DropDownList ID="lstCidade" CssClass="drops" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstCidade_SelectedIndexChanged"></asp:DropDownList>
                            <br />
                            <br />
                            <div class="labelsDoar">
                                <asp:Label ID="lblErInstituicao" CssClass="lblsDoar" runat="server" align="center"></asp:Label>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="panInstituicao" CssClass="pans_doacao" runat="server" Visible="False">

                            <div class="passos_cadastro">
                                <img id="three" src="img/three.png" />
                                <label for="three">Selecione a Instituição !</label>
                            </div>
                            <br />
                            <asp:Repeater runat="server" ID="repInstituicao">
                                <HeaderTemplate>
                                    <table class="tabelas_doacao">
                                        <tr>
                                            <th>Instituição</th>
                                            <th>Endereço</th>
                                            <th>Cep</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("NomeFantasia") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Endereço" runat="server" Text='<%# Eval("Logradouro") + " <b>Bairro:</b> "+ Eval("Bairro") + " <b>N°:</b> " + Eval("Numero")%>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Cep" runat="server" Text='<%# Eval("Cep") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                            <br />
                            <asp:DropDownList ID="lstInstituicao" CssClass="drops" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstInstituicao_SelectedIndexChanged"></asp:DropDownList>
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="panItens" CssClass="pans_doacao" runat="server" Visible="False">
                            <div class="passos_cadastro">
                                <img id="four" runat="server" src="img/four.png" style="width: 40px; height: 40px" />
                                <label for="four">Selecione os itens e insira a quantidade !</label>
                            </div>
                            <br />
                            <div class="labelsDoar">
                                <asp:Label ID="lblItens" CssClass="lblsDoar" runat="server" align="center" ClientIDMode="Static"></asp:Label>
                            </div>
                            <br />
                            <asp:Repeater runat="server" ID="Repeater1">
                                <HeaderTemplate>
                                    <table class="tabelas_doacao">
                                        <tr>
                                            <th scope="col" style="width: 120px">Código
                                            </th>
                                            <th scope="col" style="width: 120px">Nome
                                            </th>
                                            <th scope="col" style="width: 120px">Quantidade
                                            </th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="Check" Text='<%# " " +Eval("IdItemPreCadastro") %>' CssClass="checado" runat="server" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Nome" runat="server" Text='<%# Eval("ItemNome") %>' />
                                        </td>
                                        <td class="tabelaitens">
                                            <asp:TextBox ID="Quantidade" CssClass="txtdoar" runat="server" MaxLength="2" ClientIDMode="Static" onkeyup="somenteNumeros(this)"></asp:TextBox>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                            <br />
                            <hr />
                            <br />
                        </asp:Panel>

                        <asp:Panel ID="panAgendar" CssClass="pans_doacao" runat="server">
                            <br />
                            <asp:Panel ID="panDomicilio" runat="server" Visible="False">
                                <asp:Label ID="lblDoacao" CssClass="lblDoacao" runat="server" Text="Deseja que a receptora retire em domicílio?"></asp:Label>
                                <br />
                                <br />
                                <asp:RadioButton ID="radSim" runat="server" GroupName="domicilio" Text=" Sim" AutoPostBack="true" OnCheckedChanged="radSim_CheckedChanged" />
                                <asp:RadioButton ID="radNao" runat="server" GroupName="domicilio" Text=" Não" AutoPostBack="true" OnCheckedChanged="radNao_CheckedChanged" Checked="True" />
                                <br />
                                <br />
                            </asp:Panel>
                            <div class="labelsDoar">
                                <asp:Label ID="lblAgenda" CssClass="lblsDoar" runat="server" align="center" ClientIDMode="Static"></asp:Label>
                            </div>
                            <br />
                            <hr />
                            <br />

                            <div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="labelsDoar">
                                            <asp:Label ID="lblErData" CssClass="lblsDoar" runat="server" align="center" ClientIDMode="Static"></asp:Label>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="radSim" EventName="CheckedChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="radNao" EventName="CheckedChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="horaAgenda" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="txtdata" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <br />
                                <table id="agenda">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblData" runat="server" Text="Escolha uma data:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="txt" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtdata" CssClass="txtdata" runat="server" ClientIDMode="Static" onkeypress="return false" onkeydown="return false" AutoPostBack="True" OnTextChanged="txtdata_TextChanged"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="dataRetira" runat="server" TargetControlID="txtdata" ClientIDMode="Static" PopupPosition="Left" TodaysDateFormat="d,MMMM, yyyy" Format="dd/MM/yyyy" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="radSim" EventName="CheckedChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="radNao" EventName="CheckedChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblHorario" runat="server" Text="Escolha um horário:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="horaAgenda" CssClass="drops" runat="server" ClientIDMode="Static" Enabled="False"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger EventName="TextChanged" ControlID="txtdata" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br />
                            <table class="tabelas_cadastro" id="tblBtn">
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="btnProximo" CssClass="imgBtn" runat="server" ImageUrl="~/img/proximo.png" ClientIDMode="Static" OnClick="btnProximo_Click" OnClientClick="return validardoacao()" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />

                        <!---Confirmação da doaçao--->
                        <asp:Panel ID="panParte2" runat="server" CssClass="panParte2" Visible="true">
                            <div class="lstDados">
                                <div class="lstFrase">
                                    <p>Todos os dados da doação estão corretos?</p>
                                </div>
                                <br />
                                <table class="lstTable">
                                    <tr>
                                        <td class="lstMin">
                                            <p><b>Instituição:</b></p>
                                        </td>
                                        <td>
                                            <asp:Label ID="instituicao" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lstMin">
                                            <p><b>Retirar em domicílio:</b></p>
                                        </td>
                                        <td>
                                            <asp:Label ID="retira" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lstMin">
                                            <p><b>Data:</b></p>
                                        </td>
                                        <td>
                                            <asp:Label ID="data" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lstMin">
                                            <p><b>Hora:</b></p>
                                        </td>
                                        <td>
                                            <asp:Label ID="hora" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="divgrids">

                                <asp:GridView ID="gridsLst" CssClass="gridsLst" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="3" PageSize="10" OnPageIndexChanging="gridsLst_PageIndexChanging">
                                    <AlternatingRowStyle BackColor="White" />
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
                                <br />
                            </div>
                            <div class="lstBtn">
                                <asp:Button ID="lstDoar" CssClass="lstDoar" runat="server" Text="Sim" OnClick="lstDoar_Click" />
                                <asp:Button ID="lstVoltar" CssClass="lstVoltar" runat="server" Text="Não" OnClick="lstVoltar_Click" />
                            </div>
                        </asp:Panel>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </article>
</asp:Content>


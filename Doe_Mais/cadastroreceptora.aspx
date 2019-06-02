<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="cadastroreceptora.aspx.cs" Inherits="cadastroreceptora" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/receptora.js"></script>
    <script src="js/popupduvida.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Banner-->
    <div class="banner">
        <img id="banner" src="img/fundo.png">
        <div class="bannerconteudo">
            <div id="bannerfundo">
                <div id="bannerfrente">
                    <p id="fraseum">É a intenção, e não a doação,</p>
                    <p id="frasedois">que faz o doador.</p>
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
        <div class="conteudo">
            <div class="titulo">
                <p>Cadastro</p>
            </div>
            <div class="cadastro_frase">
                <p>Cadastre aqui sua receptora e nos deixe ajudar a trazer sorrisos ;) </p>
            </div>
            <div class="folhade_cadastro">
                <div class="passos_cadastro">
                    <img id="one" src="img/one.png" />
                    <label for="two">Preencha os campos !</label>
                </div>
                <div id="divErCadastro">
                    <br />
                    <asp:Label ID="lblErCadastro" runat="server" ClientIDMode="Static"></asp:Label>
                </div>
                <br />
                <div id="marcador">
                    <br />
                    <div class="marcador_cadastro">
                        <p>Digite seus dados </p>
                    </div>
                    <br />
                </div>
                <div class="campos_cnpj" id="campos_cnpj">
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="lblRazao" runat="server" Text="*Razão Social:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="lblCnpj" runat="server" Text="*CNPJ:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtRazao" runat="server" TabIndex="3" ClientIDMode="Static" MaxLength="25" placeholder="Ex. DoeMais"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtCnpj" runat="server" MaxLength="14" TabIndex="4" ClientIDMode="Static" placeholder="Ex. 12.345.678/9012-34"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErRazao" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErCnpj" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label20" runat="server" Text="*Nome Fantasia:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtFantasia" runat="server" TabIndex="3" ClientIDMode="Static" MaxLength="25" placeholder="Ex. DoeMais"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErFantasia" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="cadastro_dados" id="cadastro_dados">
                    <br />
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
                                <asp:TextBox CssClass="campos_cadastro" ID="txtLogradouro" runat="server" TabIndex="6" ClientIDMode="Static"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErCep" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErLogradouro" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
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
                                <asp:TextBox CssClass="campos_cadastro" ID="txtBairro" runat="server" TabIndex="7" ClientIDMode="Static"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtCidade" runat="server" TabIndex="8" ClientIDMode="Static"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErBairro" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErCidade" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
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
                                <asp:Label CssClass="lbls_erros" runat="server" ID="lblErUf" ClientIDMode="Static"></asp:Label>
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
                                <asp:TextBox CssClass="campos_cadastro" ID="txtNumero" runat="server" TabIndex="9" ClientIDMode="Static" MaxLength="5" placeholder="Ex. 2111"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtComplemento" runat="server" TabIndex="10" ClientIDMode="Static" MaxLength="25"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErNumero" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
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
                                <asp:Label CssClass="lbls_cadastro" ID="Label15" runat="server" Text="*Tel. 2:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtTelUm" runat="server" TabIndex="11" MaxLength="11" ClientIDMode="Static" placeholder="Ex. (99)99999-9999"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox CssClass="campos_cadastro" ID="txtTel2Rec" runat="server" TabIndex="12" MaxLength="11" ClientIDMode="Static" placeholder="Ex. (99)99999-9999"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErTel1" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErTel2Rec" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div class="marcador_cadastro" id="marcador_quatro">
                        <p>Seja uma receptora ;)</p>
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
                                <asp:TextBox CssClass="campos_cadastro" ID="txtEmail" runat="server" TabIndex="13" ClientIDMode="Static" MaxLength="80" placeholder="Ex. Doe_Mais@hotmail.com"></asp:TextBox>
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
                            <td class="auto-style1">
                                <asp:TextBox CssClass="campos_cadastro" ID="txtSenha" runat="server" MaxLength="10" TabIndex="15" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:TextBox CssClass="campos_cadastro" ID="txtSenha1" runat="server" MaxLength="10" TabIndex="16" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
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
                    <div class="marcador_cadastro" id="marcador_cinco">
                        <p>Dados da instituição</p>
                    </div>
                    <br />
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label2" runat="server" Text="*Retira em domicílio:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label4" runat="server" Text="*Horário de funcionamento:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton CssClass="lbls_cadastro" ID="radSim" runat="server" ClientIDMode="Static" Text=" Sim" GroupName="domicilio" ValidationGroup="domicilio" Checked="True" />
                            </td>
                            <td>
                                <asp:Label ID="Label16" CssClass="lbls_cadastro" runat="server" Text="De: "></asp:Label>
                                <asp:DropDownList ID="droHora1" runat="server" CssClass="drops" ClientIDMode="Static">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="radNao" runat="server" CssClass="lbls_cadastro" ClientIDMode="Static" Text=" Não" GroupName="domicilio" ValidationGroup="domiciolio" />
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" CssClass="lbls_cadastro" Text="Até: "></asp:Label>
                                <asp:DropDownList ID="droHora2" runat="server" CssClass="drops" ClientIDMode="Static">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErRetira" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblErHr" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table class="tabelas_cadastro_Funcionamento">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label5" runat="server" Text="*Dias de funcionamento:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton CssClass="lbls_cadastro" ID="radSemana" runat="server" Checked="True" Text=" Dias de Semana" ClientIDMode="Static" GroupName="diasSemana" onchange="semana()" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton CssClass="lbls_cadastro" ID="radFim" runat="server" Text=" Fins de Semana" ClientIDMode="Static" GroupName="diasSemana" onchange="fim()" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton CssClass="lbls_cadastro" ID="radTodos" runat="server" Text=" Todos os dias" ClientIDMode="Static" GroupName="diasSemana" onchange="todos()" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton CssClass="lbls_cadastro" ID="radOutro" runat="server" Text=" Outro" ClientIDMode="Static" GroupName="diasSemana" onchange="outrosDias()" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErDia" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="panSemana" runat="server">
                        <div id="divFuncionamento" class="divFuncionamento">
                            <table class="tabelas_cadastro_Funcionamento2">
                                <tr>
                                    <td>
                                        <asp:CheckBox CssClass="lbls_cadastro" ID="Segunda" runat="server" Text=" Segunda" ClientIDMode="Static" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox CssClass="lbls_cadastro" ID="Terça" runat="server" Text=" Terça" ClientIDMode="Static" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox CssClass="lbls_cadastro" ID="Quarta" runat="server" Text=" Quarta" ClientIDMode="Static" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox CssClass="lbls_cadastro" ID="Quinta" runat="server" Text=" Quinta" ClientIDMode="Static" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox CssClass="lbls_cadastro" ID="Sexta" runat="server" Text=" Sexta" ClientIDMode="Static" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox CssClass="lbls_cadastro" ID="Sábado" runat="server" Text=" Sábado" ClientIDMode="Static" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox CssClass="lbls_cadastro" ID="Domingo" runat="server" Text=" Domingo" ClientIDMode="Static" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <table class="tabelas_cadastro">
                        <tr>
                            <td>
                                <asp:Label CssClass="lbls_cadastro" ID="Label6" runat="server" Text="*Descreva aqui um pouco da instituição:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtResumo" CssClass="txtResumo" runat="server" TextMode="MultiLine" ClientIDMode="Static" onkeypress="return CheckLength()" AutoPostBack="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblErResumo" CssClass="lbls_erros" ClientIDMode="Static"></asp:Label>
                            </td>
                        </tr>
                    </table>

                    <table class="botoes_meio">
                        <tr>
                            <td>
                                <asp:Button ID="btnEnviarCadastro" runat="server" Text="Enviar" CssClass="btnEnviar" ClientIDMode="Static" OnClientClick="return validarreceptora()" OnClick="btnEnviarCadastro_Click" />
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


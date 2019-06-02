<%@ Page Title="" Language="C#" MasterPageFile="~/DoeMaster.master" AutoEventWireup="true" CodeFile="sobre.aspx.cs" Inherits="sobre" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Banner-->
    <div class="banner">
        <img id="banner" src="img/fundo.png">

        <div class="bannerconteudo">
            <div id="bannerfundo">
                <div id="bannerfrente">
                    <p id="fraseum">Sua atituide</p>
                    <p id="frasedois">é a nossa maior doação ;D</p>
                </div>
            </div>
            <div class="btnbanner">
                <a href="cadastrodoador.aspx" class="btnsBanner" id="linkBanner" runat="server">DOADOR!</a>
                <a href="cadastroreceptora.aspx" class="btnsBanner" id="linkBanner2" runat="server">RECEPTORA!</a>
            </div>
        </div>
    </div>
    <!--Conteudo-->
    <article>
        <div class="conteudo">

            <div class="titulo">
                <p>SOBRE NÓS</p>
            </div>

            <div class="sobrenos">
                <div class="sobre_img">
                    <img src="img/doemais.jpg">
                </div>

                <div class="sobre_texto">
                    <center><p id="doemais">DOE MAIS</p></center>
                    <br>
                    <p>A Doe Mais é uma empresa que tem como objetivo solucionar os problemas na administração no recebimento de  doações para as empresas, ONG's e instituições religiosas e motivar as pessoas para que a prática da doação seja a cada dia mais comum e que cresça com o passar do tempo. Está empresa foi criada, pensada e produzida por um grupo de jovens que enxergaram essa necessidade em nossa sociedade e buscando soluções tecnológicas para que a organização do processo de doação seja mais ágil e produtiva, graças a sua logística única e simples. Com nossos softwares e site, vamos tornar realidade a vontade de diversos locais que dependem desse tipo de altruísmo, e trazer a felicidade para muitas pessoas. </p>

                </div>
            </div>

        </div>

    </article>
</asp:Content>


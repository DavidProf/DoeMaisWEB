using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;

public partial class historico : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("login.aspx");
            Response.End();
        }

        atualizarGrid1();
    }

    public void atualizarGrid1() {
        //populando o gridview histórico
        Conexao conexao = new Conexao();
        try
        {
            //conectar no banco
            conexao.conectar();
        }
        catch (SqlException)
        {
            panEr.Visible = true;
            lblMsgEr.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            panHist.Visible = false;
        }
        try
        {
            //Comandos sql
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();
            String pegarHistorico = "SELECT DISTINCT IdDoacao as 'Identificação', DataRegistro as 'Data de registro', tblInstituicao.NomeFantasia as 'Instituição' FROM tblDoacao " +
                "LEFT JOIN tblDoador ON tblDoacao.fk_IdDoador = tblDoador.IdDoador " +
                "LEFT JOIN tblDetalheDoacao ON tblDoacao.IdDoacao = tblDetalheDoacao.fk_IdDoacao " +
                "LEFT JOIN tblItemDetalhe ON tblDetalheDoacao.fk_IdItemDetalhe = tblItemDetalhe.IdItemDetalhe " +
                "LEFT JOIN tblInstituicao " +
                "ON tblItemDetalhe.fk_CNPJ = tblInstituicao.CNPJ " +
                "WHERE tblDoacao.Pendente = 0 AND tblDoador.IdDoador LIKE @idDoador AND tblDoacao.Cancelada = 0";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@idDoador", SqlDbType.VarChar).Value = Session["IdDoador"];
            conexao.command.CommandText = pegarHistorico;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);
            conexao.fechaConexao();

            if (dt.Tables[0].DefaultView.Count == 0)
            {
                panEr.Visible = true;
                lblMsgEr.Text = "Não encontramos nenhum histórico, faça uma doação para ter um :(";
                sucesso.InnerText = ".grids, .grids1, .gridsHist {overflow: auto;}";
            }
            else
            {
                panEr.Visible = false;
                sucesso.InnerText = "@media (max-width: 890px ) {.grids, .grids1, .gridsHist {overflow: scroll;}}";
                //mandando para o grid
                gridHist.DataSource = dt;
                gridHist.DataBind();
            }
        }
        catch (Exception)
        {
            panEr.Visible = true;
            lblMsgEr.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            panHist.Visible = false;
        }
    }

    protected void gridHist_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridHist.PageIndex = e.NewPageIndex;
        atualizarGrid1();
    }

    protected void gridHist_SelectedIndexChanged1(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
        int id = Convert.ToInt32(gridHist.SelectedRow.Cells[1].Text);
        lblInstituicao.Text = gridHist.SelectedRow.Cells[3].Text;
        lblRegistro.Text = gridHist.SelectedRow.Cells[2].Text;
        atualizarItens(id);
        Session.Remove("id");
        Session["id"] = id;
    }

    public void atualizarItens(int id)
    {
        //populando o gridview itens
        Conexao conexao = new Conexao();
        try
        {
            //conectar no banco
            conexao.conectar();
        }
        catch (SqlException)
        {
            panEr.Visible = true;
            lblMsgEr.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            panHist.Visible = false;
            lblData1.Text = "---";
            lblData2.Text = "---";
            lblInstituicao.Text = "---";
            lblRegistro.Text = "---";
        }
        try
        {
            //Comandos sql para pegar itens
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();
            String pegarItens = "SELECT tblItemPreCadastro.ItemNome as 'Item', COUNT(*) as 'Quantidade'FROM tblDetalheDoacao " +
                "LEFT JOIN tblItemDetalhe " +
                "ON tblDetalheDoacao.fk_IdItemDetalhe = tblItemDetalhe.IdItemDetalhe " +
                "LEFT JOIN tblItemPreCadastro " +
                "ON tblItemDetalhe.fk_IdItemPreCadastro = tblItemPreCadastro.IdItemPreCadastro " +
                "WHERE tblDetalheDoacao.fk_IdDoacao = @idDoacao GROUP BY ItemNome";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@idDoacao", SqlDbType.VarChar).Value = id;
            conexao.command.CommandText = pegarItens;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);

            //Comandos sql para pegar datas
            DataSet dt1 = new DataSet();
            String pegarDatas = "SELECT DataEntrega, DataRetirada from tblDoacao where IdDoacao = @idDoacao1 ";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@idDoacao1", SqlDbType.VarChar).Value = id;
            conexao.command.CommandText = pegarDatas;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt1);

            conexao.fechaConexao();

            //mandando para o gridview de itens
            gridItens.DataSource = dt.Tables[0];
            gridItens.DataBind();

            //mandando para as lbls de datas
            if (dt1.Tables[0].DefaultView[0].Row["DataEntrega"].ToString().Equals(""))
            {
                lblData2.Text = dt1.Tables[0].DefaultView[0].Row["DataRetirada"].ToString();
                lblData1.Text = "Data de Retirada:";
            }
            else
            {
                lblData2.Text = dt1.Tables[0].DefaultView[0].Row["DataEntrega"].ToString();
                lblData1.Text = "Data de Entrega";
            }
            
        }
        catch (Exception)
        {
            panEr.Visible = true;
            lblMsgEr.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            panHist.Visible = false;
            lblData1.Text = "---";
            lblData2.Text = "---";
            lblInstituicao.Text = "---";
            lblRegistro.Text = "---";
        }
    }

    protected void gridItens_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridItens.PageIndex = e.NewPageIndex;
        atualizarItens(Convert.ToInt32(Session["id"]));
    }
}
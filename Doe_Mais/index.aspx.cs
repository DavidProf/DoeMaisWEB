using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Convert.ToInt32(Session["logado"]) != 0)
        {
            linkBanner.HRef = "doacao.aspx";
            linkBanner2.HRef = "receptora.aspx";
        }
        try
        {
            Conexao conexao = new Conexao();

            //conectar no banco
            conexao.conectar();
            //Comandos sql
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();

            //pegando a quantidade de doaçoes
            String pegarDoacao = "select count(*) as doacao from tblDoacao where Pendente = 0";
            conexao.command.CommandText = pegarDoacao;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);
            lblDoacao.Text = dt.Tables[0].DefaultView[0].Row["doacao"].ToString();
            dt.Clear();

            //pegando a quantidade de itens
            String pegarItens = "select count(*) as itens from tblItemDetalhe " +
                "where IdItemDetalhe in (Select fk_IdItemDetalhe from tblDetalheDoacao " +
                "where fk_IdDoacao in (Select IdDoacao from tblDoacao " +
                "where Pendente = 0))";
            conexao.command.CommandText = pegarItens;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);
            lblItens.Text = dt.Tables[0].DefaultView[0].Row["itens"].ToString();

            conexao.fechaConexao();

        }
        catch (Exception)
        {
            lblDoacao.Text = "---";
            lblItens.Text = "---";
            return;
        }

        atualizarGrid1();
    }

    /*--------Doacão necessária----------*/

    public void atualizarGrid1()
    {
        //populando o gridview necessario
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
            panNecessario.Visible = false;
        }
        try
        {
            //Comandos sql
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();
            String pegarPropaganda = "SELECT IdPropaganda as 'Identificação', tblInstituicao.NomeFantasia as 'Instituição'," +
                "Uf as 'Estado', Cidade as 'Cidade' FROM tblPropaganda " +
                "LEFT JOIN tblInstituicao ON tblPropaganda.fk_CNPJ = tblInstituicao.CNPJ " +
                "where tblPropaganda.DataInicio <= GETDATE() and tblPropaganda.DataFim >= GETDATE()";
            conexao.command.CommandText = pegarPropaganda;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);
            conexao.fechaConexao();

            if (dt.Tables[0].DefaultView.Count == 0)
            {
                panEr.Visible = true;
                lblMsgEr.Text = "Não encontramos nenhuma doação necessária";
                sucesso.InnerText = ".gridsNecessario {overflow: auto;}";
            }
            else
            {
                panEr.Visible = false;
                sucesso.InnerText = "@media (max-width: 890px ) {.gridsNecessario {overflow: scroll;}}";
                //mandando para o grid
                gridsNecessario.DataSource = dt;
                gridsNecessario.DataBind();
            }
        }
        catch (Exception)
        {
            panEr.Visible = true;
            lblMsgEr.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            panNecessario.Visible = false;
        }
    }

    protected void gridsNecessario_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(gridsNecessario.SelectedRow.Cells[1].Text);
        lblInstituicao.Text = gridsNecessario.SelectedRow.Cells[2].Text;
        lblEstado.Text = gridsNecessario.SelectedRow.Cells[3].Text;
        lblCidade.Text = gridsNecessario.SelectedRow.Cells[4].Text;
        Session.Remove("id");
        Session["id"] = id;
        ModalPopupExtender1.Show();
        atualizarItens(id);
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
            panNecessario.Visible = false;
            lblEstado.Text = "---";
            lblCidade.Text = "---";
            lblInstituicao.Text = "---";
        }
        try
        {
            //Comandos sql para pegar itens
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();
            String pegarItens = "select ItemNome as Item, Qtd as Quantidade from tblPropaganda " +
                "left join tblDetalhePropaganda " +
                "on fk_IdPropaganda = IdPropaganda " +
                "left join tblItemPreCadastro " +
                "on fk_IdItemPreCadastro = IdItemPreCadastro " +
                "where tblPropaganda.IdPropaganda like @idProp";
            String pegarComentario = "Select comentario from tblPropaganda where IdPropaganda = @idProp";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@idProp", SqlDbType.VarChar).Value = id;
            conexao.command.CommandText = pegarItens;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);

            //mandando para o gridview de itens
            gridItens.DataSource = dt.Tables[0];
            gridItens.DataBind();

            dt.Reset();

            //pegando o comentario
            conexao.command.CommandText = pegarComentario;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);

            lblComentario.Text = dt.Tables[0].DefaultView[0].Row["comentario"].ToString();

            conexao.fechaConexao();
        }

        catch (Exception)
        {
            panEr.Visible = true;
            lblMsgEr.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            panNecessario.Visible = false;
            lblEstado.Text = "---";
            lblCidade.Text = "---";
            lblInstituicao.Text = "---";
        }
    }

    protected void gridsNecessario_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridsNecessario.PageIndex = e.NewPageIndex;
        atualizarGrid1();
    }

    protected void btnDoar_Click(object sender, EventArgs e)
    {
        String instituicao = gridsNecessario.SelectedRow.Cells[2].Text;

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
            panNecessario.Visible = false;
            lblEstado.Text = "---";
            lblCidade.Text = "---";
            lblInstituicao.Text = "---";
        }
        try
        {
            //Comandos sql para pegar itens
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();
            String pegarCnpj = "Select CNPJ from tblInstituicao where NomeFantasia like @Nome";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("Nome", SqlDbType.VarChar).Value = instituicao;
            conexao.command.CommandText = pegarCnpj;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);

            conexao.fechaConexao();
            Session["instituicaoCnpj"] = dt.Tables[0].DefaultView[0].Row["CNPJ"].ToString();
        }

        catch (Exception)
        {
            panEr.Visible = true;
            lblMsgEr.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            panNecessario.Visible = false;
            lblEstado.Text = "---";
            lblCidade.Text = "---";
            lblInstituicao.Text = "---";
        }
        Session["instituicao2"] = gridsNecessario.SelectedRow.Cells[2].Text;
        Session["estado"] = gridsNecessario.SelectedRow.Cells[3].Text;
        Session["cidade"] = gridsNecessario.SelectedRow.Cells[4].Text;
        Session["doar"] = 1;
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            Response.Redirect("doacao.aspx");
        }
    }

    protected void gridItens_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridItens.PageIndex = e.NewPageIndex;
        atualizarItens(Convert.ToInt32(Session["id"]));
    }
}
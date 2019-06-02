using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("login.aspx");
        }
        else if (Convert.ToInt32(Session["doar"]) == 1)
        {
            Response.Redirect("doacao.aspx");
        }
        else
        {
            if(Convert.ToInt32(Session["ativado"]) == 1)
            {
                panAtivo.Visible = true;
                Session.Remove("ativado");
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
                String pegarDados = "select count(fk_IdItemDetalhe) as Quantidade from tblDetalheDoacao " +
                    "where fk_IdDoacao in (Select IdDoacao from tblDoacao " +
                    "where fk_IdDoador = @IdDoador and Pendente = 0)";
                conexao.command.Parameters.Add("@IdDoador", SqlDbType.Int).Value = Session["IdDoador"];
                conexao.command.CommandText = pegarDados;
                adapter.SelectCommand = conexao.command;
                adapter.Fill(dt);
                lblObjetos.Text = dt.Tables[0].DefaultView[0].Row["Quantidade"].ToString();
                dt.Reset();

                //pegando a quantidade de itens
                String pegarDoacao = "select count(idDoacao) as Doacao from tblDoacao " +
                    "where fk_IdDoador = @IdDoador1 and Pendente = 0 ";
                conexao.command.Parameters.Add("@IdDoador1", SqlDbType.Int).Value = Session["IdDoador"];
                conexao.command.CommandText = pegarDoacao;
                adapter.SelectCommand = conexao.command;
                adapter.Fill(dt);
                lblDoados.Text = dt.Tables[0].DefaultView[0].Row["Doacao"].ToString();
                dt.Reset();

                conexao.fechaConexao();
            }
            catch (Exception)
            {
                lblDoados.Text = "---";
                lblObjetos.Text = "---";
            }
            atualizarlista();
        }

    }

    public void atualizarlista()
    {
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
            String pegarHistorico = "SELECT DISTINCT IdDoacao as 'Identificação', DataRegistro  as 'Data de registro', tblInstituicao.NomeFantasia as 'Instituição' FROM tblDoacao " +
                "LEFT JOIN tblDoador ON tblDoacao.fk_IdDoador = tblDoador.IdDoador " +
                "LEFT JOIN tblDetalheDoacao ON tblDoacao.IdDoacao = tblDetalheDoacao.fk_IdDoacao " +
                "LEFT JOIN tblItemDetalhe ON tblDetalheDoacao.fk_IdItemDetalhe = tblItemDetalhe.IdItemDetalhe " +
                "LEFT JOIN tblInstituicao " +
                "ON tblItemDetalhe.fk_CNPJ = tblInstituicao.CNPJ " +
                "WHERE tblDoacao.Pendente = 1 AND tblDoador.IdDoador LIKE @idDoador AND tblDoacao.Cancelada = 0";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@idDoador", SqlDbType.Int).Value = Session["IdDoador"];
            conexao.command.CommandText = pegarHistorico;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);
            conexao.fechaConexao();

            if (dt.Tables[0].DefaultView.Count == 0)
            {
                panEr.Visible = true;
                panHist.Visible = false;
                lblMsgEr.Text = "Não encontramos nenhuma doação em andamento :(";
                sucesso.InnerText = ".divgrids {overflow: auto;}";
            }
            else
            {
                panEr.Visible = false;
                panHist.Visible = true;
                sucesso.InnerText = "@media (max-width: 890px ) {.divgrids {overflow: scroll;}}";
                //mandando para o grid
                gridHome.DataSource = dt;
                gridHome.DataBind();
            }

        }
        catch (Exception)
        {
            panEr.Visible = true;
            lblMsgEr.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            panHist.Visible = false;
        }
    }

    protected void gridHome_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cancelar")
        {
            int id = Convert.ToInt32(gridHome.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text);
            lblInstituicao1.Text = gridHome.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text;
            lblRegistro1.Text = gridHome.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].Text;
            Session.Remove("id");
            Session["id"] = id;
            popCancelar.Show();
            cancelar(id);
        }
        else if (e.CommandName == "ver")
        {
            int id = Convert.ToInt32(gridHome.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text);
            lblInstituicao.Text = gridHome.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text;
            lblRegistro.Text = gridHome.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].Text;
            Modal.Show();
            Session.Remove("id");
            Session["id"] = id;
            atualizarItens(id);
            cancelar(id);
        }
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
            conexao.command.Parameters.Add("@idDoacao", SqlDbType.Int).Value = id;
            conexao.command.CommandText = pegarItens;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);

            conexao.fechaConexao();

            //mandando para o gridview de itens
            gridItens.DataSource = dt.Tables[0];
            gridItens.DataBind();
        }
        catch (Exception)
        {
            panEr.Visible = true;
            lblMsgEr.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            panHist.Visible = false;
        }
    }

    public void cancelar(int id)
    {
        Conexao conexao = new Conexao();
        try
        {
            //conectar no banco
            conexao.conectar();
        }
        catch (SqlException)
        {
            lblData1.Text = "---";
            lblData2.Text = "---";
            lblData3.Text = "---";
            lblData4.Text = "---";
            lblInstituicao1.Text = "---";
            lblRegistro1.Text = "---";
            lblInstituicao.Text = "---";
            lblRegistro.Text = "---";
            panEr.Visible = true;
            panHist.Visible = false;
        }
        try
        {
            //Comandos sql para pegar itens
            SqlDataAdapter adapter = new SqlDataAdapter();

            //Comandos sql para pegar datas
            DataSet dt1 = new DataSet();
            String pegarDatas = "SELECT DataEntrega, DataRetirada from tblDoacao " +
                "where IdDoacao = @idDoacao1 ";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@idDoacao1", SqlDbType.Int).Value = id;
            conexao.command.CommandText = pegarDatas;
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt1);

            conexao.fechaConexao();

            //mandando para as lbls de datas
            if (dt1.Tables[0].DefaultView[0].Row["DataEntrega"].ToString().Equals(""))
            {
                lblData2.Text = dt1.Tables[0].DefaultView[0].Row["DataRetirada"].ToString();
                lblData4.Text = dt1.Tables[0].DefaultView[0].Row["DataRetirada"].ToString();
                lblData1.Text = "Data de Retirada:";
                lblData3.Text = "Data de Retirada:";
            }
            else
            {
                lblData2.Text = dt1.Tables[0].DefaultView[0].Row["DataEntrega"].ToString();
                lblData4.Text = dt1.Tables[0].DefaultView[0].Row["DataEntrega"].ToString();
                lblData1.Text = "Data de Entrega:";
                lblData3.Text = "Data de Entrega:";
            }

        }
        catch (Exception)
        {
            lblData1.Text = "---";
            lblData2.Text = "---";
            lblData3.Text = "---";
            lblData4.Text = "---";
            lblInstituicao1.Text = "---";
            lblRegistro1.Text = "---";
            lblInstituicao.Text = "---";
            lblRegistro.Text = "---";
            panEr.Visible = true;
            panHist.Visible = false;
        }
    }
    protected void gridHome_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridHome.PageIndex = e.NewPageIndex;
        atualizarlista();
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
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
            conexao.command.CommandText = "update tblDoacao set Cancelada = 1, Pendente = 0" +
                "where IdDoacao = @id";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@id", SqlDbType.Int).Value = Session["id"];
            conexao.command.ExecuteNonQuery();

            conexao.fechaConexao();
            atualizarlista();

            panSucesso.Visible = true;
        }
        catch (Exception)
        {
            panEr.Visible = true;
            lblMsgEr.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            panHist.Visible = false;
        }
    }

    protected void gridItens_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridItens.PageIndex = e.NewPageIndex;
        atualizarItens(Convert.ToInt32(Session["id"]));
    }
}
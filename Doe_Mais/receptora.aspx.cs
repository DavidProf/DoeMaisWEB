using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;

public partial class receptora : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 0)
        {
            linkBanner.HRef = "doacao.aspx";
            linkBanner2.HRef = "receptora.aspx";
        }
    }

    String parametro = "";
    String pegarInstituicao = "";

    void buscar(ref String parametro, ref String pegarInstituicao)
    {
        if (parametro == "")
        {
            lblErFiltro.Text = "Escolha e preencha um filtro";
            return;
        }
        else
        {
            Conexao conexao = new Conexao();

            try
            {
                //conectar no banco
                conexao.conectar();
            }
            catch (Exception)
            {
                lblErFiltro.Text = "Tivemos um erro com o nosso banco de dados :(";
                return;
            }
            try
            {
                //Comandos sql
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet dt = new DataSet();
                conexao.command.Parameters.Clear(); // limpar parâmetros
                conexao.command.Parameters.Add("@parametro", SqlDbType.VarChar).Value = parametro;
                conexao.command.CommandText = pegarInstituicao;

                //Executando os comandos
                adapter.SelectCommand = conexao.command;
                adapter.Fill(dt);
                conexao.fechaConexao();

                //checando se retornou algo
                int x = dt.Tables[0].Rows.Count;
                if (x == 0)
                {
                    lblErFiltro.Text = "Não encontramos instituições cadastradas para este parâmetro :(";
                    panInsti.Visible = false;
                    Popup.Visible = false;
                    return;
                }
                else
                {
                    lblErFiltro.Text = "";
                    panInsti.Visible = true;
                    Popup.Visible = true;

                    //enviando para o repeater
                    gridRecep.DataSource = dt;
                    gridRecep.DataBind();
                }

            }
            catch (Exception)
            {
                lblErFiltro.Text = "Tivemos um erro, tente novamente";
                return;
            }
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        String comando = " SELECT " +
                " tblInstituicao.CNPJ, " +
                " tblInstituicao.NomeFantasia, " +
                " tblInstituicao.Cidade, " +
                " tblInstituicao.Uf " +
                " from tblInstituicao ";

        //mandar paramêtros com códigos do sql para o método buscar
        if (txtInstituicao.Text.Length >= 2)
        {
            parametro = "%" + txtInstituicao.Text + "%";
            comando = comando + " where NomeFantasia like @parametro and Ativo = 1";
            buscar(ref parametro, ref comando);
        }
        else if (dropEstado2.SelectedValue != "Selecione" && dropCidade2.SelectedValue != "Selecione")
        {
            parametro = "%" + dropCidade2.SelectedValue + "%";
            comando = comando + " where Cidade like @parametro and Ativo =1 ";
            buscar(ref parametro, ref comando);
        }
        else if (dropLetra.SelectedValue != "Selecione")
        {
            parametro = dropLetra.SelectedValue + "%";
            comando = comando + " where NomeFantasia like @parametro and Ativo =1";
            buscar(ref parametro, ref comando);
        }
        else
        {
            parametro = "";
            comando = "";
            buscar(ref parametro, ref comando);
        }
    }

    protected void tudo_Click(object sender, ImageClickEventArgs e)
    {
        parametro = "1";
        pegarInstituicao = "select CNPJ, NomeFantasia, Uf, Cidade, Email, ResumoEmpresa, TelefoneA, TelefoneB, Logradouro, Numero, Complemento, Cep, DiasAbertos from tblInstituicao " +
                                 "where Ativo = @parametro";
        buscar(ref parametro, ref pegarInstituicao);
    }

    protected void dropEstado2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dropEstado2.Text != "Selecione")
        {
            String Uf = dropEstado2.SelectedValue;
            Conexao conexao = new Conexao();

            try
            {
                //conectar no banco
                conexao.conectar();
            }
            catch (SqlException)
            {
                lblErFiltro.Text = "Erro ao conectar com o Banco de Dados, tente novamente mais tarde.";
                return;
            }
            try
            {
                //Comandos sql
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet dt = new DataSet();
                conexao.command.Parameters.Clear(); // limpar parâmetros
                String pegarCidade = "select Distinct Cidade from tblInstituicao " +
                    "where Uf = @Uf and Uf in " +
                    "(Select Uf tblInstituicao " +
                    "where Ativo = 1)";
                conexao.command.Parameters.Add("@Uf", SqlDbType.VarChar).Value = Uf;
                conexao.command.CommandText = pegarCidade;

                //Executando os comandos
                adapter.SelectCommand = conexao.command;
                adapter.Fill(dt);
                conexao.fechaConexao();

                //verificando se retornou algo
                int x = dt.Tables[0].Rows.Count;
                if (x == 0)
                {
                    lblErFiltro.Text = "Não temos institiuções cadastradas nesse estado :(";
                    dropCidade2.Items.Clear();
                    dropCidade2.Enabled = false;
                }
                else
                {
                    dropCidade2.Items.Clear();
                    dropCidade2.DataSource = dt.Tables[0];
                    dropCidade2.DataTextField = "Cidade";
                    dropCidade2.DataValueField = "Cidade";
                    dropCidade2.DataBind();
                    dropCidade2.Items.Insert(0, new ListItem("Selecione", "Selecione"));
                    lblErFiltro.Text = "";
                    dropCidade2.Enabled = true;
                }
            }
            catch (Exception)
            {
                lblErFiltro.Text = "Tivemos um erro, tente novamente";
            }
        }
    }

    protected void gridRecep_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ModalPopupExtender1.Show();
        String id = gridRecep.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[0].ToString();

        Conexao conexao = new Conexao();
        try
        {

            //conectar no banco
            conexao.conectar();
        }
        catch (SqlException)
        {
            lblErFiltro.Text = "Erro ao conectar com o Banco de Dados, tente novamente mais tarde.";
            return;
        }
        try
        {
            //Comandos sql
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();
            DataSet dt1 = new DataSet();
            conexao.command.Parameters.Clear(); // limpar parâmetros
            //pegando dados da instituição
            String instituicao = " SELECT " +
                " tblInstituicao.CNPJ, " +
                " tblInstituicao.NomeFantasia, " +
                " tblInstituicao.Logradouro, " +
                " tblInstituicao.Numero, " +
                " tblInstituicao.Complemento, " +
                " tblInstituicao.CEP, " +
                " tblInstituicao.Cidade, " +
                " tblInstituicao.Uf, " +
                " tblInstituicao.Email, " +
                " tblInstituicao.TelefoneA, " +
                " tblInstituicao.TelefoneB, " +
                " tblInstituicao.DiasAbertos, " +
                " tblInstituicao.ResumoEmpresa " +
                " from tblInstituicao where CNPJ like @id";
            conexao.command.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
            conexao.command.CommandText = instituicao;

            //Executando os comandos
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);

            //pegando notas
            String notas = "SELECT Avg(AtendimentoFuncionario) as AtendimentoFuncionario," +
                " Avg(Agilidade) as Agilidade," +
                " Avg(Confianca) as Confianca," +
                " Avg(Transparencia) as Transparencia," +
                " Avg(Cuidado) as Cuidado FROM tblDepoimento " +
                " where fk_IdDoacao in " +
                " (Select distinct IdDoacao from tblDoacao " +
                " INNER JOIN tblDetalheDoacao ON tblDoacao.IdDoacao = tblDetalheDoacao.fk_IdDoacao " +
                " INNER JOIN tblItemDetalhe ON tblDetalheDoacao.fk_IdItemDetalhe = tblItemDetalhe.IdItemDetalhe " +
                " INNER JOIN tblInstituicao ON tblItemDetalhe.fk_CNPJ like @id2 )";
            conexao.command.Parameters.Add("@id2", SqlDbType.VarChar).Value = id;
            conexao.command.CommandText = notas;

            //Executando os comandos
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt1);
            conexao.fechaConexao();

            //mandando para as labels
            lblInstituicao.Text = dt.Tables[0].DefaultView[0].Row["NomeFantasia"].ToString();
            lblCep.Text = dt.Tables[0].DefaultView[0].Row["CEP"].ToString();
            lblCidade.Text = dt.Tables[0].DefaultView[0].Row["Cidade"].ToString();
            lblEstado.Text = dt.Tables[0].DefaultView[0].Row["Uf"].ToString();
            lblEmail.Text = dt.Tables[0].DefaultView[0].Row["Email"].ToString();
            lblFones.Text = dt.Tables[0].DefaultView[0].Row["TelefoneA"].ToString() + " / " + dt.Tables[0].DefaultView[0].Row["TelefoneB"].ToString();
            lblAbertos.Text = dt.Tables[0].DefaultView[0].Row["DiasAbertos"].ToString();
            lblResumo.Text = dt.Tables[0].DefaultView[0].Row["ResumoEmpresa"].ToString();

            if (dt.Tables[0].DefaultView[0].Row["Complemento"].ToString().Equals(""))
            {
                lblEndereco.Text = dt.Tables[0].DefaultView[0].Row["Logradouro"].ToString() + " N°: " + dt.Tables[0].DefaultView[0].Row["Numero"].ToString();
            }
            else
            {
                lblEndereco.Text = dt.Tables[0].DefaultView[0].Row["Logradouro"].ToString() + " N°: " + dt.Tables[0].DefaultView[0].Row["Numero"].ToString() + " Complemento: " + dt.Tables[0].DefaultView[0].Row["Complemento"].ToString();
            }

            //notas
            if (dt1.Tables[0].DefaultView[0].Row["AtendimentoFuncionario"].ToString().Equals(""))
            {
                lblAtend.Text = "---";
            }
            else
            {
                lblAtend.Text = dt1.Tables[0].DefaultView[0].Row["AtendimentoFuncionario"].ToString();
            }
            if (dt1.Tables[0].DefaultView[0].Row["Agilidade"].ToString().Equals(""))
            {
                lblAgilidade.Text = "---";
            }
            else
            {
                lblAgilidade.Text = dt1.Tables[0].DefaultView[0].Row["Agilidade"].ToString();
            }
            if (dt1.Tables[0].DefaultView[0].Row["Confianca"].ToString().Equals(""))
            {
                lblConfianca.Text = "---";
            }
            else
            {
                lblConfianca.Text = dt1.Tables[0].DefaultView[0].Row["Confianca"].ToString();
            }
            if (dt1.Tables[0].DefaultView[0].Row["Transparencia"].ToString().Equals(""))
            {
                lblTrans.Text = "---";
            }
            else
            {
                lblTrans.Text = dt1.Tables[0].DefaultView[0].Row["Transparencia"].ToString();
            }
            if (dt1.Tables[0].DefaultView[0].Row["Cuidado"].ToString().Equals(""))
            {
                lblCuidado.Text = "---";
            }
            else
            {
                lblCuidado.Text = dt1.Tables[0].DefaultView[0].Row["Cuidado"].ToString();
            }
        }
        catch (Exception)
        {
            lblErFiltro.Text = "Tivemos um erro, tente novamente";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;

public partial class doacao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("login.aspx");
            Response.End();
        }
        else if (Convert.ToInt32(Session["doar"]) == 1)
        {
            /*---------------------caso o doador veio por meio de propaganda-------------------------*/
            Session.Remove("doar");
            Session["doar2"] = 1;
            //instituicao
            Conexao conexao = new Conexao();
            try
            {
                //Conectar ao banco
                conexao.conectar();
            }
            catch (Exception)
            {
                lblErInstituicao.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
                return;
            }
            try
            {
                //Comandos sql
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet dt = new DataSet();
                String pegarinstituicao = "select NomeFantasia, CNPJ, RetiraDoacao from tblInstituicao where NomeFantasia = @instituicao2";
                conexao.command.Parameters.Clear();
                conexao.command.Parameters.Add("@instituicao2", SqlDbType.VarChar).Value = Session["instituicao2"].ToString();
                conexao.command.CommandText = pegarinstituicao;

                //executar comando no banco 
                adapter.SelectCommand = conexao.command;
                //pegando dados
                adapter.Fill(dt);
                conexao.fechaConexao();

                lblErInstituicao.Text = "";

                //mandando pro dop
                lstInstituicao.DataSource = dt.Tables[0];
                lstInstituicao.DataTextField = "NomeFantasia";
                lstInstituicao.DataValueField = "CNPJ";
                lstInstituicao.DataBind();

                //puxando os itens da instituicao
                Itens();

                //deixando invisivel os paineis
                panInstituicao.Visible = false;
                panEstado.Visible = false;
                panCidade.Visible = false;
                four.Visible = false;
                panParte2.Visible = false;
            }
            catch (Exception)
            {
                lblErInstituicao.Text = "Tivemos um erro no servidor, tente novamente mais tarde";
            }
        }
        else
        {
            panCidade.Visible = false;
            panInstituicao.Visible = false;
            panItens.Visible = false;
            panAgendar.Visible = false;
            panParte2.Visible = false;
        }

        dataRetira.StartDate = DateTime.Now.Date;
    }

    protected void lstUf_SelectedIndexChanged(object sender, EventArgs e)
    {
        dropCidade();
    }

    protected void lstCidade_SelectedIndexChanged(object sender, EventArgs e)
    {
        dropInstituicao();
    }

    protected void lstInstituicao_SelectedIndexChanged(object sender, EventArgs e)
    {
        Itens();
    }

    public void dropCidade()
    {   //popular o drop de cidade
        String Uf = lstUf.SelectedValue;
        Conexao conexao = new Conexao();

        try
        {
            //conectar no banco
            conexao.conectar();
        }
        catch (SqlException)
        {
            lblErCidade.Text = "Tivemos um erro em nosso servidor, tente novamente mais tarde";
            return;
        }
        try
        {
            //Comandos sql
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();
            String pegarCidade = "select Distinct Cidade from tblInstituicao where Uf = @Uf ";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@Uf", SqlDbType.VarChar).Value = Uf;
            conexao.command.CommandText = pegarCidade;
            //Executando os comandos
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);
            conexao.fechaConexao();

            //pegando dados
            int x = dt.Tables[0].Rows.Count;
            if (x == 0)
            {
                lblErCidade.Text = "Não temos institiuções cadastradas nesse estado :(";
                panCidade.Visible = false;
                panInstituicao.Visible = false;
                panItens.Visible = false;
                return;
            }
            else
            {
                lblErCidade.Text = "";
                panCidade.Visible = true;
                lstCidade.DataSource = dt.Tables[0];
                lstCidade.DataTextField = "Cidade";
                lstCidade.DataValueField = "Cidade";
                lstCidade.DataBind();
            }
        }
        catch (Exception)
        {
            lblErCidade.Text = "Tivemos um erro no servidor, tente novamente mais tarde";
            return;
        }
        ListItem item = new ListItem("-Selecione-", "Values", true);
        item.Selected = true;
        this.lstCidade.Items.Add(item);
    }

    public void dropInstituicao()
    {   //Popular o gridview e drop da instituição

        String instituicao = lstCidade.SelectedValue;
        Conexao conexao = new Conexao();

        try
        {
            //Conectar ao banco
            conexao.conectar();
        }
        catch (Exception)
        {
            lblErCidade.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            return;
        }
        try
        {
            //Comandos sql
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();
            String pegarcidade = "select NomeFantasia,CNPJ,Cep,Logradouro,Bairro, Numero, RetiraDoacao from tblInstituicao where Cidade = @instituicao";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@instituicao", SqlDbType.VarChar).Value = instituicao;
            conexao.command.CommandText = pegarcidade;

            //executar comando no banco 
            adapter.SelectCommand = conexao.command;
            //pegando dados
            adapter.Fill(dt);
            conexao.fechaConexao();

            //retornou algo?
            int x = dt.Tables[0].Rows.Count;
            if (x == 0)
            {
                lblErInstituicao.Text = "Não temos institiuções cadastradas nessa Cidade :(";
                panInstituicao.Visible = false;
                panItens.Visible = false;
                panDomicilio.Visible = false;
                return;
            }
            else
            {
                lblErInstituicao.Text = "";
                panInstituicao.Visible = true;
                panCidade.Visible = true;
                txtdata.Text = "";
                horaAgenda.Enabled = false;

                repInstituicao.DataSource = dt;
                repInstituicao.DataBind();

                //mandando pro dop
                lstInstituicao.DataSource = dt.Tables[0];
                lstInstituicao.DataTextField = "NomeFantasia";
                lstInstituicao.DataValueField = "CNPJ";
                lstInstituicao.DataBind();
            }
        }
        catch (Exception)
        {
            panItens.Visible = false;
            panInstituicao.Visible = false;
            panCidade.Visible = false;
            lblErCidade.Text = "Tivemos um erro no servidor, tente novamente mais tarde";
        }

        ListItem item = new ListItem("-Selecione-", "Values", true);
        item.Selected = true;
        this.lstInstituicao.Items.Add(item);
    }

    public void Itens()
    {
        Session["instituicao"] = lstInstituicao.SelectedValue;

        Conexao conexao = new Conexao();
        try
        {
            //tentando conectar
            conexao.conectar();
        }
        catch (Exception)
        {
            panItens.Visible = false;
            panInstituicao.Visible = false;
            panCidade.Visible = false;
            lblErCidade.Text = "Tivemos um erro no servidor, tente novamente mais tarde";
            return;
        }

        try
        {
            //comandos sql
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlDataAdapter adapter1 = new SqlDataAdapter();
            DataTable dt = new DataTable();
            DataSet domi = new DataSet();
            String pegaritens =
            "select tblItemPreCadastro.ItemNome, tblItemPreCadastro.ItemTipo,tblItemPreCadastro.IdItemPreCadastro, tblItemPreCadastro.IdItemPreCadastro from tblItemInstituicao inner join tblItemPreCadastro " +
            "on tblItemInstituicao.fk_IdItemPreCadastro = tblItemPreCadastro.IdItemPreCadastro where fk_CNPJ =@instituicao";
            String domicilio = "select RetiraDoacao from tblInstituicao where CNPJ = @instituicao";
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@instituicao", SqlDbType.VarChar).Value = Session["instituicao"].ToString();
            conexao.command.CommandText = pegaritens;

            //pegando dados para o repeater
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            ///pegando dados para o panDomicilio
            conexao.command.CommandText = domicilio;
            adapter1.SelectCommand = conexao.command;
            adapter1.Fill(domi);

            //fechando conexao
            conexao.fechaConexao();

            //vendo se a instituição retira em domicilio
            Session["retiraDomicilio"] = Convert.ToInt32(domi.Tables[0].DefaultView[0].Row["RetiraDoacao"]);

            if (Convert.ToInt32(Session["retiraDomicilio"]) == 1)
            {
                panAgendar.Visible = true;
                panDomicilio.Visible = true;
                panItens.Visible = true;
                panCidade.Visible = true;
                panInstituicao.Visible = true;
                lblAgenda.Text = "";
            }
            else
            {
                panCidade.Visible = true;
                panInstituicao.Visible = true;
                panDomicilio.Visible = false;
                panAgendar.Visible = true;
                panItens.Visible = true;
                lblAgenda.Text = "Esta instituição não retira em domicílio,escolha abaixo a data para comparecer à instituição.";
            }
        }
        catch (Exception)
        {
            panItens.Visible = false;
            panInstituicao.Visible = false;
            panCidade.Visible = false;
            lblErCidade.Text = "Tivemos um erro no servidor, tente novamente mais tarde";
        }
    }

    protected void btnNova_Click(object sender, EventArgs e)
    {
        Response.Redirect("doacao.aspx");
    }

    protected void txtdata_TextChanged(object sender, EventArgs e)
    {
        //deixando todos os pans habilitados
        if (Convert.ToInt32(Session["doar2"]) == 1)
        {
            panEstado.Visible = false;
            panCidade.Visible = false;
            panInstituicao.Visible = false;
            panItens.Visible = true;
            panAgendar.Visible = true;
            panParte2.Visible = false;
        }
        else
        {
            panEstado.Visible = true;
            panCidade.Visible = true;
            panInstituicao.Visible = true;
            panItens.Visible = true;
            panAgendar.Visible = true;
            panParte2.Visible = false;
        }

        if (Convert.ToInt32(Session["retiraDomicilio"]) == 1)
        {
            panDomicilio.Visible = true;
        }
        else
        {
            panDomicilio.Visible = false;
            lblAgenda.Text = "Esta instituição não retira em domicílio,escolha abaixo a data para comparecer à instituição.";
        }

        //pegando a data
        String data1 = txtdata.Text.Replace("/", "-");
        data1 = data1.Substring(0, 10);
        String retirada = "";

        //pegar os horários agendados
        Conexao conexao = new Conexao();
        try
        {
            //tentando conectar
            conexao.conectar();
        }
        catch (Exception)
        {
            lblErData.Text = "Tivemos um erro no servidor, tente novamente mais tarde";
        }
        try
        {
            if (radSim.Checked == true)
            {
                retirada = "DataRetirada";
            }
            else
            {
                retirada = "DataEntrega";
            }
            //comandos sql
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();
            DataSet dt1 = new DataSet();
            String pegarHoras =
            "SELECT distinct CONVERT(VARCHAR(5)," + retirada + ",114) AS HORA FROM tblDoacao LEFT JOIN tblDetalheDoacao " +
            "ON tblDoacao.IdDoacao = tblDetalheDoacao.fk_IdDoacao " +
            "LEFT JOIN tblItemDetalhe " +
            "ON tblDetalheDoacao.fk_IdItemDetalhe = tblItemDetalhe.IdItemDetalhe " +
            "LEFT JOIN tblInstituicao " +
            "ON tblItemDetalhe.fk_CNPJ = tblInstituicao.CNPJ " +
            "WHERE CONVERT(CHAR(10)," + retirada + ", 105) like '" + data1 + "' and tblInstituicao.CNPJ = @instituicao3";
            conexao.command.Parameters.Clear();

            if (Convert.ToInt32(Session["doar2"]) == 1)
            {
                conexao.command.Parameters.Add("@instituicao3", SqlDbType.VarChar).Value = Session["instituicao2"].ToString();
            }
            else
            {
                conexao.command.Parameters.Add("@instituicao3", SqlDbType.VarChar).Value = Session["instituicao"].ToString();
            }

            conexao.command.CommandText = pegarHoras;
            //pegando dados para o repeater
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);

            //pegando as horas da instituição
            String pegarabertura =
            "select CONVERT(VARCHAR(2),HoraAbre,114) as Abre, CONVERT(VARCHAR(2),HoraFecha,114) as Fecha from tblInstituicao " +
            "where CNPJ = @instituicaoabertura";
            conexao.command.Parameters.Clear();

            if (Convert.ToInt32(Session["doar2"]) == 1)
            {
                conexao.command.Parameters.Add("@instituicaoabertura", SqlDbType.VarChar).Value = Session["instituicaoCnpj"].ToString();
            }
            else
            {
                conexao.command.Parameters.Add("@instituicaoabertura", SqlDbType.VarChar).Value = Session["instituicao"].ToString();
            }
            conexao.command.CommandText = pegarabertura;

            //pegando dados para o repeater
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt1);

            Double abre = Convert.ToDouble(dt1.Tables[0].DefaultView[0].Row["Abre"]);
            Double fecha = Convert.ToDouble(dt1.Tables[0].DefaultView[0].Row["Fecha"]);

            //fechando conexao
            conexao.fechaConexao();

            //Popular DropDownList com as horas
            String h = "";
            List<String> lista = new List<String>();
            DateTime time = DateTime.Today;

            //fzd lista com as hrs
            for (DateTime horas = time.AddHours(abre); horas < time.AddHours(fecha); horas = horas.AddMinutes(15))
            {
                lista.Add(horas.ToShortTimeString());
            }

            //retirando as hrs ja agendadas
            foreach (DataRow row in dt.Tables[0].Rows)
            {
                h = row["HORA"].ToString();
                lista.Remove(h);
            }

            horaAgenda.DataSource = lista;
            horaAgenda.DataBind();
        }
        catch (Exception)
        {
            throw;
            //lblErData.Text = "Tivemos um erro no servidor, tente novamente mais tarde";
        }

        horaAgenda.Enabled = true;
    }

    protected void radSim_CheckedChanged(object sender, EventArgs e)
    {
        rad();
    }

    protected void radNao_CheckedChanged(object sender, EventArgs e)
    {
        rad();
    }

    public void rad()
    {
        if (Convert.ToInt32(Session["doar2"]) == 1)
        {
            panEstado.Visible = false;
            panCidade.Visible = false;
            panInstituicao.Visible = false;
        }
        else
        {
            panEstado.Visible = true;
            panCidade.Visible = true;
            panInstituicao.Visible = true;
        }

        if (Convert.ToInt32(Session["retiraDomicilio"]) == 1)
        {
            panDomicilio.Visible = true;
        }
        else
        {
            panDomicilio.Visible = false;
            lblAgenda.Text = "Esta instituição não retira em domicílio,escolha abaixo a data para comparecer à instituição.";
        }

        panItens.Visible = true;
        panAgendar.Visible = true;
        panParte2.Visible = false;
        txtdata.Text = "";
        lblErData.Text = "";
        horaAgenda.Enabled = false;
    }

    String nomeProduto, codigo = "";
    DataTable tblItens = new DataTable();


    protected void btnProximo_Click(object sender, ImageClickEventArgs e)
    {
        if (Convert.ToInt32(Session["doar2"]) == 1)
        {
            panCidade.Visible = false;
            panInstituicao.Visible = false;
            panEstado.Visible = false;
        }
        else
        {
            panCidade.Visible = true;
            panInstituicao.Visible = true;
            panEstado.Visible = true;
        }
        panItens.Visible = true;
        panDomicilio.Visible = true;
        panAgendar.Visible = true;
        panParte2.Visible = false;

        try
        {

            foreach (RepeaterItem item in Repeater1.Items)
            {
                CheckBox check = (CheckBox)item.FindControl("Check");
                TextBox text = (TextBox)item.FindControl("Quantidade");

                if (check.Checked == false && text.Text.Length >= 1)
                {
                    lblItens.Text = "Selecione os itens desejados";
                    return;
                }
                if (text.Text.Equals("") && check.Checked == true)
                {
                    lblItens.Text = "Verifique as quantidades";
                    return;
                }
            }
            lst();
        }
        catch (Exception)
        {
            lblItens.Text = "Tivemos um erro tente novamente";
            return;
        }
    }

    public void lst()
    {
        tblItens.Columns.Add("Identificação", typeof(String));
        tblItens.Columns.Add("Item", typeof(String));
        tblItens.Columns.Add("Quantidade", typeof(String));

        instituicao.Text = lstInstituicao.SelectedItem.ToString();
        if (radSim.Checked == true)
        {
            retira.Text = "Sim";
        }
        else
        {
            retira.Text = "Não";
        }
        data.Text = txtdata.Text.Substring(0, 10);
        hora.Text = horaAgenda.Text;


        foreach (RepeaterItem itens in Repeater1.Items)
        {
            CheckBox checado = (CheckBox)itens.FindControl("Check");
            TextBox txt = (TextBox)itens.FindControl("Quantidade");

            if (checado.Checked == true && txt.Text.Length >= 1)
            {
                Label lbl = (Label)itens.FindControl("Nome");
                nomeProduto = lbl.Text;
                codigo = checado.Text;

                tblItens.Rows.Add(codigo, nomeProduto, txt.Text);
            }
        }
        gridsLst.DataSource = tblItens;
        gridsLst.DataBind();

        panCidade.Visible = false;
        panInstituicao.Visible = false;
        panItens.Visible = false;
        panDomicilio.Visible = false;
        panAgendar.Visible = false;
        panEstado.Visible = false;
        panParte2.Visible = true;
        lblItens.Text = "";
    }

    protected void lstVoltar_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["doar2"]) == 1)
        {
            panEstado.Visible = false;
            panCidade.Visible = false;
            panInstituicao.Visible = false;
        }
        else
        {
            panEstado.Visible = true;
            panCidade.Visible = true;
            panInstituicao.Visible = true;
        }

        if (Convert.ToInt32(Session["retiraDomicilio"]) == 1)
        {
            panDomicilio.Visible = true;
        }
        else
        {
            panDomicilio.Visible = false;
            lblAgenda.Text = "Esta instituição não retira em domicílio,escolha abaixo a data para comparecer à instituição.";
        }
        panItens.Visible = true;
        panAgendar.Visible = true;
        panParte2.Visible = false;
    }

    protected void lstDoar_Click(object sender, EventArgs e)
    {
        //yyyy-MM-ddTHH:mm:00.9843750-03:00 -> "19/06/2019 10:30"
        String nomeProduto = "";
        String CNPJ = Session["instituicao"].ToString();
        int quantidade = 0;
        String dataAgenda = txtdata.Text.Substring(6, 4) + "-" +
                            txtdata.Text.Substring(3, 2) + "-" + 
                            txtdata.Text.Substring(0, 2) + "T" + 
                            ("b"+horaAgenda.SelectedValue).Replace("b0","0").Replace("b","0")+ ":00.9843750-03:00";
        String sql = "";
        int codigo = 0;
        int idDoador = Convert.ToInt32(Session["IdDoador"]);

        Conexao conexao = new Conexao();

        try
        {
            conexao.conectar();
        }
        catch (Exception)
        {
            lblErCidade.Text = "Tivemos um erro no nosso servidor, tente novamente mais tarde";
            return;
        }
        try
        {
            if (radSim.Checked)
            {
                sql = "INSERT INTO tblDoacao(DataRegistro,DataRetirada,Pendente, fk_IdDoador, Cancelada) values((SELECT GETDATE()),@retirada,1,@iddoador,'0')";
            }
            else
            {
                sql = "INSERT INTO tblDoacao(DataRegistro,DataEntrega,Pendente,fk_IdDoador, Cancelada) values((SELECT GETDATE()),@entrega,1,@iddoador, '0')";
            }
            conexao.command.Parameters.Clear();
            conexao.command.Parameters.Add("@iddoador", SqlDbType.Int).Value = idDoador;
            conexao.command.Parameters.Add("@retirada", SqlDbType.DateTime).Value = Convert.ToDateTime(dataAgenda);
            conexao.command.Parameters.Add("@entrega", SqlDbType.DateTime).Value = Convert.ToDateTime(dataAgenda);
            conexao.command.CommandText = sql;
            conexao.command.ExecuteNonQuery();

        }
        catch (Exception)
        {
            lblErCidade.Text = "Tivemos um erro, tente novamente";
            throw;
        }

        foreach (RepeaterItem item in Repeater1.Items)
        {
            CheckBox check = (CheckBox)item.FindControl("Check");

            if (check.Checked == true)
            {
                TextBox txt = (TextBox)item.FindControl("Quantidade");
                try
                {
                    quantidade = Convert.ToInt32(txt.Text);
                }
                catch (Exception)
                {
                    quantidade = 0;
                }
                Label lbl = (Label)item.FindControl("Nome");
                nomeProduto = lbl.Text;
                codigo = Convert.ToInt32(check.Text);

                try
                {
                    for (int i = 1; i <= quantidade; i++)
                    {
                        sql =
                      "INSERT INTO tblItemDetalhe(fk_CNPJ, fk_IdItemPreCadastro) VALUES(@CNPJ, @codigo) " +
                      "INSERT INTO tblDetalheDoacao(fk_IdDoacao, fk_IdItemDetalhe, Pendente) VALUES((SELECT MAX(IdDoacao) " +
                      "FROM tblDoacao),(SELECT MAX(IdItemDetalhe) FROM tblItemDetalhe),1)";
                        conexao.command.Parameters.Clear();
                        conexao.command.Parameters.Add("@codigo", SqlDbType.VarChar).Value = codigo;
                        conexao.command.Parameters.Add("@CNPJ", SqlDbType.VarChar).Value = CNPJ;
                        conexao.command.CommandText = sql;
                        conexao.command.ExecuteNonQuery();
                    }
                }
                catch (Exception)
                {
                    lblErCidade.Text = "Erro ao doar, tente novamente :(";
                }
            }
        }
        conexao.fechaConexao();
        panObg.Visible = true;
        Session.Remove("doar2");
        Session.Remove("estado");
        Session.Remove("cidade");
        Session.Remove("instituicao2");
        Session.Remove("instituicao");
        panEstado.Visible = false;
    }

    protected void gridsLst_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridsLst.PageIndex = e.NewPageIndex;
        lst();
    }
}

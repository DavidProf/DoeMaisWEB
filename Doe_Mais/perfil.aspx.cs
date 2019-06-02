using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;

public partial class perfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("login.aspx");
            Response.End();
        }

        if (!IsPostBack)
        {
            atualizar();
        }
    }

    void atualizar()
    {
        Conexao conexao = new Conexao();

        try
        {
            //conectar no banco
            conexao.conectar();
        }
        catch (Exception)
        {
            lblErPerfil.Text = "Tivemos um erro em nosso servidor, tente novamente";
            return;
        }
        try
        {
            String login = Session["CPF_CNPJ"].ToString();
            //Comandos sql
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet dt = new DataSet();
            String pegarDados = "select * from tblDoador where CPF_CNPJ = @CPF_CNPJ";

            conexao.command.Parameters.Add("@CPF_CNPJ", SqlDbType.VarChar).Value = login;
            conexao.command.CommandText = pegarDados;
            //Executando os comandos
            adapter.SelectCommand = conexao.command;
            adapter.Fill(dt);
            conexao.fechaConexao();

            //pegando dados
            if (login.Length <= 14)
            {
                lblCpfCnpj.Text = "CPF:";
                panRazao.Visible = false;
                txtNome.Text = dt.Tables[0].DefaultView[0].Row["Nome"].ToString();
                txtSobrenome.Text = dt.Tables[0].DefaultView[0].Row["Sobrenome"].ToString();
                txtCpfCnpj.Text = dt.Tables[0].DefaultView[0].Row["CPF_CNPJ"].ToString();

                String sexo = dt.Tables[0].DefaultView[0].Row["Sexo"].ToString();
                if (sexo.Equals("M"))
                {
                    txtSexo.Text = "Masculino";
                }
                else
                {
                    txtSexo.Text = "Feminino";
                }
            }
            else
            {
                lblCpfCnpj.Text = "CNPJ:";
                panDados.Visible = true;
                dadosPF.Visible = false;

                txtCpfCnpj.Text = dt.Tables[0].DefaultView[0].Row["CPF_CNPJ"].ToString();
                txtRazao.Text = dt.Tables[0].DefaultView[0].Row["RazaoSocial"].ToString();
            }

            txtCep.Text = dt.Tables[0].DefaultView[0].Row["CEP"].ToString();
            txtLogradouro.Text = dt.Tables[0].DefaultView[0].Row["Logradouro"].ToString();
            txtBairro.Text = dt.Tables[0].DefaultView[0].Row["Bairro"].ToString();
            txtCidade.Text = dt.Tables[0].DefaultView[0].Row["Cidade"].ToString();
            txtUf.Text = dt.Tables[0].DefaultView[0].Row["Uf"].ToString();
            txtNumero.Text = dt.Tables[0].DefaultView[0].Row["Numero"].ToString();
            txtComplemento.Text = dt.Tables[0].DefaultView[0].Row["Complemento"].ToString();
            txtTelUm.Text = dt.Tables[0].DefaultView[0].Row["TelefoneA"].ToString();
            txtTelDois.Text = dt.Tables[0].DefaultView[0].Row["TelefoneB"].ToString();
            txtEmailA.Text = dt.Tables[0].DefaultView[0].Row["Email"].ToString();
            txtEmail.Text = dt.Tables[0].DefaultView[0].Row["Email"].ToString();
        }
        catch (Exception)
        {
            lblErPerfil.Text = "Tivemos um erro, tente novamente";
            return;
        }
    }

    protected void btnEnviarCadastro_Click(object sender, EventArgs e)
    {
        String cep = txtCep.Text;
        String logra = txtLogradouro.Text;
        String bairro = txtBairro.Text;
        String cidade = txtCidade.Text;
        String uf = txtUf.Text;
        String numero = txtNumero.Text;
        String comple = txtComplemento.Text;
        String tel1 = txtTelUm.Text;
        String tel2 = txtTelDois.Text;
        String email = txtEmail.Text;
        String senha2 = txtSenha1.Text;
        String cpfcnpj = txtCpfCnpj.Text;
        String resposta = txtResposta.Text;
        String pergunta = Pergunta.Text;

        try
        {
            Conexao conexao = new Conexao();
            try
            {
                conexao.conectar();

            }
            catch (Exception)
            {
                lblErPerfil.Text = "Tivemos um erro em nosso servidor, tente novamente";
                return;
            }

            String sql = "";

            if (txtEmail.Text.Equals(txtEmailA.Text))
            {
                sql = "UPDATE tblDoador SET " +
            " TelefoneA=@tel1, TelefoneB=@tel2, Logradouro=@logra, Numero=@numero, Complemento=@comple, CEP=@cep, Uf=@uf, Cidade=@cidade, Bairro=@bairro" +
            " WHERE CPF_CNPJ = @cpfcnpj ";
            }
            else
            {
                sql =
            "IF EXISTS(SELECT Email FROM tblDoador WHERE Email LIKE @email) BEGIN SELECT 'Email já cadastrado' END " +
            "ELSE BEGIN UPDATE tblDoador SET Email=@email, TelefoneA=@tel1, TelefoneB=@tel2, Logradouro=" +
            "@logra, Numero=@numero, Complemento=@comple, CEP=@cep, Uf=@uf, Cidade=@cidade, Bairro=@bairro" +
            " WHERE CPF_CNPJ = @cpfcnpj END";
                conexao.command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            }

            conexao.command.CommandText = sql;

            conexao.command.Parameters.Add("@senha", SqlDbType.VarChar).Value = senha2;
            conexao.command.Parameters.Add("@tel1", SqlDbType.VarChar).Value = tel1;
            conexao.command.Parameters.Add("@tel2", SqlDbType.VarChar).Value = tel2;
            conexao.command.Parameters.Add("@logra", SqlDbType.VarChar).Value = logra;
            conexao.command.Parameters.Add("@numero", SqlDbType.VarChar).Value = numero;
            conexao.command.Parameters.Add("@comple", SqlDbType.VarChar).Value = comple;
            conexao.command.Parameters.Add("@cep", SqlDbType.Char).Value = cep;
            conexao.command.Parameters.Add("@uf", SqlDbType.Char).Value = uf;
            conexao.command.Parameters.Add("@cidade", SqlDbType.VarChar).Value = cidade;
            conexao.command.Parameters.Add("@bairro", SqlDbType.VarChar).Value = bairro;
            conexao.command.Parameters.Add("@cpfcnpj", SqlDbType.VarChar).Value = cpfcnpj;

            conexao.dr = conexao.command.ExecuteReader();
            if (conexao.dr.HasRows)
            {
                while (conexao.dr.Read())
                {
                    lblErPerfil.Text = conexao.dr[0].ToString();
                }
            }
            else
            {
                lblErPerfil.Text = "Seus dados foram atualizados :D";
                atualizar();
            }
            conexao.fechaConexao();

        }
        catch (Exception)
        {
            lblErPerfil.Text = "Tivemos um erro ao atualizar os dados, tente novamente mais tarde";
        }
    }

    protected void btnConfirmar_Click(object sender, EventArgs e)
    {
        String sql;
        String usuario = Session["CPF_CNPJ"].ToString();
        Conexao conexao = new Conexao();

        try
        {
            conexao.conectar();
        }
        catch (SqlException ex)
        {
            lblErPerfil.Text = "Tivemos um erro em nosso servidor, Tente Novamente";

        }

        try
        {
            sql = "UPDATE tblDoador SET Ativo = 0 WHERE CPF_CNPJ = @usuario";
            conexao.command.CommandText = sql;
            conexao.command.Parameters.Add("@usuario", SqlDbType.VarChar).Value = usuario;
            conexao.command.ExecuteNonQuery();
            conexao.fechaConexao();

            Session.Abandon();
            Response.Redirect("index.aspx");
        }
        catch (Exception)
        {
            lblErPerfil.Text = "Tivemos um erro ao atualizar os dados, tente novamente mais tarde";
        }
    }

    protected void enviarSenha_Click(object sender, EventArgs e)
    {
        String cpfcnpj = txtCpfCnpj.Text;
        String senha2 = txtSenha1.Text;

        try
        {
            Conexao conexao = new Conexao();
            try
            {
                conexao.conectar();

            }
            catch (Exception)
            {
                lblErPerfil.Text = "Tivemos um erro em nosso servidor, tente novamente";
                return;
            }

            String sql = "UPDATE tblDoador SET Senha=@senha  " +
                "WHERE CPF_CNPJ = @cpfcnpj ";

            conexao.command.CommandText = sql;

            conexao.command.Parameters.Add("@senha", SqlDbType.VarChar).Value = senha2;
            conexao.command.Parameters.Add("@cpfcnpj", SqlDbType.VarChar).Value = cpfcnpj;
            conexao.command.ExecuteNonQuery();
            conexao.fechaConexao();
            lblErPerfil.Text = "Seus dados foram atualizados :D";
        }
        catch (Exception)
        {
            lblErPerfil.Text = "Tivemos um erro ao atualizar os dados, tente novamente mais tarde";
        }
    }

    protected void enviarPergunta_Click(object sender, EventArgs e)
    {
        String cpfcnpj = txtCpfCnpj.Text;
        String resposta = txtResposta.Text;
        String pergunta = Pergunta.Text;

        try
        {
            Conexao conexao = new Conexao();
            try
            {
                conexao.conectar();

            }
            catch (Exception)
            {
                lblErPerfil.Text = "Tivemos um erro em nosso servidor, tente novamente";
                return;
            }

            String sql = "UPDATE tblDoador SET Pergunta=@pergunta, Resposta=@resposta " +
                "WHERE CPF_CNPJ = @cpfcnpj ";

            conexao.command.CommandText = sql;

            conexao.command.Parameters.Add("@pergunta", SqlDbType.VarChar).Value = pergunta;
            conexao.command.Parameters.Add("@resposta", SqlDbType.VarChar).Value = resposta;
            conexao.command.Parameters.Add("@cpfcnpj", SqlDbType.VarChar).Value = cpfcnpj;

            conexao.command.ExecuteNonQuery();
            conexao.fechaConexao();
            lblErPerfil.Text = "Seus dados foram atualizados :D";
        }
        catch (Exception)
        {
            lblErPerfil.Text = "Tivemos um erro ao atualizar os dados, tente novamente mais tarde";
        }
    }
}
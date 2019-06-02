using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            txEmail.Text = Session["email"].ToString();
            lblLoginEntrar.Text = "Você é um doador agora ;D";
            Session.Remove("email");
            return;
        }
        lblLoginEntrar.Text = "Faça o login para doar!";
    }

    protected void btnEntrar_Click1(object sender, EventArgs e)
    {
        String sql;
        String email, senha;
        email = txEmail.Text.Trim();
        senha = txtSenhaLog.Text.Trim();
        DataSet dt = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();
        Conexao conexao = new Conexao();

        try
        {
            //conectar ao banco
            conexao.conectar();
        }
        catch (Exception)
        {

            lblErLogin.Text = "Tivemos um erro em nosso servidor, tente novamente";
        }
        try
        {
            conexao.command.Parameters.Clear(); // limpar parâmetros
            sql = "SELECT IdDoador, Nome, RazaoSocial, CPF_CNPJ, Email, Senha, Ativo FROM tblDoador WHERE Email LIKE @email";
            conexao.command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            conexao.command.CommandText = sql;
            dAdapter.SelectCommand = conexao.command;
            dAdapter.Fill(dt);

            if (dt.Tables[0].DefaultView[0].Row["Senha"].ToString() != txtSenhaLog.Text)
            {
                lblErLogin.Text = "Senha incorreta :(";
                conexao.fechaConexao();
                return;
            }
            else
            {
                if (Convert.ToInt32(dt.Tables[0].DefaultView[0].Row["Ativo"]) == 0)
                {
                    //ativando doador
                    conexao.command.Parameters.Clear(); // limpar parâmetros
                    sql = "	update tblDoador set Ativo = 1 where IdDoador = @idDoador";
                    conexao.command.Parameters.Add("@idDoador", SqlDbType.VarChar).Value = dt.Tables[0].DefaultView[0].Row["IdDoador"].ToString();
                    conexao.command.CommandText = sql;
                    conexao.command.ExecuteNonQuery();
                    dAdapter.Fill(dt);
                    Session["ativado"] = 1;
                }

                conexao.fechaConexao();

                Session["CPF_CNPJ"] = dt.Tables[0].DefaultView[0].Row["CPF_CNPJ"].ToString();
                Session["IdDoador"] = dt.Tables[0].DefaultView[0].Row["IdDoador"].ToString();

                if (dt.Tables[0].DefaultView[0].Row["Nome"].ToString().Length > 1)
                {
                    Session["NomeDoador"] = dt.Tables[0].DefaultView[0].Row["Nome"].ToString();
                }
                else
                {
                    Session["NomeDoador"] = dt.Tables[0].DefaultView[0].Row["RazaoSocial"].ToString();
                }

                Session["logado"] = 1;
                Response.Redirect("home.aspx");
            }
        }
        catch (Exception)
        {
            lblErLogin.Text = "Usuário não cadastrado :(";
            return;
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class recuperarsenha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        recupSenha.Visible = false;
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        String email = txtEmail.Text;
        String sql;
        Conexao conexao = new Conexao();
        DataSet dt = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();
        
        try
        {
            //Conectar com o BD
            conexao.conectar();
        }
        catch (SqlException)
        {
            lblErRecup.Text = "Tivemos um erro em nosso servidor, tente novamente";
        }
        try
        {
            //Comandos SQL
            sql = "SELECT * FROM tblDoador WHERE Email = @email";
            conexao.command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            conexao.command.CommandText = sql;
            dAdapter.SelectCommand = conexao.command;
            dAdapter.Fill(dt);

            
            String pergunta = dt.Tables[0].DefaultView[0].Row["Pergunta"].ToString();

            if (dt.Tables[0].DefaultView[0].Row["Email"].ToString() != txtEmail.Text)
            {
                lblErRecup.Text = "Email não cadastrado";
                conexao.fechaConexao();
                return;
            }
            else
              {
                lblErRecup.Text = "";
                lblPergunta.Text = pergunta;
                pergSecreta.Visible = true;
                txtResposta.Text = "";
                btnVoltar.Visible = false;
            }
            
        }
        catch (Exception)
        {
            lblErRecup.Text = "Email não cadastrado";
           
        }
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {

        String senha = txtSenha1.Text;
        String email = txtEmail.Text;
        String sql;
        Conexao conexao = new Conexao();
        try
        {
            conexao.conectar();
        }
        catch (SqlException ex)
        {

            lblErRecup.Text = "Tivemos um erro em nosso servidor, tente novamente";
        }
        try
        {
            sql = "UPDATE tblDoador SET Senha = @senha WHERE Email = @email";
            conexao.command.Parameters.Add("@senha", SqlDbType.VarChar).Value = senha;
            conexao.command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            conexao.command.CommandText = sql;
            conexao.command.ExecuteNonQuery();
            conexao.fechaConexao();

            txtEmail.Text = "";
            lblErRecup.Text = "Senha alterada com sucesso :D";
            btnVoltar.Visible = true;
            pergSecreta.Visible = false;
        }
        catch (Exception)
        {
            lblErRecup.Text = "Tivemos um erro inesperado, tente novamente mais tarde";
        } 
    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void btnVerificar_Click(object sender, EventArgs e)
    {
        Conexao conexao = new Conexao();
        String resposta = txtResposta.Text;
        String sql;

        try
        {
            conexao.conectar();
        }
        catch (SqlException ex)
        {

            lblErRecup.Text = "Tivemos um erro em nosso servidor, tente nvamente";
            pergSecreta.Visible = false;
        }

        try
        {
            sql = "IF NOT EXISTS(SELECT Resposta FROM tblDoador WHERE Resposta = @resposta) BEGIN SELECT 'Resposta invalida' END ";
            conexao.command.Parameters.Add("@resposta", SqlDbType.VarChar).Value = resposta;
            conexao.command.CommandText = sql;
            conexao.dr = conexao.command.ExecuteReader();

            if (conexao.dr.HasRows)
            {
                while(conexao.dr.Read()){
                        lblErResposta.Text = conexao.dr[0].ToString();
                      }
            }
            else
            {
                lblErResposta.Text = "";
                txtResposta.Text = "";
                recupSenha.Visible = true;
                pergSecreta.Visible = false;
            }
            conexao.fechaConexao();
        }
        catch (SqlException ex)
        {

            throw;
        }
    }
}
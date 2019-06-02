using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class cadastropf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //deixando enabled no load, depois é retirado com javaScipt
        txtLogradouro.Enabled = false;
        txtBairro.Enabled = false;
        txtCidade.Enabled = false;
        txtUf.Enabled = false;
    }
    protected void btnEnviarCadastro_Click(object sender, EventArgs e)
    {
        String nome = txtNome.Text;
        String sobrenome = txtSobrenome.Text;
        String cpf = txtCpf.Text;
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
        String sexo = "";
        String pergunta = Pergunta.SelectedValue;
        String resposta = txtResposta.Text;
        int ativo = 1;

        if (radMasc.Checked)
        {
            sexo = "M";
        }
        else if (radFemi.Checked)
        {
            sexo = "F";
        }
        Conexao conexao = new Conexao();

        try
        {
            //conectar com o banco
            conexao.conectar();
        }
        catch (Exception)
        {
            lblErCadastro.Text = "Tivemos um erro em nosso servidor, tente novamente";
            return;
        }
        try
        {
            conexao.command.Parameters.Clear(); // limpar parâmetros
            conexao.command.CommandText =
             "IF EXISTS(SELECT Email FROM tblDoador WHERE Email LIKE @email) BEGIN SELECT 'E-mail já cadastrado' END " +
             "ELSE IF EXISTS (SELECT CPF_CNPJ FROM tblDoador WHERE CPF_CNPJ LIKE @cpfcnpj) BEGIN SELECT 'CPF já cadastrado' END " +
             "ELSE BEGIN INSERT INTO tblDoador(Email,Senha,Pergunta,Resposta,CPF_CNPJ,Nome,Sobrenome,Sexo,TelefoneA,TelefoneB,Logradouro,Numero,Complemento,CEP,Ativo,Uf,Cidade,Bairro) " +
            "VALUES(@email,@senha,@pergunta,@resposta,@cpfcnpj,@nome,@sobrenome,@sexo,@tel1,@tel2,@logra,@numero,@comple,@cep, @ativo,@uf,@cidade,@bairro) SELECT 'Você é um doador agora :)' END";

            conexao.command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            conexao.command.Parameters.Add("@senha", SqlDbType.VarChar).Value = senha2;
            conexao.command.Parameters.Add("@pergunta", SqlDbType.VarChar).Value = pergunta;
            conexao.command.Parameters.Add("@resposta", SqlDbType.VarChar).Value = resposta;
            conexao.command.Parameters.Add("@cpfcnpj", SqlDbType.VarChar).Value = cpf;
            conexao.command.Parameters.Add("@nome", SqlDbType.VarChar).Value = nome;
            conexao.command.Parameters.Add("@sobrenome", SqlDbType.VarChar).Value = sobrenome;
            conexao.command.Parameters.Add("@sexo", SqlDbType.Char).Value = sexo;
            conexao.command.Parameters.Add("@tel1", SqlDbType.VarChar).Value = tel1;
            conexao.command.Parameters.Add("@tel2", SqlDbType.VarChar).Value = tel2;
            conexao.command.Parameters.Add("@logra", SqlDbType.VarChar).Value = logra;
            conexao.command.Parameters.Add("@numero", SqlDbType.VarChar).Value = numero;
            conexao.command.Parameters.Add("@comple", SqlDbType.VarChar).Value = comple;
            conexao.command.Parameters.Add("@cep", SqlDbType.Char).Value = cep;
            conexao.command.Parameters.Add("@ativo", SqlDbType.Bit).Value = ativo;
            conexao.command.Parameters.Add("@uf", SqlDbType.Char).Value = uf;
            conexao.command.Parameters.Add("@cidade", SqlDbType.VarChar).Value = cidade;
            conexao.command.Parameters.Add("@bairro", SqlDbType.VarChar).Value = bairro;

            conexao.dr = conexao.command.ExecuteReader();
            String redirecionar = "";
            if (conexao.dr.HasRows)
            {
                while (conexao.dr.Read())
                {
                    redirecionar = conexao.dr[0].ToString();
                }
            }
            //redirecionar para login
            if(redirecionar.Equals("Você é um doador agora :)"))
            {
                Session["email"] = email;
                Response.Redirect("login.aspx");
            }
            else
            {
                lblErCadastro.Text = redirecionar;
                return;
            }
            conexao.fechaConexao();
        }
        catch (Exception)
        {
            //lblErCadastro.Text = "Tivemos um erro ao cadastrar, tente novamente mais tarde ";
            throw;
        }
    }
}
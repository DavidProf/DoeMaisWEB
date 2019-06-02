using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Net;

public partial class cadastroreceptora : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime time = DateTime.Today;
        for (DateTime _time = time.AddHours(00); _time < time.AddHours(24); _time = _time.AddMinutes(60))
        {
            droHora1.Items.Add(_time.ToShortTimeString());
            droHora2.Items.Add(_time.ToShortTimeString());
        }

        //deixando enabled no load, depois é retirado com javaScipt
        txtLogradouro.Enabled = false;
        txtBairro.Enabled = false;
        txtCidade.Enabled = false;
        txtUf.Enabled = false;
    }
    protected void btnEnviarCadastro_Click(object sender, EventArgs e)
    {
        int domicilio = 0;
        String domicilioEmail = "Não";
        String semana = "";
        String de = droHora1.SelectedValue;
        String ate = droHora2.SelectedValue;
        String resumo = txtResumo.Text;
        String fantasia = txtFantasia.Text;

        if (radSim.Checked == true)
        {
            domicilio = 1;
            domicilioEmail = "Sim";
        }

        if (radSemana.Checked == true)
        {
            semana = "Segunda,Terça,Quarta,Quinta,Sexta";
        }
        else if (radFim.Checked == true)
        {
            semana = "Sábado,Domingo";
        }
        else if (radOutro.Checked)
        {
            foreach (Control item in this.panSemana.Controls.OfType<CheckBox>().Where(i => i.Checked))
            {
                semana += item.ID + ",";
            }
        }
        else
        {
            semana = "Segunda,Terça,Quarta,Quinta,Sexta,Sábado,Domingo";
        }

        String razao = txtRazao.Text;
        String cnpj = txtCnpj.Text;
        String cep = txtCep.Text;
        String logra = txtLogradouro.Text;
        String bairro = txtBairro.Text;
        String cidade = txtCidade.Text;
        String uf = txtUf.Text;
        String numero = txtNumero.Text;
        String comple = txtComplemento.Text;
        String tel1 = txtTelUm.Text;
        String tel2 = txtTel2Rec.Text;
        String email = txtEmail.Text;
        String senha2 = txtSenha1.Text;
        int ativo = 0;
        String data = DateTime.Now.Day.ToString() + "/" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString();

        Conexao conexao = new Conexao();
        try
        {
            //conectar com o banco
            conexao.conectar();
        }
        catch (SqlException)
        {
            lblErCadastro.Text = "Tivemos um erro em nosso servidor, tente novamente";
            return;
        }
        try
        {
            conexao.command.CommandText =
             "IF EXISTS(SELECT Email FROM tblInstituicao WHERE Email LIKE @email) BEGIN SELECT 'Email já cadastrado' END " +
             "ELSE IF EXISTS (SELECT CNPJ FROM tblInstituicao WHERE CNPJ LIKE @cnpj) BEGIN SELECT 'CNPJ já cadastrado' END " +
            "ELSE BEGIN INSERT INTO tblInstituicao(CNPJ,Senha,Ativo,RazaoSocial,NomeFantasia,ResumoEmpresa,RetiraDoacao,TelefoneA,TelefoneB,Email,HoraAbre,HoraFecha,DiasAbertos,Logradouro,Numero,Complemento,CEP,Uf,Cidade,Bairro) " +
            "VALUES(@cnpj,@senha,@ativo,@razao,@fantasia,@resumo,@domicilio,@tel1,@tel2,@email,@de,@ate,@semana,@logra,@numero,@comple,@cep,@uf,@cidade,@bairro) SELECT 'Cadastro efetuado, por favor aguarde a confirmação.' END ";

            conexao.command.Parameters.Add("@cnpj", SqlDbType.Char).Value = cnpj;
            conexao.command.Parameters.Add("@senha", SqlDbType.VarChar).Value = senha2;
            conexao.command.Parameters.Add("@ativo", SqlDbType.Bit).Value = ativo;
            conexao.command.Parameters.Add("@razao", SqlDbType.VarChar).Value = razao;
            conexao.command.Parameters.Add("@fantasia", SqlDbType.VarChar).Value = fantasia;
            conexao.command.Parameters.Add("@resumo", SqlDbType.VarChar).Value = resumo;
            conexao.command.Parameters.Add("@domicilio", SqlDbType.Bit).Value = domicilio;
            conexao.command.Parameters.Add("@tel1", SqlDbType.VarChar).Value = tel1;
            conexao.command.Parameters.Add("@tel2", SqlDbType.VarChar).Value = tel2;
            conexao.command.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            conexao.command.Parameters.Add("@de", SqlDbType.Time).Value = de;
            conexao.command.Parameters.Add("@ate", SqlDbType.Time).Value = ate;
            conexao.command.Parameters.Add("@semana", SqlDbType.VarChar).Value = semana;
            conexao.command.Parameters.Add("@logra", SqlDbType.VarChar).Value = logra;
            conexao.command.Parameters.Add("@numero", SqlDbType.VarChar).Value = numero;
            conexao.command.Parameters.Add("@comple", SqlDbType.VarChar).Value = comple;
            conexao.command.Parameters.Add("@cep", SqlDbType.Char).Value = cep;
            conexao.command.Parameters.Add("@uf", SqlDbType.Char).Value = uf;
            conexao.command.Parameters.Add("@cidade", SqlDbType.VarChar).Value = cidade;
            conexao.command.Parameters.Add("@bairro", SqlDbType.VarChar).Value = bairro;

            conexao.dr = conexao.command.ExecuteReader();
            String enviar = "";
            if (conexao.dr.HasRows)
            {
                while (conexao.dr.Read())
                {
                    enviar = conexao.dr[0].ToString();
                }
            }

            if (enviar.Equals("Cadastro efetuado, por favor aguarde a confirmação."))
            {
                System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                client.Host = "smtp.live.com";
                client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential("Doe_Maiss2@outlook.com", "doacao2018");
                MailMessage mail = new MailMessage();
                mail.Sender = new System.Net.Mail.MailAddress("Doe_Maiss2@outlook.com", "Doe Mais");
                mail.From = new MailAddress("Doe_Maiss2@outlook.com", "Doe Mais");
                mail.To.Add(new MailAddress(txtEmail.Text, fantasia));
                mail.Subject = "Solicitação de implementação";
                mail.Body =
                        "<center>" +
                            "<div style='background-color: #2a65b8;  border-radius: 30px 30px 0px 0px;  width: 800px;'>" +
                                "<p style='font-size: 30px; color: white; padding: 10px; font-weight: 700;'> Olá " + fantasia + "</p>" +
                            "</div>" +
                            "<div style='width: 800px;'>" +
                            "<br>" +
                                "<p style='font-size: 22px; padding: 5px; font-family: sans sarif;'> Sua solicitação foi recebida com sucesso pela nossa equipe! </p>" +
                                "<p style='font-size: 22px; padding: 5px; font-family: sans sarif;'> Todas as solicitações de implementação são passadas por uma análise interna, caso sua solicitação seja aceita enviaremos outro E-mail confirmando a implementação e entraremos em contato para decidirmos o melhor dia e horário para isso! </p>" +
                                "<p style='font-size: 22px; padding: 5px; font-family: sans sarif;'> Desde já agradecemos sua vontade de trazer sorrisos a mais pessoas ;D </p>" +
                           "<br>" +
                           "</div>" +
                            "<div style='background-color: #2a65b8; height: 50px; border-radius: 0px 0px 30px 30px; width: 800px;'>" +
                                "<p style='font-size: 20px; padding: 10px; font-weight: 700; color: white;'> Doe Mais " + data + "</p>" +
                            "</div>" +
                        "</center>";
                mail.IsBodyHtml = true;
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                try
                {
                    client.Send(mail);
                    Session["imple"] = 1;
                    Response.Redirect("implementacao.aspx");
                }
                catch (Exception)
                {
                    lblErCadastro.Text = "Adicione um E-mail válido";
                }
                finally
                {
                    mail = null;
                }
            }
            else
            {
                lblErCadastro.Text = enviar;
            }
            conexao.fechaConexao();
        }
        catch (Exception)
        {
            lblErCadastro.Text = "Tivemos um erro ao cadastrar, tente novamente mais tarde";
        }
    }
}
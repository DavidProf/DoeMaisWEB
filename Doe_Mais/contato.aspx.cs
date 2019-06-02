using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class contato : System.Web.UI.Page
{
    protected void btnNovaMsg_Click(object sender, EventArgs e)
    {
        btnNovaMsg.Visible = false;
        panMsg.Visible = false;
        panForm.Visible = true;
        btnEnviarMsg.Visible = true;
        btnEnviarMsg.Focus();
    }

    protected void btnEnviarMsg_Click(object sender, EventArgs e)
    {
        //E-mail para a DOE MAIS
        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
        client.Host = "smtp.live.com";
        client.EnableSsl = true;
        client.Credentials = new System.Net.NetworkCredential("Doe_Maiss2@outlook.com", "doacao2018");
        MailMessage mail = new MailMessage();
        mail.Sender = new System.Net.Mail.MailAddress("Doe_Maiss2@outlook.com", "Doe Mais");
        mail.From = new MailAddress("Doe_Maiss2@outlook.com", "Doe Mais");
        mail.To.Add(new MailAddress("Doe_Maiss2@outlook.com", "Doe Mais"));
        mail.Subject = "Mensagem pelo site";
        mail.Body =
                "<center>" +
                    "<div style='background-color: #2a65b8;  border-radius: 30px 30px 0px 0px;  width: 800px;'>" +
                        "<p style='font-size: 30px; color: white; padding: 10px; font-weight: 700;'> Enviado por: " + txtNomeContato.Text + "</p>" +
                    "</div>" +
                    "<div style='width: 800px;'>" +
                        "<p style='font-size: 22px; padding: 5px; font-family: sans sarif;'> Mensagem: " + txtMensagemContato.Text +
                   "<br>" +
                   "</div>" +
                    "<div style='background-color: #2a65b8; height: 50px; border-radius: 0px 0px 30px 30px; width: 800px;'>" +
                        "<p style='font-size: 20px; padding: 10px; font-weight: 700; color: white;'> E-mail: " + txtEmailContato.Text + "</p>" +
                    "</div>" +
                "</center>";
        mail.IsBodyHtml = true;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.Normal;

        //E-mail para a Pessoa
        MailMessage email = new MailMessage();
        email.Sender = new System.Net.Mail.MailAddress("Doe_Maiss2@outlook.com", "Doe Mais");
        email.From = new MailAddress("Doe_Maiss2@outlook.com", "Doe Mais");
        email.To.Add(new MailAddress(txtEmailContato.Text, txtNomeContato.Text));
        email.Subject = "Mensagem para Doe Mais";
        email.Body =
                "<center>" +
                    "<div style='background-color: #2a65b8;  border-radius: 30px 30px 0px 0px;  width: 800px;'>" +
                        "<p style='font-size: 30px; color: white; padding: 10px; font-weight: 700;'> Olá " + txtNomeContato.Text + "</p>" +
                    "</div>" +
                    "<div style='width: 800px;'>" +
                    "<br>" +
                        "<p style='font-size: 22px; padding: 5px; font-family: sans sarif;'> Sua mensagem foi recebida com sucesso! </p>" +
                        "<p style='font-size: 22px; padding: 5px; font-family: sans sarif;'> Em breve retornaremos neste mesmo E-mail okay! </p>" +
                   "<br>" +
                        "<p style='font-size: 24px; padding: 5px; font-weight: 700; font-family: sans sarif;'> Nós agradecemos a sua Mensagem ;)</p>" +
                   "<br>" +
                   "</div>" +
                    "<div style='background-color: #2a65b8; height: 50px; border-radius: 0px 0px 30px 30px; width: 800px;'>" +
                        "<p style='font-size: 20px; padding: 10px; font-weight: 700; color: white;'> Doe Mais </p>" +
                    "</div>" +
                "</center>";
        email.IsBodyHtml = true;
        email.BodyEncoding = System.Text.Encoding.UTF8;
        email.IsBodyHtml = true;
        email.Priority = MailPriority.Normal;

        try
        {
            client.Send(email);
            client.Send(mail);
            panForm.Visible = false;
            btnEnviarMsg.Visible = false;
            panMsg.Visible = true;
            btnNovaMsg.Visible = true;
            btnNovaMsg.Focus();
            txtNomeContato.Text = "";
            txtEmailContato.Text = "";
            txtMensagemContato.Text = "";
        }
        catch (Exception)
        {
            lblErMsg.Text = "Não foi possível enviar a sua mensagem. Tente novamente!";
            txtNomeContato.Focus();
        }
        finally
        {
            mail = null;
            email = null;
        }
    }
}
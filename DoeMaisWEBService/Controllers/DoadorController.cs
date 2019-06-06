using DoeMaisWEBService.Models;
using DoeMaisWEBService.BD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using System.Data.SqlClient;

namespace DoeMaisWEBService.Controllers
{
    [RoutePrefix("doador")]
    public class DoadorController : ApiController
    {
        [Route("login")]
        [HttpGet]
        public Login GetLogin(String email, String senha)
        {
            if (senha == null || email == null || email.Trim().Equals("") || senha.Trim().Equals(""))
                return new Login();
            Login login = new Login();
            login.Sucesso = new DoadorBD().login(email, senha);

            return login;
        }

        [HttpGet]
        public DoadorModel GetDoador(String email, String senha)
        {
            if (senha == null || email == null || email.Trim().Equals("") || senha.Trim().Equals(""))
                return null;



            return new DoadorBD().GetDoador(email,senha);
        }
    }

    public class Login
    {
        Boolean _sucesso = false;

        public bool Sucesso { get => _sucesso; set => _sucesso = value; }
    }
}

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
        public Boolean GetLogin(String email, String senha)
        {
            if (senha == null || email == null || email.Trim().Equals("") || senha.Trim().Equals(""))
                return false;

            Boolean verdade = new DoadorBD().login(email, senha);

            return verdade;
        }

        [HttpGet]
        public DoadorModel GetDoador(String email, String senha)
        {
            if (senha == null || email == null || email.Trim().Equals("") || senha.Trim().Equals(""))
                return null;



            return new DoadorBD().GetDoador(email,senha);
        }
    }
}

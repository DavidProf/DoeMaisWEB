using DoeMaisWEBService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DoeMaisWEBService.Controllers
{
    [RoutePrefix("doador")]
    public class DoadorController : ApiController
    {
        [HttpGet]
        public Boolean GetLogin(String email, String senha)
        {
            if (senha == null || email == null || email.Equals("") || senha.Equals(""))
                return false;
            //Change to return true by validation
            //
            return true;
        }

        [HttpGet]
        public DoadorModel GetDoador(String email, String senha)
        {
            if (senha == null || email == null || email.Equals("") || senha.Equals(""))
                return null;
            //Change to return doador data
            //
            return new DoadorModel();
        }
    }
}

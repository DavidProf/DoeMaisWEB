using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DoeMaisWEBService.Models;

namespace DoeMaisWEBService.Controllers
{
    [RoutePrefix("Mensagem")]
    public class MensagemController : ApiController
    {
        [HttpGet]
        public List<MensagemModel> GetMensagems()
        {
            return null;
        }
    }
}

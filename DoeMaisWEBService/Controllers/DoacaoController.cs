using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DoeMaisWEBService.Models;

namespace DoeMaisWEBService.Controllers
{
    [RoutePrefix("doacao")]
    public class DoacaoController : ApiController
    {
        [Route("pendentes")]
        [HttpGet]
        public List<DoacaoModel> GetDoacoesPendentes(String email, String senha)
        {
            /*
             instituicao
             data p/ doar
             cod
             */
            return null;
        }

        [Route("doadas")]
        [HttpGet]
        public List<DoacaoModel> GetDoacoesDoadas(String email, String senha)
        {
            /*
             instituicao
             data doada
             cod
             */
            return null;
        }

        [Route("doadas/qtd")]
        [HttpGet]
        public int GetDoacoesDoadasQTD(String email, String senha)
        {
            /*
             qtd
             */
            return 0;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DoeMaisWEBService.Models;

namespace DoeMaisWEBService.Controllers
{
    [RoutePrefix("doador/doacao")]
    public class DoacaoController : ApiController
    {
        [Route("pendentes")]
        [HttpGet]
        public List<DoacaoModel> GetDoacoesPendentes(String email, String senha)
        {
            return new BD.DoacaoBD().GetDoacoesPendentes(email,senha);
        }

        [Route("doadas")]
        [HttpGet]
        public List<DoacaoModel> GetDoacoesDoadas(String email, String senha)
        {
            return new BD.DoacaoBD().GetDoacoesDoadas(email,senha);
        }

        [Route("doadas/qtd")]
        [HttpGet]
        public int GetDoacoesDoadasQTD(String email, String senha)
        {
            return new BD.DoacaoBD().GetDoacoesDoadasQTD(email,senha);
        }

        [Route("doadas/itens/qtd")]
        [HttpGet]
        public int GetDoacoesDoadasItensQTD(String email, String senha)
        {
            return new BD.DoacaoBD().GetDoacoesDoadasItensQTD(email, senha);
        }
    }
}

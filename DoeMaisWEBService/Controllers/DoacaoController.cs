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

        [Route("itens")]
        [HttpGet]
        public List<ItemModel> GetDoacaoItens(int cod)
        {
            
            return new BD.DoacaoBD().GetDoacaoPendenteItens(cod);
        }

        [Route("doadas")]
        [HttpGet]
        public List<DoacaoModel> GetDoacoesDoadas(String email, String senha)
        {
            return new BD.DoacaoBD().GetDoacoesDoadas(email,senha);
        }

        [Route("doadas/qtd")]
        [HttpGet]
        public Qtd GetDoacoesDoadasQTD(String email, String senha)
        {
            Qtd qtd = new Qtd();
            qtd.Quantidade = new BD.DoacaoBD().GetDoacoesDoadasQTD(email, senha);
            return qtd;
        }

        [Route("doadas/itens/qtd")]
        [HttpGet]
        public Qtd GetDoacoesDoadasItensQTD(String email, String senha)
        {
            Qtd qtd = new Qtd();
            qtd.Quantidade = new BD.DoacaoBD().GetDoacoesDoadasItensQTD(email, senha);
            return qtd;
        }
    }

    public class Qtd
    {
        int quantidade = 0;

        public int Quantidade { get => quantidade; set => quantidade = value; }
    }
}

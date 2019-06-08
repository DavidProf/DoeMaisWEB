using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoeMaisWEBService.Models
{
    public class ItemModel
    {
        private String nome;
        private String qtd;

        public string Nome { get => nome; set => nome = value; }
        public string Qtd { get => qtd; set => qtd = value; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoeMaisWEBService.Models
{
    public class AvaliacaoModel
    {
        int atendimento = 0;
        int agilidade = 0;
        int confianca = 0;
        int transparencia = 0;
        int cuidado = 0;

        public int Atendimento { get => atendimento; set => atendimento = value; }
        public int Agilidade { get => agilidade; set => agilidade = value; }
        public int Confianca { get => confianca; set => confianca = value; }
        public int Transparencia { get => transparencia; set => transparencia = value; }
        public int Cuidado { get => cuidado; set => cuidado = value; }
    }
}
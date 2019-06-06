using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoeMaisWEBService.Models
{
    public class MensagemModel
    {
        private String instituicao;
        private String funcionario;
        private String cod;
        private String data;
        private String doador;
        private String texto;
        private Boolean lida;

        public string Instituicao { get => instituicao; set => instituicao = value; }
        public string Funcionario { get => funcionario ?? String.Empty; set => funcionario = value ?? String.Empty; }
        public string Doador { get => doador; set => doador = value; }
        public string Data { get => data; set => data = value; }
        public string Texto { get => texto; set => texto = value; }
        public bool Lida { get => lida; set => lida = value; }
        public string Cod { get => cod; set => cod = value; }
    }
}
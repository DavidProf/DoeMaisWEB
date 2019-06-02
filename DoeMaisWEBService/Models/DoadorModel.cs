using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoeMaisWEBService.Models
{
    public class DoadorModel
    {
        private String email;
        private String nome;
        private String sobrenome;
        private String sexo;
        private String cpf;
        private String cep;
        private String logradouro;
        private String numero;
        private String complemento;
        private String bairro;
        private String cidade;
        private String uf;
        private String telefoneA;
        private String telefoneB;

        public string Email { get => email; set => email = value; }
        public string Nome { get => nome; set => nome = value; }
        public string Sobrenome { get => sobrenome; set => sobrenome = value; }
        public string Sexo { get => sexo; set => sexo = value; }
        public string Cpf { get => cpf; set => cpf = value; }
        public string Cep { get => cep; set => cep = value; }
        public string Logradouro { get => logradouro; set => logradouro = value; }
        public string Numero { get => numero; set => numero = value; }
        public string Complemento { get => complemento; set => complemento = value; }
        public string Bairro { get => bairro; set => bairro = value; }
        public string Cidade { get => cidade; set => cidade = value; }
        public string Uf { get => uf; set => uf = value; }
        public string TelefoneA { get => telefoneA; set => telefoneA = value; }
        public string TelefoneB { get => telefoneB; set => telefoneB = value; }
    }
}
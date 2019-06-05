using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DoeMaisWEBService.BD
{
    public class Conexao
    {
        public SqlConnection conexao;
        public SqlCommand cmd;
        public SqlDataReader dAdapter;
        public SqlDataReader dr;

        string strConexao = "Server=DESKTOP-S8IBU5I\\SQLEXPRESS;DataBase=DoeMais;user id=sa;password=12345";//David

        public void conectar()
        {
            conexao = new SqlConnection(strConexao);
            conexao.Open();
            cmd = new SqlCommand();
            cmd.Connection = conexao;
        }

        public void fechaConexao()
        {
            conexao.Close();
            conexao = null;
            cmd = null;
        }


        public Conexao()
        {
            //
            // TODO: Adicionar lógica de construtor aqui
            //
        }
    }
}
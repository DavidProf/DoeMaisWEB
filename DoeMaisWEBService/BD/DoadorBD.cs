using DoeMaisWEBService.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DoeMaisWEBService.BD
{
    public class DoadorBD
    {
        public Boolean login(String email, String senha)
        {
            Boolean verdade = false;

            Conexao bd = new Conexao();
            try
            {
                bd.conectar();

                bd.cmd.CommandText = "select Count(*) from tblDoador WHERE Email LIKE @email AND Senha LIKE @senha";
                bd.cmd.Parameters.AddWithValue("@email", email);
                bd.cmd.Parameters.AddWithValue("@senha", senha);

                bd.dr = bd.cmd.ExecuteReader();

                if (bd.dr.HasRows)
                {
                    while (bd.dr.Read())
                    {
                        verdade = Convert.ToBoolean(Convert.ToInt32(bd.dr[0].ToString()));
                    }
                }

                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
            }
            catch (SqlException)
            {
                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
                verdade = false;
            }

            return verdade;
        }

        public DoadorModel GetDoador(String email, String senha)
        {
            Conexao bd = new Conexao();
            DoadorModel ret = new DoadorModel();

            try
            {
                bd.conectar();
                bd.cmd.CommandText =
                " SELECT " +
                " [Email] " +
                " ,[Nome] " +
                " ,[Sobrenome] " +
                " ,[CPF_CNPJ] " +
                " ,[Sexo] " +
                " ,[CEP] " +
                " ,[Logradouro] " +
                " ,[Numero] " +
                " ,[Complemento] " +
                " ,[Bairro] " +
                " ,[Cidade] " +
                " ,[UF] " +
                " ,[TelefoneA] " +
                " ,[TelefoneB] " +
                " FROM [dbo].[tblDoador] " +
                " WHERE Email LIKE @email and Senha LIKE @senha";
                bd.cmd.Parameters.AddWithValue("@email", email);
                bd.cmd.Parameters.AddWithValue("@senha", senha);

                bd.dr = bd.cmd.ExecuteReader();

                if (bd.dr.HasRows)
                {
                    while (bd.dr.Read())
                    {
                        ret.Email = bd.dr[0].ToString();
                        ret.Nome = bd.dr[1].ToString();
                        ret.Sobrenome = bd.dr[2].ToString();
                        ret.Cpf = bd.dr[3].ToString();
                        ret.Sexo = bd.dr[4].ToString();
                        ret.Cep = bd.dr[5].ToString();
                        ret.Logradouro = bd.dr[6].ToString();
                        ret.Numero = bd.dr[7].ToString();
                        ret.Complemento = bd.dr[8].ToString();
                        ret.Bairro = bd.dr[9].ToString();
                        ret.Cidade = bd.dr[10].ToString();
                        ret.Uf = bd.dr[11].ToString();
                        ret.TelefoneA = bd.dr[12].ToString();
                        ret.TelefoneB = bd.dr[13].ToString();
                    }
                }

                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
            }
            catch (SqlException)
            {
                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
                ret = null;
            }

            return ret;
        }
    }
}
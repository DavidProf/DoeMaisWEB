using DoeMaisWEBService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoeMaisWEBService.BD
{
    public class MensagemBD
    {
        public List<MensagemModel> GetMensagems(String email, String senha)
        {
            List<MensagemModel> mensagens = new List<MensagemModel>();
            Conexao bd = new Conexao();
            try
            {
                bd.conectar();
                #region CommandText
                bd.cmd.CommandText =
                " SELECT I.NomeFantasia, M.IdMensagem, M.DataDeEnvio " +
                " FROM tblDoador AS D " +
                " INNER JOIN tblMensagem AS M " +
                " ON M.fk_IdDoador = D.IdDoador " +
                " INNER JOIN tblInstituicao AS I " +
                " ON I.CNPJ = M.fk_Cnpj " +
                " WHERE D.Email LIKE @email AND D.Senha LIKE @senha " +
                " AND (M.Lida IS NULL OR M.Lida = 0) " +
                "";
                bd.cmd.Parameters.AddWithValue("@email", email);
                bd.cmd.Parameters.AddWithValue("@senha", senha);
                #endregion

                bd.dr = bd.cmd.ExecuteReader();

                if (bd.dr.HasRows)
                {
                    while (bd.dr.Read())
                    {
                        MensagemModel m = new MensagemModel();
                        m.Instituicao = bd.dr[0].ToString();
                        m.Cod = bd.dr[1].ToString();
                        m.Data = bd.dr[2].ToString();
                        mensagens.Add(m);
                    }
                }

                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
            }
            catch (System.Data.SqlClient.SqlException)
            {
                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
            }

            return mensagens;
        }

    }
}
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

        public Boolean EnviarMensagemPorIdDoacao(int idDoacao, String email, String senha, String texto)
        {
            Conexao bd = new Conexao();
            try
            {
                bd.conectar();
                #region CommandText
                bd.cmd.CommandText =
                " UPDATE tblMensagem " +
                " SET Lida = 1 " +
                " FROM tblMensagem AS M " +
                " INNER JOIN tblDoador AS D " +
                " ON D.IdDoador = M.fk_IdDoador " +
                " WHERE fk_Cnpj = (SELECT ID.fk_CNPJ FROM tblDoacao AS D INNER JOIN tblDetalheDoacao AS DD " +
                " ON DD.fk_IdDoacao = D.IdDoacao " +
                " INNER JOIN tblItemDetalhe AS ID " +
                " ON ID.IdItemDetalhe = DD.fk_IdItemDetalhe " +
                " WHERE D.IdDoacao = @iddoacao " +
                " GROUP BY ID.fk_CNPJ) AND " +
                " D.Email LIKE @email AND D.Senha LIKE @senha " +
                "  " +
                " INSERT INTO [dbo].[tblMensagem] " +
                " ([Texto] " +
                " ,[DataDeEnvio] " +
                " ,[fk_IdFuncionario] " +
                " ,[fk_IdDoador] " +
                " ,[fk_Cnpj]) " +
                " VALUES " +
                " (@texto " +
                " ,GETDATE() " +
                " ,null " +
                " ,(SELECT IdDoador FROM tblDoador WHERE Email LIKE @email AND Senha LIKE @senha) " +
                " ,(SELECT ID.fk_CNPJ FROM tblDoacao AS D INNER JOIN tblDetalheDoacao AS DD " +
                " ON DD.fk_IdDoacao = D.IdDoacao " +
                " INNER JOIN tblItemDetalhe AS ID " +
                " ON ID.IdItemDetalhe = DD.fk_IdItemDetalhe " +
                " WHERE D.IdDoacao = @iddoacao " +
                " GROUP BY ID.fk_CNPJ) ) " +
                "";
                bd.cmd.Parameters.AddWithValue("@iddoacao", idDoacao);
                bd.cmd.Parameters.AddWithValue("@email", email);
                bd.cmd.Parameters.AddWithValue("@senha", senha);
                bd.cmd.Parameters.AddWithValue("@texto", texto);
                #endregion

                bd.cmd.ExecuteNonQuery();

                bd.fechaConexao();
                return true;
            }
            catch (System.Data.SqlClient.SqlException)
            {
                bd.fechaConexao();
                return false;
            }
        }

        public Boolean EnviarMensagemPorIdMensagem(int idmensagem, String email, String senha, String texto)
        {
            Conexao bd = new Conexao();
            try
            {
                bd.conectar();
                #region CommandText
                bd.cmd.CommandText =
                " UPDATE tblMensagem " +
                " SET Lida = 1 " +
                " FROM tblMensagem AS M " +
                " INNER JOIN tblDoador AS D " +
                " ON D.IdDoador = M.fk_IdDoador " +
                " WHERE fk_Cnpj = (SELECT fk_Cnpj FROM tblMensagem WHERE IdMensagem = @idmensagem) AND " +
                " D.Email LIKE @email AND D.Senha LIKE @senha " +
                "  " +
                " INSERT INTO [dbo].[tblMensagem] " +
                " ([Texto] " +
                " ,[DataDeEnvio] " +
                " ,[fk_IdFuncionario] " +
                " ,[fk_IdDoador] " +
                " ,[fk_Cnpj]) " +
                " VALUES " +
                " (@texto " +
                " ,GETDATE() " +
                " ,null " +
                " ,(SELECT IdDoador FROM tblDoador WHERE Email LIKE @email AND Senha LIKE @senha) " +
                " ,(SELECT fk_Cnpj FROM tblMensagem WHERE IdMensagem = @idmensagem)) " +
                "";
                bd.cmd.Parameters.AddWithValue("@idmensagem", idmensagem);
                bd.cmd.Parameters.AddWithValue("@email", email);
                bd.cmd.Parameters.AddWithValue("@senha", senha);
                bd.cmd.Parameters.AddWithValue("@texto", texto);
                #endregion

                bd.cmd.ExecuteNonQuery();

                bd.fechaConexao();
                return true;
            }
            catch (System.Data.SqlClient.SqlException)
            {
                bd.fechaConexao();
                return false;
            }
        }

    }
}
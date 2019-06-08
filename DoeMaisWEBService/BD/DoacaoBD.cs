using DoeMaisWEBService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoeMaisWEBService.BD
{
    public class DoacaoBD
    {
        public List<DoacaoModel> GetDoacoesPendentes(String email, String senha)
        {
            Conexao bd = new Conexao();
            List<DoacaoModel> doacoesPendentes = new List<DoacaoModel>();

            try
            {
                bd.conectar();
                #region CommandText
                bd.cmd.CommandText =
                " SELECT D.IdDoacao, I.NomeFantasia, D.DataEntrega, D.DataRetirada " +
                " FROM tblDoador AS DOADOR " +
                " INNER JOIN tblDoacao AS D " +
                " ON D.fk_IdDoador = DOADOR.IdDoador " +
                " INNER JOIN tblDetalheDoacao AS DD " +
                " ON DD.fk_IdDoacao = D.IdDoacao " +
                " INNER JOIN tblItemDetalhe AS ID " +
                " ON ID.IdItemDetalhe = DD.fk_IdItemDetalhe " +
                " INNER JOIN tblInstituicao AS I " +
                " ON I.CNPJ = ID.fk_CNPJ " +
                " WHERE DOADOR.Email LIKE @email AND DOADOR.Senha LIKE @senha " +
                " AND D.Pendente = 1 " +
                " GROUP BY D.IdDoacao, I.NomeFantasia, D.DataEntrega, D.DataRetirada " +
                "";
                bd.cmd.Parameters.AddWithValue("@email", email);
                bd.cmd.Parameters.AddWithValue("@senha", senha);
                #endregion

                bd.dr = bd.cmd.ExecuteReader();

                if (bd.dr.HasRows)
                {
                    while (bd.dr.Read())
                    {
                        DoacaoModel doacao = new DoacaoModel();
                        doacao.Cod = bd.dr[0].ToString();
                        doacao.Instituicao = bd.dr[1].ToString();
                        doacao.DataParaDoar = bd.dr[2].ToString();
                        doacao.DataParaRetirada = bd.dr[3].ToString();
                        doacoesPendentes.Add(doacao);

                    }
                }

                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
            }
            catch (System.Data.SqlClient.SqlException)
            {
                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
                doacoesPendentes = null;
            }

            return doacoesPendentes;
        }

        public List<ItemModel> GetDoacaoPendenteItens(int cod)
        {
            Conexao bd = new Conexao();
            List<ItemModel> itens = new List<ItemModel>();

            try
            {
                bd.conectar();
                #region CommandText
                bd.cmd.CommandText =
                " SELECT " +
                " tblItemPreCadastro.ItemNome, " +
                " COUNT (*) " +
                " FROM tblDetalheDoacao " +
                " LEFT JOIN tblItemDetalhe " +
                " ON tblDetalheDoacao.fk_IdItemDetalhe = tblItemDetalhe.IdItemDetalhe " +
                " LEFT JOIN tblItemPreCadastro " +
                " ON tblItemDetalhe.fk_IdItemPreCadastro = tblItemPreCadastro.IdItemPreCadastro " +
                " WHERE tblDetalheDoacao.fk_IdDoacao = @codDoacao " +
                " GROUP BY ItemNome " +
                "";
                bd.cmd.Parameters.AddWithValue("@codDoacao", cod);
                #endregion

                bd.dr = bd.cmd.ExecuteReader();

                if (bd.dr.HasRows)
                {
                    while (bd.dr.Read())
                    {
                        ItemModel item = new ItemModel();
                        item.Nome = bd.dr[0].ToString();
                        item.Qtd = bd.dr[1].ToString();
                        itens.Add(item);

                    }
                }

                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
            }
            catch (System.Data.SqlClient.SqlException)
            {
                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
                itens = null;
            }

            return itens;
        }

        public List<DoacaoModel> GetDoacoesDoadas(String email, String senha)
        {
            Conexao bd = new Conexao();
            List<DoacaoModel> doacoesPendentes = new List<DoacaoModel>();

            try
            {
                bd.conectar();
                #region CommandText
                bd.cmd.CommandText =
                " SELECT D.IdDoacao, I.NomeFantasia, D.DataEntregue " +
                " FROM tblDoador AS DOADOR " +
                " INNER JOIN tblDoacao AS D " +
                " ON D.fk_IdDoador = DOADOR.IdDoador " +
                " INNER JOIN tblDetalheDoacao AS DD " +
                " ON DD.fk_IdDoacao = D.IdDoacao " +
                " INNER JOIN tblItemDetalhe AS ID " +
                " ON ID.IdItemDetalhe = DD.fk_IdItemDetalhe " +
                " INNER JOIN tblInstituicao AS I " +
                " ON I.CNPJ = ID.fk_CNPJ " +
                " WHERE DOADOR.Email LIKE @email AND DOADOR.Senha LIKE @senha " +
                " AND D.Pendente = 0 " +
                " GROUP BY D.IdDoacao, I.NomeFantasia, D.DataEntregue " +
                "";
                bd.cmd.Parameters.AddWithValue("@email", email);
                bd.cmd.Parameters.AddWithValue("@senha", senha);
                #endregion

                bd.dr = bd.cmd.ExecuteReader();

                if (bd.dr.HasRows)
                {
                    while (bd.dr.Read())
                    {
                        DoacaoModel doacao = new DoacaoModel();
                        doacao.Cod = bd.dr[0].ToString();
                        doacao.Instituicao = bd.dr[1].ToString();
                        doacao.DataDoada = bd.dr[2].ToString();
                        doacoesPendentes.Add(doacao);

                    }
                }

                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
            }
            catch (System.Data.SqlClient.SqlException)
            {
                bd.cmd.Parameters.Clear();
                bd.fechaConexao();
                doacoesPendentes = null;
            }

            return doacoesPendentes;
        }

        public int GetDoacoesDoadasQTD(String email, String senha)
        {
            Conexao bd = new Conexao();
            int qtd = 0;

            try
            {
                bd.conectar();
                #region CommandText
                bd.cmd.CommandText =
                " SELECT COUNT(D.IdDoacao) " +
                " FROM tblDoador AS DOADOR " +
                " INNER JOIN tblDoacao AS D " +
                " ON D.fk_IdDoador = DOADOR.IdDoador " +
                " WHERE DOADOR.Email LIKE @email AND DOADOR.Senha LIKE @senha " +
                " AND D.Pendente = 0 " +
                "";
                bd.cmd.Parameters.AddWithValue("@email", email);
                bd.cmd.Parameters.AddWithValue("@senha", senha);
                #endregion

                bd.dr = bd.cmd.ExecuteReader();

                if (bd.dr.HasRows)
                {
                    while (bd.dr.Read())
                    {
                        qtd = Convert.ToInt32(bd.dr[0].ToString());
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

            return qtd;
        }

        public int GetDoacoesDoadasItensQTD(String email, String senha)
        {
            Conexao bd = new Conexao();
            int qtd = 0;
            try
            {
                bd.conectar();
                #region CommandText
                bd.cmd.CommandText =
                " SELECT COUNT(IPD.ItemNome) " +
                " FROM tblDoador AS DOADOR " +
                " INNER JOIN tblDoacao AS D " +
                " ON D.fk_IdDoador = DOADOR.IdDoador " +
                " INNER JOIN tblDetalheDoacao AS DD " +
                " ON DD.fk_IdDoacao = D.IdDoacao " +
                " INNER JOIN tblItemDetalhe AS ID " +
                " ON ID.IdItemDetalhe = DD.fk_IdItemDetalhe " +
                " INNER JOIN tblItemPreCadastro AS IPD " +
                " ON IPD.IdItemPreCadastro = ID.fk_IdItemPreCadastro " +
                " WHERE DOADOR.Email LIKE @email AND DOADOR.Senha LIKE @senha " +
                " AND D.Pendente = 0 " +
                "";
                bd.cmd.Parameters.AddWithValue("@email", email);
                bd.cmd.Parameters.AddWithValue("@senha", senha);
                #endregion

                bd.dr = bd.cmd.ExecuteReader();

                if (bd.dr.HasRows)
                {
                    while (bd.dr.Read())
                    {
                        qtd = Convert.ToInt32( bd.dr[0].ToString() );
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

            return qtd;
        }

    }
}
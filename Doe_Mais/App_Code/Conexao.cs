using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descrição resumida para Conexao
/// </summary>
public class Conexao
{
    public SqlConnection conexao;
    public SqlCommand command;
    public SqlDataReader dAdapter;
    public SqlDataReader dr;
    //string strConexao = "Server=DESKTOP-BDD1FVS;DataBase=DoeMais;user id=sa;password=123456";//Jonathas
    string strConexao = "Server=DESKTOP-TF64J7S;DataBase=DoeMais;user id=SA;password=123456";//Emerson
    //string strConexao = "Server=DESKTOP-VN1JO1D;DataBase=DoeMais;user id=SA;password=12345";//David
    //string strConexao = "Server=LAB02T-12\\SQLEXPRESS;DataBase=exe_produtos;trusted_conection=true";//Etec

    public void conectar()
    {
        conexao = new SqlConnection(strConexao);
        conexao.Open();
        command = new SqlCommand();
        command.Connection = conexao;
    }

    public void fechaConexao()
    {
        conexao.Close();
        conexao = null;
        command = null;
    }


	public Conexao()
	{
		//
		// TODO: Adicionar lógica de construtor aqui
		//
	}
}
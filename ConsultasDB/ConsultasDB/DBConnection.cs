using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace ConsultasDB
{
    class DBConnection
    {
        
        SqlCommand cmd;
        SqlDataReader reader;
        SqlConnection database;

        private string sqlstring = "Data Source=LAPTOP-LMLDKR3Q\\SQLEXPRESS; Initial Catalog=TECres; Integrated Security=True";


        public DBConnection()
        {
            try
            {
                database = new SqlConnection(sqlstring);
                database.Open();
                Console.WriteLine("Succesful Connection!");

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: SQL connection --> " + ex.Message);
            }
        }

        public void close()
        {
            database.Close();
        }
        /*
        Username VARCHAR(50) NOT NULL,
        Nombre VARCHAR(15) NOT NULL,
        PrimerApellido VARCHAR(15) NOT NULL,
        SegundoApellido VARCHAR(15) NOT NULL,
        Contrasena VARCHAR(50) NOT NULL,
        FechaIngreso DATE,
        */
            //"+id+" insertan INT
        public void LoginUsuario(string username, string nombre, string pApellido, string sApellido,string fecha)
        {
            try
            {
                cmd = new SqlCommand(
                    "INSERT INTO USUARIO(Username,Nombre,PrimerApellido,SegundoApellido,FechaIngreso)" +
                    "VALUES('"+username+"','"+nombre+"','"+pApellido+"','"+sApellido+"','"+fecha+"')",database);
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }


        /*
         * @username VARCHAR(50),
         *@nombre VARCHAR(15),
         *@pApellido VARCHAR(15),
         *@sApellido VARCHAR(15),
         *@fecha DATE,
         *@nacionalidad INT,
         *@cedula INT,
         *@perfil VARCHAR(20)
         * 
         * */
        public void RegistrarCliente(string username, string nombre, string pApellido, string sApellido, string fecha,int nacionalidad,int cedula, string perfil)
        {


            try
            {
                cmd = new SqlCommand(
                    "EXEC RegistrarCliente '"+username +"','"+nombre+"','"+pApellido+"','"+sApellido+"','"+fecha+"',"+nacionalidad+","+cedula+",'"+perfil+"'", database);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }

        public void getListaClientes()
        {
            try
            {
                cmd = new SqlCommand("SELECT * FROM LISTA_CLIENTES",database);
                
                reader=cmd.ExecuteReader();
                while (reader.Read())
                {
                    Console.WriteLine(reader.GetValue(0).ToString());
                }
                reader.Close();
            
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }
    }
    

}

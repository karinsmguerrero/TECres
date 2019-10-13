using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_api.Models
{
    /**
     * Modelo Cliente 
     **/
    public class Cliente
    {
        public string Username { get; set; }
        public string Nombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public int Cedula { get; set; }
        public string PerfilCliente { get; set; }
        public string Nacionalidad { get; set; }
    }

    public class ClienteU
    {
        
        public string Username { get; set; }
        public string Nombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public int Cedula { get; set; }
        public string PerfilCliente { get; set; }
        public string Nacionalidad { get; set; }
        public System.DateTime FechaIngreso { get; set; }
    }


}
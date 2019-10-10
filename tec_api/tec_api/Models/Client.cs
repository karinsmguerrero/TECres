using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tec_api.Models
{
    /**
     *Model Cliente 
     **/
    public class Client
    {
        public string Username { get; set; }
        public string Nombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public int Cedula { get; set; }
        public string PerfilCliente { get; set; }
        public string Nacionalidad { get; set; }
    

    }
}
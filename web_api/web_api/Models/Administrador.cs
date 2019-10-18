using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_api.Models
{

    public class Administrador
    {
        public string Username { get; set; }
        public int Cedula { get; set; }
        public string Nombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public System.DateTime FechaIngreso { get; set; }
        public string Contrasena { get; set; }
        public string Correo { get; set; }
    }
    
    public class AdministradorAux
    {
        public string Username { get; set; }
        public int Cedula { get; set; }
        public string Nombre { get; set; }
    }
}
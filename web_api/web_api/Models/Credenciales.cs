using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_api.Models
{
    public class Credenciales
    {
        public string Username { get; set; }
        public string Nombre { get; set; }
        public string Contrasena { get; set; }
        public string TipoCuenta { get; set; }
    }

}
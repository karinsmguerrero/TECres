using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_api.Models
{
    public class Comprador
    {
        public string Username { get; set; }
        public System.DateTime FechaNacimiento { get; set; }
        public int IngresoMensual { get; set; }
        public int IdOcupacion { get; set; }
        public int Domicilio { get; set; }
        public string Sexo { get; set; }

    }
}
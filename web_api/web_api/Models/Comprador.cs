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
        public string Nombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public System.DateTime FechaIngreso { get; set; }
        public int Cedula { get; set; }
        public string Correo { get; set; }
        public string Contrasena { get; set; }
    }
    public class CompradorU
    {
        public string Username { get; set; }
        public string Nombre { get; set; }
        public System.DateTime FechaNacimiento { get; set; }
        public int IngresoMensual { get; set; }
        public string Ocupacion { get; set; }
        public string Provincia { get; set; }
        public string Canton { get; set; }
        public string Distrito { get; set; }
        public string Sexo { get; set; }

    }
}
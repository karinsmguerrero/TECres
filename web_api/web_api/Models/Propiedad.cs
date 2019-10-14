using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_api.Models
{
    public class Propiedad
    {
        public int Id { get; set; }
        public int CantidadBanos { get; set; }
        public int IdUbicacion { get; set; }
        public int TipoPropiedad { get; set; }
        public int TamanoLote { get; set; }
        public int TamanoPropiedad { get; set; }
        public bool Piscina { get; set; }
        public bool ParqueoVisitas { get; set; }
        public bool Parqueo { get; set; }
        public int TipoPiso { get; set; }
        public Nullable<int> CantidadNiveles { get; set; }
        public int CantidadHabitaciones { get; set; }
        public int Precio { get; set; }
        public string Propietario { get; set; }
        public Nullable<bool> Gimnasio { get; set; }
    }


    public class PropiedadU
    {
        public int Id { get; set; }
        public int CantidadBanos { get; set; }
        public int Provincia { get; set; }
        public int Canton { get; set; }
        public int Distrito { get; set; }
        public string TipoPropiedad { get; set; }
        public int TamanoLote { get; set; }
        public int TamanoPropiedad { get; set; }
        public bool Piscina { get; set; }
        public bool ParqueoVisitas { get; set; }
        public bool Parqueo { get; set; }
        public int TipoPiso { get; set; }
        public int CantidadNiveles { get; set; }
        public int CantidadHabitaciones { get; set; }
        public int Precio { get; set; }
        public string Propietario { get; set; }
        public bool Gimnasio { get; set; }
    }
}
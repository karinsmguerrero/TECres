using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_api.Models
{
    //Modelo Inmueble
    public class Inmueble
    {
        public int Id { get; set; }
        public string TipoPropiedad { get; set; }
        public bool Predeterminado { get; set; }
    }
    public class Inmueble_aux
    {
        public string TipoPropiedad { get; set; }
    }
    public class InmuebleUp
    { 
        public int Id { get; set; }
        public string NewValue { get; set; }
    }
}
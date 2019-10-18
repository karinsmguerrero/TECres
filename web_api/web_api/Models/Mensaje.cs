using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_api.Models
{
    public class Mensaje
    {
        public int Id { get; set; }
        public int IdAnuncio { get; set; }
        public System.DateTime Fecha { get; set; }
        public System.TimeSpan Hora { get; set; }
        public string Texto { get; set; }
        public string Emisor { get; set; }
        public string Receptor { get; set; }
        public Boolean Estado { get; set; }
        
    }

    public class MensajeU
    {
        public int IdAnuncio { get; set; }
        public string Emisor { get; set; }
        public string Receptor { get; set; }

    }
}
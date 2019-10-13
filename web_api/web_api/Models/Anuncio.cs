using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_api.Models
{
    public class Anuncio
    {
        public int Id { get; set; }
        public int IdPropiedad { get; set; }
        public string TipoAnuncio { get; set; }
        public int Tarjeta { get; set; }
        public string IdAgente { get; set; }
        public Nullable<bool> Estado { get; set; }
        public Nullable<bool> Venta { get; set; }
        public Nullable<int> IdPublico { get; set; }
    }
}
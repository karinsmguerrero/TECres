using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_api.Models
{
    public class Fotos
    {
        public int Id { get; set; }
        public string Ruta { get; set; }
        public int IdPropiedad { get; set; }
    }
    public class FotosAux
    {
        public string Ruta { get; set; }
        public int IdPropiedad { get; set; }
    }
}
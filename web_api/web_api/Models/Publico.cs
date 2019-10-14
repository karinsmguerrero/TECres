﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_api.Models
{
    public class Publico
    {
        public int Id { get; set; }
        public System.DateTime FechaInicial { get; set; }
        public System.DateTime FechaFinal { get; set; }
        public int CantidadMensajes { get; set; }
        public int IngresoInicial { get; set; }
        public int IngresoFinal { get; set; }
        public string Sexo { get; set; }
        public int EdadInicial { get; set; }
        public int EdadFinal { get; set; }
    }
}
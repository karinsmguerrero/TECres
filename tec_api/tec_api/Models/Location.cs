using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tec_api.Models
{
    public class Location
    {
        public int Id { get; set; }
        public string Provincia { get; set; }
        public string Canton { get; set; }
        public string Distrito { get; set; }

    }
}
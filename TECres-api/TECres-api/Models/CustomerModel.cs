﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TECres_api.Models
{
    public class CustomerModel
    {
        public string Name { get; set; }
        public string LastName { get; set; }
        public string BirthDate { get; set; }
        public string Adress { get; set; }
        public string Income { get; set; }
        public string Ocupation { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
    }
}
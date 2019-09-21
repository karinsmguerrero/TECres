﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TECres_api.Models
{
    public class AccountModel
    {
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string LoggedOn { get; set; }
        public string[] Roles{ get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TECres_api.Models
{
    public class AgentModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string LastNames { get; set; }
        public string EntryDate { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
    }
}
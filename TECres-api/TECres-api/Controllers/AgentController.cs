using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TECres_api.Models;

namespace TECres_api.Controllers
{
    public class AgentController : ApiController
    {
        [Route("api/Agents/Update")]
        [HttpPut]
        [AllowAnonymous]
        public Boolean Register(AgentModel model)
        {
            return true;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using web_api.Models;

namespace web_api.Controllers
{
    public class LoginController : ApiController
    {

        [HttpGet]
        [Route("api/GetCredenciales")]
        public HttpResponseMessage GetCredenciales(string username)
        {
            using (var db = new TecEntities())
            {

                var credenciales = db.Database.SqlQuery<Credenciales>("EXEC getCredenciales" + username);

                return this.Request.CreateResponse(HttpStatusCode.OK, credenciales);
            }
        }

    }
}

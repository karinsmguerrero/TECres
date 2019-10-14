using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using web_api.Models;

namespace web_api.Controllers
{
    public class OcupacionController : ApiController
    {
        [HttpGet]
        [Route("api/GetOcupaciones")]
        public HttpResponseMessage GetOcupaciones()
        {
            using (var db = new TecEntities())
            {

                var listaOcupaciones = db.Database.SqlQuery<Ocupacion>("SELECT Id,Nombre" +
                    " FROM OCUPACION").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaOcupaciones);
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using web_api.Models;

namespace web_api.Controllers
{
    public class PisoController : ApiController
    {

        [HttpGet]
        [Route("api/GetPisos")]
        public HttpResponseMessage GetPisos()
        {
            using (var db = new TecEntities())
            {

                var listaPisos = db.Database.SqlQuery<TipoPiso>("SELECT Id,Piso,Predeterminado" +
                    " FROM TIPO_PISO").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaPisos);
            }
        }
    }
}

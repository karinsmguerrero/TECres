using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using web_api.Models;

namespace web_api.Controllers
{
    public class PropiedadController : ApiController
    {
        [HttpGet]
        [Route("api/GetPropiedades")]
        public HttpResponseMessage GetInmuebles()
        {
            using (var db = new TecEntities())
            {
                var listaPropiedades = db.Database.SqlQuery<PropiedadU>("SELECT *" +
                    " FROM vPROPIEDADES").ToList();
                return this.Request.CreateResponse(HttpStatusCode.OK, listaPropiedades);
            }
        }
    }
}

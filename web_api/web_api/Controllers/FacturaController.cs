using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using web_api.Models;

namespace web_api.Controllers
{
    public class FacturaController : ApiController
    {
        [HttpGet]
        [Route("api/GetFacturas")]
        public HttpResponseMessage GetFacturas()
        {
            using (var db = new TecEntities())
            {

                var listaFacturas = db.Database.SqlQuery<Inmueble>("SELECT Id,TipoPropiedad,Predeterminado" +
                    " FROM INMUEBLE").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaFacturas);
            }
        }
    }
}

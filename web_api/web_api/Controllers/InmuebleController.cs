using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using web_api.Models;

namespace web_api.Controllers
{
    public class InmuebleController : ApiController
    {
        [HttpGet]
        [Route("api/GetInmuebles")]
        public HttpResponseMessage GetClientes()
        {
            using (var db = new TecEntities())
            {

                var listaInmuebles= db.Database.SqlQuery<Inmueble>("SELECT Id,TipoPropiedad" +
                    " FROM INMUEBLE").ToList();
                
                return this.Request.CreateResponse(HttpStatusCode.OK, listaInmuebles);
            }
        }
    }
}

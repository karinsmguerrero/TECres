using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using web_api.Models;

namespace web_api.Controllers
{
    public class NacionalidadController : ApiController
    {
        [HttpGet]
        [Route("api/GetNacionalidades")]
        public HttpResponseMessage GetNacionalidades()
        {
            using (var db = new TecEntities())
            {

                var listaNacionalidades = db.Database.SqlQuery<Origen>("SELECT Id,Nacionalidad" +
                    " FROM NACIONALIDAD").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaNacionalidades);
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using web_api.Models;

namespace web_api.Controllers
{
    public class FotosController : ApiController
    {

        [HttpGet]
        [Route("api/GetFotos")]
        public HttpResponseMessage GetFotos(int IdPropiedad)
        {
            using (var db = new TecEntities())
            {

                var listaFotos = db.Database.SqlQuery<string>("SELECT Ruta" +
                    " FROM FOTOS WHERE IdPropiedad=" + IdPropiedad).ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaFotos);
            }
        }
    }
}

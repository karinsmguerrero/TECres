using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using web_api.Models;

namespace web_api.Controllers
{
    public class PerfilesController : ApiController
    {
        [HttpGet]
        [Route("api/GetPerfiles")]
        public HttpResponseMessage GetInmuebles()
        {
            using (var db = new TecEntities())
            {

                var listaPerfiles = db.Database.SqlQuery<PerfilCliente>("SELECT Nombre,Descripcion,Predeterminado" +
                    " FROM PERFIL_CLIENTE").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaPerfiles);
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using web_api.Models;

namespace web_api.Controllers
{
    public class AnuncioController : ApiController
    {
        /**
         * Metodo PUT
         * Aprueba anuncios
         * */
        [HttpPut]
        [Route("api/UpdateAnuncio")]
        public HttpResponseMessage aprobarAnuncio(int idAnuncio)
        {
            using (var db = new TecEntities())
            {
                var status = db.Database.ExecuteSqlCommand("UPDATE ANUNCIO SET Estado =1" +
                "WHERE Id =" +idAnuncio);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }
    }
}

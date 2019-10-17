using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

        /* Metodo POST
         * Inserta una nueva Ocupacion
         * */
        [HttpPost]
        [Route("api/PostFoto")]
        public HttpResponseMessage InsertartFoto([FromBody] FotosAux foto)
        {
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]{
                new SqlParameter("@propiedad", foto.IdPropiedad),
                new SqlParameter("@ruta", foto.Ruta)

            };

                var status = db.Database.ExecuteSqlCommand("INSERT INTO FOTOS(IdPropiedad, Ruta)" +
                "VALUES (@propiedad, @ruta)", parameters);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }
    }

}

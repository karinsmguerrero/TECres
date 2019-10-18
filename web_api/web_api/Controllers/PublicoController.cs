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
    public class PublicoController : ApiController
    {
        /**
         * Metodo GET
         * Obtener Publlico
         * */
        [HttpGet]
        [Route("api/GetPublico")]
        public HttpResponseMessage GetPublico(int id)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@id", id);
                var pub = db.Database.SqlQuery<Publico>("SELECT * FROM PUBLICO WHERE Id=@id",parameter).FirstOrDefault();
                return this.Request.CreateResponse(HttpStatusCode.OK, pub);
            }
        }

        [HttpDelete]
        [Route("api/DeletePublico")]
        public HttpResponseMessage DeletePublico(int id)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@id", id);
                var status = db.Database.ExecuteSqlCommand("DELETE FROM PUBLICO " +
                "WHERE Id = @id", parameter);
                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpPut]
        [Route("api/PutPublico")]
        public HttpResponseMessage PutPublico([FromBody] Publico p)
        {
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@id", p.Id),
                    new SqlParameter("@edF", p.EdadFinal),
                    new SqlParameter("@edIn", p.EdadInicial),
                    new SqlParameter("@ingIn", p.IngresoInicial),
                    new SqlParameter("@ingF", p.IngresoFinal),
                    new SqlParameter("@sexo", p.Sexo)

                };
                var status = db.Database.ExecuteSqlCommand("UPDATE PUBLICO SET EdadInicial = @edIn, EdadFinal=@edF," +
                    "IngresoInicial=@ingIn, IngresoFinal=@ingF, Sexo=@sexo " +
                "WHERE Id = @id", parameters);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }
    }
}

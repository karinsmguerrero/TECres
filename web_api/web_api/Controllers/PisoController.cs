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

        /**
         * Metodo POST
         * Inserta un nuevo tipo de inmueble
         * */
        [HttpPost]
        [Route("api/PostPiso")]
        public HttpResponseMessage InsertartPiso(string tipoPiso)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@tipoPiso", tipoPiso);

                var status = db.Database.ExecuteSqlCommand("INSERT INTO TIPO_PISO (Piso)" +
                " VALUES (@tipoPiso)", parameter);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        /**
         * Metodo PUT
         * Actualiza  tipo de inmueble
         * */
        [HttpPut]
        [Route("api/PutPiso")]
        public HttpResponseMessage PutPiso([FromBody] TipoPiso piso)
        {
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@id", piso.Id),
                    new SqlParameter("@tipo", piso.Piso)
                };
                var status = db.Database.ExecuteSqlCommand("UPDATE TIPO_PISO SET Piso = @tipo " +
                "WHERE Id = @id", parameters);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }
        [HttpDelete]
        [Route("api/DeleteInmueble")]
        public HttpResponseMessage DeletePiso(int Id)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@id", Id);
                var status = db.Database.ExecuteSqlCommand("DELETE FROM TIPO_PISO " +
                "WHERE Id = @id", parameter);
                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }




    }
}

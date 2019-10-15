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
    public class InmuebleController : ApiController
    {
        [HttpGet]
        [Route("api/GetInmuebles")]
        public HttpResponseMessage GetInmuebles()
        {
            using (var db = new TecEntities())
            {

                var listaInmuebles = db.Database.SqlQuery<Inmueble>("SELECT Id,TipoPropiedad,Predeterminado" +
                    " FROM INMUEBLE").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaInmuebles);
            }
        }

        /**
         * Metodo POST
         * Inserta un nuevo tipo de inmueble
         * */
        [HttpPost]
        [Route("api/PostInmueble")]
        public HttpResponseMessage InsertartInmueble([FromBody] Inmueble_aux inmueble)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@inmueble", inmueble.TipoPropiedad);
                  
                var status = db.Database.ExecuteSqlCommand("INSERT INTO INMUEBLE(TipoPropiedad)"+
                "VALUES (@inmueble)",parameter);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        /**
         * Metodo PUT
         * Inserta un nuevo tipo de inmueble
         * */
        [HttpPut]
        [Route("api/PutInmueble")]
        public HttpResponseMessage PutInmueble([FromBody] InmuebleUp inmueble)
        {
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@id", inmueble.Id),
                    new SqlParameter("@newValue", inmueble.NewValue)
                };
                var status = db.Database.ExecuteSqlCommand("UPDATE INMUEBLE SET TipoPropiedad = @newValue "+
                "WHERE Id = @id" , parameters);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }
        [HttpDelete]
        [Route("api/DeleteInmueble")]
        public HttpResponseMessage DeleteInmueble(int Id)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@id", Id);
                var status = db.Database.ExecuteSqlCommand("DELETE FROM INMUEBLE " +
                "WHERE Id = @id", parameter);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }
        

    }
}

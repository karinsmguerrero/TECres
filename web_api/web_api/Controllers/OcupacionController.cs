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
    public class OcupacionController : ApiController
    {
        [HttpGet]
        [Route("api/GetOcupaciones")]
        public HttpResponseMessage GetOcupaciones()
        {
            using (var db = new TecEntities())
            {

                var listaOcupaciones = db.Database.SqlQuery<Ocupacion>("SELECT Id,Nombre" +
                    " FROM OCUPACION").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaOcupaciones);
            }
        }
          
        /* Metodo POST
         * Inserta una nueva Ocupacion
         * */
        [HttpPost]
        [Route("api/PostOcupacion")]
        public HttpResponseMessage InsertartOcupacion(string ocupacion)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@ocupacion", ocupacion);

                var status = db.Database.ExecuteSqlCommand("INSERT INTO OCUPACION(Nombre)" +
                "VALUES (@ocupacion)", parameter);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        /**
         * Metodo PUT
         * Actualizala ocupacion
         * */
        [HttpPut]
        [Route("api/PutOcupacion")]
        public HttpResponseMessage PutOcupacion( String Ocupacion)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@nombre", Ocupacion);
                var status = db.Database.ExecuteSqlCommand("UPDATE OCUPACION SET Nombre = @nombre " +
                "WHERE Id = @id", parameter);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpDelete]
        [Route("api/DeleteOcupacion")]
        public HttpResponseMessage DeleteInmueble(int Id)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@id", Id);
                var status = db.Database.ExecuteSqlCommand("DELETE FROM OCUPACION " +
                "WHERE Id = @id", parameter);
                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }



    }
}

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
    public class UbicacionController : ApiController
    {
        [HttpGet]
        [Route("api/GetUbicaciones")]
        public HttpResponseMessage GetClientes()
        {
            using (var db = new TecEntities())
            {

                var listaUbicaciones = db.Database.SqlQuery<UBICACION>("SELECT Id, Provincia,Canton,Distrito" +
                    " FROM UBICACION").ToList();
                
                return this.Request.CreateResponse(HttpStatusCode.OK, listaUbicaciones);
            }
        }


        [HttpGet]
        [Route("api/GetProvincia")]
        public HttpResponseMessage GetProvincia()
        {
            using (var db = new TecEntities())
            {

                var listaProvincias = db.Database.SqlQuery<String>("SELECT DISTINCT Provincia FROM UBICACION").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaProvincias);
            }
        }

        [HttpGet]
        [Route("api/GetCanton")]
        public HttpResponseMessage GetCanton(string provincia)
        {
            using (var db = new TecEntities())
            {

                var listaProvincias = db.Database.SqlQuery<String>("SELECT DISTINCT Canton" +
                    " FROM UBICACION WHERE Provincia='" + provincia + "'").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaProvincias);
            }
        }

        [HttpGet]
        [Route("api/GetDistrito")]
        public HttpResponseMessage GetDistrito(string provincia,string canton)
        {
            using (var db = new TecEntities())
            {

                var listaProvincias = db.Database.SqlQuery<String>("SELECT Distrito" +
                    " FROM UBICACION WHERE Provincia='" + provincia + "' AND Canton='" + canton + "'").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaProvincias);
            }
        }


        /**
        * Metodo POST
        * Inserta un nuevo tipo de inmueble
        * */
        [HttpPost]
        [Route("api/PostUbicacion")]
        public HttpResponseMessage InsertartInmueble([FromBody] Ubicacion_aux ubicacion)
        {
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@provincia", ubicacion.Provincia),
                new SqlParameter("@canton", ubicacion.Canton),
                new SqlParameter("@distrito", ubicacion.Distrito),
                };
                var status = db.Database.ExecuteSqlCommand("INSERT INTO UBICACION(Provincia,Canton,Distrito)" +
                "VALUES (@provincia,@canton,@distrito)", parameters);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }


        /**
         * Metodo PUT
         * Inserta un nuevo tipo de Ubicacion
         * */
        [HttpPut]
        [Route("api/PutUbicacion")]
        public HttpResponseMessage PutInmueble([FromBody] UBICACION ubicacion)
        {
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@id", ubicacion.Id),
                    new SqlParameter("@newProvincia", ubicacion.Provincia),
                    new SqlParameter("@newCanton", ubicacion.Canton),
                    new SqlParameter("@newDistrito", ubicacion.Distrito)
                };
                var status = db.Database.ExecuteSqlCommand("UPDATE UBICACION SET Provincia = @newProvincia," +
                "Canton=@newCanton, Distrito=@newDistrito WHERE Id = @id", parameters);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        /**
         * Metodo DELETE ELIMINAR UBICACIONES
         * */
        [HttpDelete]
        [Route("api/DeleteUbicacion")]
        public HttpResponseMessage DeleteInmueble(int Id)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@id", Id);
                var status = db.Database.ExecuteSqlCommand("DELETE FROM UBICACION " +
                "WHERE Id = @id", parameter);
                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }





    }


}

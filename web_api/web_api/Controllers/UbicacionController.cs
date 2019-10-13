using System;
using System.Collections.Generic;
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

    }
}

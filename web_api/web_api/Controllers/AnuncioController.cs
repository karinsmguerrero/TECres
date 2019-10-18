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
    public class AnuncioController : ApiController
    {
        /**
         * Metodo PUT
         * Aprueba anuncios
         * */
        [HttpPut]
        [Route("api/AprobarAnuncio")]
        public HttpResponseMessage AprobarAnuncio(int idAnuncio)
        {
            using (var db = new TecEntities())
            {
                var status = db.Database.ExecuteSqlCommand("UPDATE ANUNCIO SET Estado =1" +
                "WHERE Id =" +idAnuncio);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        /**
         * Metodo GET
         * Obtener anuncios
         * */
        [HttpGet]
        [Route("api/GetAnuncios")]
        public HttpResponseMessage GetAnuncios()
        {
            using (var db = new TecEntities())
            {
                var list = db.Database.SqlQuery<Anuncio>("SELECT * FROM ANUNCIO").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, list);
            }
        }

        [HttpDelete]
        [Route("api/DeleteAnuncio")]
        public HttpResponseMessage DeleteAnuncio(int Id)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@id", Id);
                var status = db.Database.ExecuteSqlCommand("DELETE FROM ANUNCIO " +
                "WHERE Id = @id", parameter);
                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }


        [HttpPut]
        [Route("api/PutAnuncio")]
        public HttpResponseMessage PutAnuncio(Anuncio a)
        {
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]
                    {
                        new SqlParameter("@idAgente", a.IdAgente),new SqlParameter("@tarjeta", a.Tarjeta),
                        new SqlParameter("@tipoAnuncio", a.TipoAnuncio), new SqlParameter("@propiedad", a.IdPropiedad),
                        new SqlParameter("@venta", a.Venta), new SqlParameter("@fechaIn", a.FechaInicial),
                        new SqlParameter("@fechaFin", a.FechaFinal),new SqlParameter("@idAnun", a.Id)

                    };
                
                var status = db.Database.ExecuteSqlCommand("UPDATE ANUNCIO SET IdAgente=@idAgente, Tarjeta=@tarjeta," +
                    "TipoAnuncio=@tipoAnuncio, IdPropiedad=@propiedad, Venta=@venta, FechaInicial=@FechaInicial, FechaFinal=@fechaFin " +
                "WHERE Id = @idAnun", parameters);
                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }


    }
}

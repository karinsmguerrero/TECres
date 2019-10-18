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

    public class MensajeController : ApiController
    {
        [HttpGet]
        [Route("api/GetMensajes")]
        public HttpResponseMessage GetMensajes([FromBody] MensajeU mensaje)
        {
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]
                    {
                        new SqlParameter("@idAnuncio", mensaje.IdAnuncio),new SqlParameter("@receptor", mensaje.Receptor),
                        new SqlParameter("@emisor", mensaje.Emisor)


                    };

                var listaMensajes = db.Database.SqlQuery<Mensaje>("EXEC getMensajes @idAnuncio,@emisor,@receptor" ,parameters).ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaMensajes);
            }
        }

        [HttpPost]
        [Route("api/PostMensaje")]
        public HttpResponseMessage PostMensaje([FromBody] Mensaje mensaje)
        {
            
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]
                    {
                        new SqlParameter("@idAnuncio", mensaje.IdAnuncio),new SqlParameter("@receptor", mensaje.Receptor),
                        new SqlParameter("@emisor", mensaje.Emisor),new SqlParameter("@fecha", mensaje.Fecha),
                        new SqlParameter("@texto", mensaje.Texto),new SqlParameter("@hora", mensaje.Hora)


                    };

                var status = db.Database.ExecuteSqlCommand("INSERT INTO MENSAJE (IdAnuncio,Emisor,Receptor,Hora,Fecha) " +
                    "VALUES(@idAnuncio,@emisor,@receptor,@hora,@fecha)", parameters);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpPost]
        [Route("api/PutMensaje")]
        public HttpResponseMessage UpdateStatus(int idMensaje)
        {

            using (var db = new TecEntities())
            {
              
                var status = db.Database.ExecuteSqlCommand("UPDATE MENSAJE SET Estado=1 WHERE Id="+ idMensaje);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }


    }
}

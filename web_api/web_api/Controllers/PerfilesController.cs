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
    public class PerfilesController : ApiController
    {
        [HttpGet]
        [Route("api/GetPerfiles")]
        public HttpResponseMessage GetPerfiles()
        {
            using (var db = new TecEntities())
            {

                var listaPerfiles = db.Database.SqlQuery<PerfilCliente>("SELECT Nombre,Descripcion,Predeterminado" +
                    " FROM PERFIL_CLIENTE").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaPerfiles);
            }
        }




        /**
         * Metodo POST
         * Inserta un nuevo tipo de Perfil
         * */
        [HttpPost]
        [Route("api/PostPerfil")]
        public HttpResponseMessage InsertartPerfil([FromBody] Perfil perfil)
        {
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]{
                new SqlParameter("@nombre", perfil.Nombre),
                new SqlParameter("@descripcion", perfil.Descripcion)
            };

                var status = db.Database.ExecuteSqlCommand("INSERT INTO PERFIL_CLIENTE(Nombre,Descripciom)" +
                "VALUES (@nombre,@descripcion)", parameters);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        /**
         * Metodo PUT
         * Actualiza  tipo de inmueble
         * */
        [HttpPut]
        [Route("api/PutPerfil")]
        public HttpResponseMessage PutPerfil([FromBody] Perfil perfil)
        {
            using (var db = new TecEntities())
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@nombre", perfil.Nombre),
                    new SqlParameter("@desc", perfil.Descripcion)
                };
                var status = db.Database.ExecuteSqlCommand("UPDATE PERFIL_CLIENTE SET Nombre = @nombre, Descripcion=@desc " +
                "WHERE Nombre = @nombre", parameters);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }
        [HttpDelete]
        [Route("api/DeletePerfil")]
        public HttpResponseMessage DeletePerfil(string perfil)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@perfil", perfil);
                var status = db.Database.ExecuteSqlCommand("DELETE FROM PERFIL_CLIENTE " +
                "WHERE Nombre = @perfil", parameter);
                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

    }
}

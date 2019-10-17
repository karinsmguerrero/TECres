using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Microsoft.AspNetCore.Cors;
using web_api.Models;

namespace web_api.Controllers
{
    public class ClienteController : ApiController
    {
        
        [HttpGet]
        [Route("api/GetClientes")]
        public HttpResponseMessage GetClientes5()
        {
            using (var db = new TecEntities())
            {

                var clientList = db.Database.SqlQuery<Cliente>("SELECT Username,Nombre,PrimerApellido,SegundoApellido," +
                    "Cedula,PerfilCliente,Nacionalidad" +
                    " FROM vCLIENTES").ToList();

                Console.WriteLine(clientList);
                return this.Request.CreateResponse(HttpStatusCode.OK, clientList);
            }
        }

        [HttpPost]
        [Route("api/AddCliente")]
        public HttpResponseMessage AddCliente([FromBody] ClienteU c)
        {
            try
            {
                  
                using (var db = new TecEntities())
                {
                    SqlParameter[] parameters = new SqlParameter[]
                    {
                        new SqlParameter("@username", c.Username),new SqlParameter("@contrasena", c.Contrasena),
                        new SqlParameter("@nombre", c.Nombre), new SqlParameter("@pApellido", c.PrimerApellido),
                        new SqlParameter("@sApellido", c.SegundoApellido), new SqlParameter("@fecha", "2017-02-08"),
                        new SqlParameter("@nacionalidad", c.Nacionalidad), new SqlParameter("@cedula", c.Cedula),
                        new SqlParameter("@perfil", c.PerfilCliente),new SqlParameter("@correo", c.Correo)


                    };

                    var status = db.Database.ExecuteSqlCommand("EXEC NuevoCliente @username, @contrasena," +
                        "@correo, @nombre, @pApellido, @sApellido, @fecha, @nacionalidad, @cedula, " +
                        "@perfil", parameters);

                    return this.Request.CreateResponse(HttpStatusCode.OK, status);
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine("ERROR :" + ex);
                return this.Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }

        }



        [HttpPost]
        [Route("api/PostCliente")]
        [AllowAnonymous]
        [EnableCors]
        public HttpResponseMessage PostCliente()
        {
            try
            {

                using (var db = new TecEntities())
                {


                    var status = db.Database.ExecuteSqlCommand("EXEC NuevoCliente 'gfhf','Jose','Padilla','Ramirez','2017-03-28','CR',31759056,'Agente'");
                    

                    return this.Request.CreateResponse(HttpStatusCode.OK, status);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("ERROR :" + ex);
                return this.Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }

        }
    }
}

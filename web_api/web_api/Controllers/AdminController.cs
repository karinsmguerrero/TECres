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
    public class AdminController : ApiController
    {
        [HttpGet]
        [Route("api/GetAdmin")]
        public HttpResponseMessage GetAdmins()
        {
            using (var db = new TecEntities())
            {

                var adminList = db.Database.SqlQuery<AdministradorAux>("SELECT Nombre,Username,Cedula" +
                " FROM vADMINISTRADORES").ToList();

                Console.WriteLine(adminList);
                return this.Request.CreateResponse(HttpStatusCode.OK, adminList);
            }
        }

        [HttpPost]
        [Route("api/AddAdmin")]
        public HttpResponseMessage AddAdministrador([FromBody] Administrador a)
        {
            try
            {

                using (var db = new TecEntities())
                {
                    SqlParameter[] parameters = new SqlParameter[]
                    {
                        new SqlParameter("@username", a.Username),new SqlParameter("@contrasena", a.Contrasena),
                        new SqlParameter("@nombre", a.Nombre), new SqlParameter("@pApellido", a.PrimerApellido),
                        new SqlParameter("@sApellido", a.SegundoApellido), new SqlParameter("@fecha", a.FechaIngreso),
                        new SqlParameter("@cedula", a.Cedula),
                        new SqlParameter("@correo", a.Correo)


                    };

                    var status = db.Database.ExecuteSqlCommand("EXEC NuevoAdministrador @username, @contrasena," +
                        "@correo, @nombre, @pApellido, @sApellido, @fecha, @cedula ", parameters);

                    return this.Request.CreateResponse(HttpStatusCode.OK, status);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("ERROR :" + ex);
                return this.Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }

        }


        [HttpDelete]
        [Route("api/DeleteAdmin")]
        public HttpResponseMessage DeleteAdmin(string username)
        {
            using (var db = new TecEntities())
            {
                SqlParameter parameter = new SqlParameter("@user", username);
                var status = db.Database.ExecuteSqlCommand("DELETE FROM ADMINISTRADOR " +
                "WHERE Username = @user", parameter);
                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }


        [HttpPost]
        [Route("api/PutAdmin")]
        public HttpResponseMessage PutAdministrador([FromBody] Administrador a)
        {
            try
            {

                using (var db = new TecEntities())
                {
                    SqlParameter[] parameters = new SqlParameter[]
                    {
                        new SqlParameter("@username", a.Username),new SqlParameter("@contrasena", a.Contrasena),
                        new SqlParameter("@nombre", a.Nombre), new SqlParameter("@pApellido", a.PrimerApellido),
                        new SqlParameter("@sApellido", a.SegundoApellido), new SqlParameter("@fecha", a.FechaIngreso),
                        new SqlParameter("@cedula", a.Cedula),
                        new SqlParameter("@correo", a.Correo)


                    };

                    var status = db.Database.ExecuteSqlCommand("EXEC ActualizarAdministrador @username, @contrasena," +
                        "@correo, @nombre, @pApellido, @sApellido, @fecha, @cedula ", parameters);

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

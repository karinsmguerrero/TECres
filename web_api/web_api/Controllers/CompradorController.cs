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
    public class CompradorController : ApiController
    {
        
        [HttpGet]
        [Route("api/GetCompradores")]
        public HttpResponseMessage GetClientes5()
        {
            using (var db = new TecEntities())
            {

                var list = db.Database.SqlQuery<CompradorU>("SELECT Username,Nombre,Sexo,Provincia,Canton," +
                    "Distrito,FechaNacimiento,Ocupacion,IngresoMensual" +
                    " FROM vCOMPRADORES").ToList();

                Console.WriteLine(list);
                return this.Request.CreateResponse(HttpStatusCode.OK, list);
            }
        }
        
        [HttpPost]
        [Route("api/AddCliente")]
        public HttpResponseMessage AddCliente([FromBody] Comprador c)
        {
            try
            {


                using (var db = new TecEntities())
                {
                    SqlParameter[] parameters = new SqlParameter[]
                    {
                        new SqlParameter("@username", c.Username),new SqlParameter("@contrasena", c.Contrasena),
                        new SqlParameter("@nombre", c.Nombre), new SqlParameter("@pApellido", c.PrimerApellido),
                        new SqlParameter("@sApellido", c.SegundoApellido), new SqlParameter("@fecha", c.FechaIngreso),
                        new SqlParameter("@ocupacion", c.IdOcupacion), new SqlParameter("@cedula", c.Cedula),
                        new SqlParameter("@perfil", c.Sexo),new SqlParameter("@correo", c.Correo),new SqlParameter("@domicilio", c.Domicilio),
                        new SqlParameter("@nacimiento", c.FechaNacimiento),new SqlParameter("@mensualidad", c.IngresoMensual)
                    };

                    var status = db.Database.ExecuteSqlCommand("EXEC NuevoComprador @username, @contrasena," +
                        "@correo, @nombre, @pApellido, @sApellido, @fecha, @cedula, @ocupacion," +
                        "@mensualidad, @domicilio, @sexo, @nacimiento", parameters);

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

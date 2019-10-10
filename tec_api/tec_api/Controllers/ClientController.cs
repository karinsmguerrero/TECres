using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using tec_api.Models;

namespace tec_api.Controllers
{
    public class ClientController : ApiController
    {

        private TecEntities db = new TecEntities();

        [HttpGet]
        [Route("api/GetClients")]
        [AllowAnonymous]
        public HttpResponseMessage GetClients()
        {


            var clientList = db.Database.SqlQuery<Client>("SELECT Username,Nombre,PrimerApellido,SegundoApellido," +
                "Cedula,PerfilCliente,Nacionalidad" +
                " FROM LISTA_CLIENTES").ToList();

            Console.WriteLine(clientList);
            return this.Request.CreateResponse(HttpStatusCode.OK, clientList);
        }


        [HttpPut]
        [Route("api/AddClient")]
        [AllowAnonymous]
        public HttpResponseMessage AddClient(string username, string nombre, 
            string pApellido, string sApellido, string fecha, string nacionalidad, int cedula,string perfil)
        {

            var status = db.Database.ExecuteSqlCommand("EXCEC RegistrarCliente @username,@nombre,@pApellido," +
                "@sApellido,@fecha,@nacionalidad,@cedula,@perfil",new SqlParameter("username", username),
                new SqlParameter("nombre", nombre), new SqlParameter("pApellido", pApellido),
                new SqlParameter("sApellido", sApellido), new SqlParameter("fecha", fecha),
                new SqlParameter("nacionalidad", nacionalidad), new SqlParameter("cedula", cedula),
                new SqlParameter("perfil", perfil)
                );
            
      
            return this.Request.CreateResponse(HttpStatusCode.OK, status);
        }

    }
}

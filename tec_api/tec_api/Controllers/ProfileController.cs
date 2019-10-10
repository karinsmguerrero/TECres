using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using tec_api.Models;

namespace tec_api.Controllers
{
    public class ProfileController : ApiController
    {
        private TecEntities db = new TecEntities();
        //Metodo GET obtener lista perfiles
        [HttpGet]
        [Route("api/GetProfiles")]
        [AllowAnonymous]
        public HttpResponseMessage GetProfiles()
        {


            var profileList = db.Database.SqlQuery<Profile>("SELECT Nombre,Descripcion" +
                " FROM PERFIL_CLIENTE").ToList();

            Console.WriteLine(profileList);
            return this.Request.CreateResponse(HttpStatusCode.OK, profileList);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using tec_api.Models;

namespace tec_api.Controllers
{
    public class EstateController : ApiController
    {
        private TecEntities db = new TecEntities();
        //Metodo lista de tipo de inmuebles
        [HttpGet]
        [Route("api/GetEstates")]
        [AllowAnonymous]
        public HttpResponseMessage GetProfiles()
        {


            var estateList = db.Database.SqlQuery<Profile>("SELECT Id,TipoPropiedad" +
                " FROM INMUEBLE").ToList();

            Console.WriteLine(estateList);
            return this.Request.CreateResponse(HttpStatusCode.OK, estateList);
        }
    }
}

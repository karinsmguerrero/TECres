using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using tec_api.Models;

namespace tec_api.Controllers
{
    public class LocationController : ApiController
    {
        private TecEntities db = new TecEntities();
        [HttpGet]
        [Route("api/GetLocations")]
        [AllowAnonymous]
        public HttpResponseMessage GetLocations()
        {


            var locationList = db.Database.SqlQuery<Location>("SELECT Id, Provincia,Canton,Distrito"
                +" FROM UBICACION").ToList();

            
            return this.Request.CreateResponse(HttpStatusCode.OK, locationList);
        }
    }
}

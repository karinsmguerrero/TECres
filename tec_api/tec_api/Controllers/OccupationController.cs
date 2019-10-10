using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using tec_api.Models;

namespace tec_api.Controllers
{
    public class OccupationController : ApiController
    {
        private TecEntities db = new TecEntities();


        //Metdodo GET:Obtener lista de ocupaciones
        [HttpGet]
        [Route("api/GetOccupations")]
        [AllowAnonymous]
        public HttpResponseMessage GetOccupations()
        {


            var occupationList = db.Database.SqlQuery<Occupation>("SELECT Id,Nombre" +
                " FROM OCUPACION").ToList();
            
            return this.Request.CreateResponse(HttpStatusCode.OK, occupationList);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using tec_api.Models;

namespace tec_api.Controllers
{
    public class NationalityController : ApiController
    {
        private TecEntities db = new TecEntities();

        [HttpGet]
        [Route("api/GetNationalities")]
        [AllowAnonymous]
        public HttpResponseMessage GetNationalities()
        {


            var nationalityList = db.Database.SqlQuery<Nationality>("SELECT Id,Nacionalidad"+
                " FROM NACIONALIDAD").ToList();

            Console.WriteLine(nationalityList);
            return this.Request.CreateResponse(HttpStatusCode.OK, nationalityList);
        }
    }
}

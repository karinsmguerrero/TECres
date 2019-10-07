using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using TECres_api.Reports.CrystalReports;

namespace TECres_api.Controllers
{
    public class ReportsController : ApiController
    {
        [AllowAnonymous]
        [Route("api/getfile")]
        public HttpResponseMessage GetTestFile()
        {
            HttpResponseMessage result = null;
            var localFilePath = HttpContext.Current.Server.MapPath("~/timetable.jpg");

            if (!File.Exists(localFilePath))
            {
                result = Request.CreateResponse(HttpStatusCode.Gone);
            }
            else
            {
                // Serve the file to the client
                result = Request.CreateResponse(HttpStatusCode.OK);
                result.Content = new StreamContent(new FileStream(localFilePath, FileMode.Open, FileAccess.Read));
                result.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment");
                result.Content.Headers.ContentDisposition.FileName = "SampleImg";
            }

            return result;
        }

        [AllowAnonymous]
        [Route("api/getfile2")]
        [HttpGet]
        public HttpResponseMessage GetTestFile2()
        {

            //ReportDocument rd = new ReportDocument();
            //rd.Load(Server.MapPath("CrystalReport.rpt"));
            ReportDocument rd = new ReportDocument();
            rd.Load(System.Web.Hosting.HostingEnvironment.MapPath("~/Reports/CrystalReports/crpNacionalidad.rpt"));
            try
            {
                HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);

                response.Content = new StreamContent(rd.ExportToStream(ExportFormatType.PortableDocFormat));
                response.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment");
                response.Content.Headers.ContentDisposition.FileName = "report.pdf";

                return response;
            }
            catch (Exception)
            {
                //return string.Empty;
                throw;
            }

        }



    }
}

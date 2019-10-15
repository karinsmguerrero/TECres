using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Http;
//using System.Web.Services.Protocols;

namespace web_api.Controllers
{
    public class ReportsController : ApiController
    {
        /*
        [AllowAnonymous]
        [HttpGet]
        [Route("api/getAdvertisementReport")]
        public HttpResponseMessage GetAdvertisementReport()
        {
            ReportExecutionService rs = new ReportExecutionService();
            rs.Credentials = CredentialCache.DefaultCredentials;
            rs.Url = "http://desktop-nsa2cvd/reportserver/reportexecution2005.asmx";
            rs.ExecutionHeaderValue = new ExecutionHeader();
            var executionInfo = new ExecutionInfo();
            executionInfo = rs.LoadReport("/TECresReport/Report", null);

            string deviceInfo = "<DeviceInfo><Toolbar>False</Toolbar></DeviceInfo>";
            string mimeType;
            string encoding;
            string[] streamId;
            Warning[] warning;

            var result = rs.Render("PDF", deviceInfo, out mimeType, out encoding, out encoding, out warning, out streamId);
            //File.WriteAllBytes(@"D:\\Files\file.pdf", result);
            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            response.Content = new ByteArrayContent(result);
            response.Content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");

            return response;
        }*/
    }
}

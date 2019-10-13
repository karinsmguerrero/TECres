using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
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
using System.Web.Services.Protocols;
using TECres_api.ReportingServicesLocalServer;
using TECres_api.Reports.CrystalReports;
using ParameterValue = TECres_api.ReportingServicesLocalServer.ParameterValue;

namespace TECres_api.Controllers
{
    public class ReportsController : ApiController
    {
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
        }

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
            string strgCn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection cn = new SqlConnection(strgCn);
            SqlCommand cmd = new SqlCommand("SELECT Id,Nacionalidad FROM NACIONALIDAD", cn);
            cn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dset = new DataSet();
            adapter.Fill(dset);
            cn.Close();

            ConnectionInfo connectionInfo = new ConnectionInfo();
            connectionInfo.ServerName = "localhost/SQLEXPRESS";
            connectionInfo.DatabaseName = "TECres";
            connectionInfo.UserID = "Admin";
            connectionInfo.Password = "karina";

            ReportDocument rd = new ReportDocument();

            rd.Load(System.Web.Hosting.HostingEnvironment.MapPath("~/Reports/CrystalReports/CrystalReport1.rpt"));
            rd.SetDatabaseLogon("Admin", "karina", "localhost/SQLEXPRESS", "TECres");
            // set report connection for main report
            SetDBLogonForReport(connectionInfo, rd);

            rd.Database.Tables["NACIONALIDAD"].SetDataSource(dset);

            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            Stream strm = rd.ExportToStream(ExportFormatType.PortableDocFormat);
            response.Content = new StreamContent(strm);
            response.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment");
            response.Content.Headers.ContentDisposition.FileName = "report.pdf";

            return response;
        }

        private void SetDBLogonForReport(CrystalDecisions.Shared.ConnectionInfo connectionInfo, ReportDocument reportDocument)
        {

            Tables tables = reportDocument.Database.Tables;
            foreach (CrystalDecisions.CrystalReports.Engine.Table table in tables)
            {
                TableLogOnInfo tableLogonInfo = table.LogOnInfo;
                tableLogonInfo.ConnectionInfo = connectionInfo;
                table.ApplyLogOnInfo(tableLogonInfo);
            }
        }

        [AllowAnonymous]
        [Route("api/getpdf")]
        [HttpGet]
        //Codigo tomado de: https://www.craftedforeveryone.com/download-sql-server-reporting-service-ssrs-report-as-pdf-using-c-sharp/
        public void SSRS()
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
            File.WriteAllBytes(@"D:\\Files\file.pdf", result);

        }
    }
}

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
            string strgCn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection cn = new SqlConnection(strgCn);
            SqlCommand cmd = new SqlCommand("SELECT Id,Nacionalidad FROM NACIONALIDAD", cn);
            cn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dset = new DataSet();
            adapter.Fill(dset);
            cn.Close();

            ReportDocument rd = new ReportDocument();
            rd.Load(System.Web.Hosting.HostingEnvironment.MapPath("~/Reports/CrystalReports/CrystalReport1.rpt"));
            
            ConnectionInfo connectInfo = new ConnectionInfo()
            {
                ServerName = "LAPTOP-J3QU9F5B/SQLEXPRESS",
                DatabaseName = "TECres",
                UserID = "Admin",
                Password = "Karina"
            };
            rd.SetDatabaseLogon("Admin", "karina");
            foreach (Table tbl in rd.Database.Tables)
            {
                tbl.LogOnInfo.ConnectionInfo = connectInfo;
                tbl.ApplyLogOnInfo(tbl.LogOnInfo);
            }
            rd.Database.Tables["NACIONALIDAD"].SetDataSource(dset);

            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            Stream strm = rd.ExportToStream(ExportFormatType.PortableDocFormat);
            response.Content = new StreamContent(strm);
            response.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment");
            response.Content.Headers.ContentDisposition.FileName = "report.pdf";

            return response;


            /*
            rd.Load(System.Web.Hosting.HostingEnvironment.MapPath("~/Reports/CrystalReports/crpNacionalidad.rpt"));
            rd.SetDatabaseLogon("Admin", "karina", @"LAPTOP-J3QU9F5B\SQLEXPRESS", "TECres");
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
            }*/

        }



    }
}

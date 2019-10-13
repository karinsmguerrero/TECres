using System;
using System.Web;
using System.Configuration;
using System.Web.Mvc;
using TECres_api.ReportingServicesLocalServer;

namespace NunoSolutions
{
    public class Report
    {
        public TECres_api.ReportingServicesLocalServer.ParameterValue[] ExportParameters { get; set; }
        public string ReportFormat { get; set; } = "Excel";
        public string ReportTitle { get; set; }
        public string ReportServerUrl { get; set; } = ReportHelper.ReportServerURL;
        public string ReportPath { get; set; }
        public string ReportID { get; set; }
    }

    public class ReportHelper
    {
        public static string ReportServerURL = ConfigurationManager.AppSettings["ReportServerUrl"];
        private static string UserName = ConfigurationManager.AppSettings["UserName"];
        private static string Password = ConfigurationManager.AppSettings["Password"];
        private static string Domain = ConfigurationManager.AppSettings["Domain"];

        public static System.Net.NetworkCredential NetworkCredentials
        {
            get
            {
                return new System.Net.NetworkCredential(UserName, Password, Domain);
            }
        }

        /// <summary>
        /// This method does the actual work to fetch the byte array data that makes up the report file.
        /// </summary>
        /// <param name="report"></param>
        /// <param name="timeOutSecs"></param>
        /// <returns></returns>
        private static byte[] ExportReportBytes(Report report, int timeOutSecs)
        {
            byte[] result = null;

            TECres_api.ReportingServicesLocalServer.ReportExecutionService rs = new TECres_api.ReportingServicesLocalServer.ReportExecutionService();
            rs.Url = report.ReportServerUrl + "/ReportExecution2005.asmx";
            rs.Credentials = ReportHelper.NetworkCredentials;
            if (timeOutSecs == -1)
            {
                rs.Timeout = timeOutSecs;
            }
            else
            {
                rs.Timeout = timeOutSecs * 1000;
            }
            string historyId = null;
            string devinfo = "<DeviceInfo><Toolbar>True</Toolbar></DeviceInfo>";
            string extension = "";
            string mimetype = "";
            string encoding = "";
            TECres_api.ReportingServicesLocalServer.Warning[] warnings = null;
            string[] streamid = null;
            TECres_api.ReportingServicesLocalServer.ExecutionHeader execHeader = new TECres_api.ReportingServicesLocalServer.ExecutionHeader();

            rs.ExecutionHeaderValue = execHeader;
            rs.LoadReport(report.ReportPath, historyId);
            if ((report.ExportParameters != null))
            {
                rs.SetExecutionParameters(report.ExportParameters, "en_us");
            }

            result = rs.Render(report.ReportFormat, devinfo, out extension, out mimetype, out encoding, out warnings, out streamid);

            HttpContext.Current.Response.Clear();
            switch (report.ReportFormat)
            {
                case "Excel":
                    HttpContext.Current.Response.ContentType = "application/x-msexcel";
                    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + report.ReportTitle + ".xls\"");
                    break;
                case "PDF":
                    HttpContext.Current.Response.ContentType = "application/pdf";
                    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + report.ReportTitle + ".pdf\"");
                    break;
                case "CSV":
                    HttpContext.Current.Response.ContentType = "text/plain";
                    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + report.ReportTitle + ".csv\"");
                    break;
                case "XML":
                    HttpContext.Current.Response.ContentType = "text/plain";
                    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + report.ReportTitle + ".xml\"");
                    break;
            }
            return result;
        }

        /// <summary>
        /// Use this method in ASP.NET Web Forms (e.g. Button_Click event) with defaults WS timeout of 15 minutes.
        /// </summary>
        /// <param name="report"></param>
        /// <remarks></remarks>
        public static void Export(Report report)
        {
            int timeOutSecs = 900; // default to 15 minutes just in case the report takes long to render.
            Export(report, timeOutSecs);
        }

        /// <summary>
        /// Use this method in ASP.NET Web Forms (e.g. Button_Click event)
        /// </summary>
        /// <param name="report"></param>
        /// <param name="timeOut">Timeout is in seconds, use -1 for infinite.</param>
        /// <remarks></remarks>
        public static void Export(Report report, int timeOutSecs)
        {
            try
            {
                byte[] result = ExportReportBytes(report, timeOutSecs);
                HttpContext.Current.Response.BinaryWrite(result);
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.End();
            }
            catch (System.Threading.ThreadAbortException)
            {
                // can't redirect if ThreadAbortException
            }
            catch (Exception ex)
            {
                //TODO: Handle Error
                throw ex;
            }
        }

        /// <summary>
        /// Use this method in ASP.NET MVC w/default WS timeout 15 minutes.
        /// </summary>
        /// <param name="report"></param>
        /// <param name="timeOutSecs"></param>
        /// <returns></returns>
        public static FileContentResult ExportMVC(Report report)
        {
            byte[] result = ExportReportBytes(report, 900);
            return new FileContentResult(result, HttpContext.Current.Response.ContentType);
        }

        /// <summary>
        /// Use this method in ASP.NET MVC.
        /// </summary>
        /// <param name="report"></param>
        /// <param name="timeOutSecs"></param>
        /// <returns></returns>
        public static FileContentResult ExportMVC(Report report, int timeOutSecs)
        {
            byte[] result = ExportReportBytes(report, timeOutSecs);
            return new FileContentResult(result, HttpContext.Current.Response.ContentType);
        }
    }

}

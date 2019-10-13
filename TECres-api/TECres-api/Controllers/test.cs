using System.Collections.Generic;
using System.IO;
using System.Net;
using TECres_api.ReportingServicesLocalServer;

namespace DownloadSSRSReport
{
    class Program
    {
        static void Main(string[] args)
        {
            ReportExecutionService rs = new ReportExecutionService();
            rs.Credentials = CredentialCache.DefaultCredentials;
            rs.Url = "http://desktop-nsa2cvd/reportserver/reportexecution2005.asmx";
            rs.LogonUser("Admin", "karina", null);

            rs.ExecutionHeaderValue = new ExecutionHeader();
            var executionInfo = new ExecutionInfo();
            executionInfo = rs.LoadReport("/ReportServer - /Proyecto de informe1/Report1", null);

            List<ParameterValue> parameters = new List<ParameterValue>();

            parameters.Add(new ParameterValue { Name = "parameterId", Value = "value" });

            rs.SetExecutionParameters(parameters.ToArray(), "en-US");


            string deviceInfo = "<DeviceInfo><Toolbar>False</Toolbar></DeviceInfo>";
            string mimeType;
            string encoding;
            string[] streamId;
            Warning[] warning;

            var result = rs.Render("PDF", deviceInfo, out mimeType, out encoding, out encoding, out warning, out streamId);
            File.WriteAllBytes("c:\\temp\\report.pdf", result);

        }
    }
}
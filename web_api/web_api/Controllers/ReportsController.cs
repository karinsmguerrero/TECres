using System;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Http;
using System.Web.Services.Protocols;
using web_api.Models;
using web_api.ReportingServicesReference;


namespace web_api.Controllers
{
    public class ReportsController : ApiController
    {
        /** -----------------------------------------------------------------------------------------------------------------
         * Objetivo: Descarga el reporte desde el SSRS y lo envia como bytes, además crear un archivo
         * PDF en disco con el contenido del reporte
         * Entrada: Ninguna
         * Salida: HttpResponde con un array de bytes
         * Código tomado de: https://stackoverflow.com/questions/30095445/save-ssrs-report-as-pdf-in-c-sharp-programmatically
         ---------------------------------------------------------------------------------------------------------------------*/
        [AllowAnonymous]
        [HttpGet]
        [Route("api/getAdvertisementReport")]
        public HttpResponseMessage GetAdvertisementReport()
        {
            ReportingServicesReference.ReportExecutionService rs = new ReportingServicesReference.ReportExecutionService();
            rs.Credentials = CredentialCache.DefaultCredentials;
            rs.Url = "http://desktop-nsa2cvd/reportserver/reportexecution2005.asmx";
            rs.ExecutionHeaderValue = new ReportingServicesReference.ExecutionHeader();
            var executionInfo = new ReportingServicesReference.ExecutionInfo();
            executionInfo = rs.LoadReport("/TECresReport/AdvertisementReport", null);

            string deviceInfo = "<DeviceInfo><Toolbar>False</Toolbar></DeviceInfo>";
            string mimeType;
            string encoding;
            string[] streamId;
            ReportingServicesReference.Warning[] warning;

            var result = rs.Render("PDF", deviceInfo, out mimeType, out encoding, out encoding, out warning, out streamId);
            File.WriteAllBytes(@"D:\TEC\2019\II semestre\Bases de datos\Proyectos\TECres\Site\TECres-site\src\assets\Files\AdvertisementReport.pdf", result);
            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            response.Content = new ByteArrayContent(result);
            response.Content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");

            return response;
        }

        /** -----------------------------------------------------------------------------------------------------------------
        * Objetivo: Descarga el reporte desde el SSRS y lo envia como bytes, además crear un archivo
        * PDF en disco con el contenido del reporte
        * Entrada: Ninguna
        * Salida: HttpResponde con un array de bytes
        * Código tomado de: https://stackoverflow.com/questions/30095445/save-ssrs-report-as-pdf-in-c-sharp-programmatically
        ---------------------------------------------------------------------------------------------------------------------*/
        [AllowAnonymous]
        [HttpGet]
        [Route("api/getCommissionReport")]
        public HttpResponseMessage GetCommissionReport()
        {
            ReportingServicesReference.ReportExecutionService rs = new ReportingServicesReference.ReportExecutionService();
            rs.Credentials = CredentialCache.DefaultCredentials;
            rs.Url = "http://desktop-nsa2cvd/reportserver/reportexecution2005.asmx";
            rs.ExecutionHeaderValue = new ReportingServicesReference.ExecutionHeader();
            var executionInfo = new ReportingServicesReference.ExecutionInfo();
            executionInfo = rs.LoadReport("/TECresReport/CommissionReport", null);

            string deviceInfo = "<DeviceInfo><Toolbar>False</Toolbar></DeviceInfo>";
            string mimeType;
            string encoding;
            string[] streamId;
            ReportingServicesReference.Warning[] warning;

            var result = rs.Render("PDF", deviceInfo, out mimeType, out encoding, out encoding, out warning, out streamId);
            File.WriteAllBytes(@"D:\TEC\2019\II semestre\Bases de datos\Proyectos\TECres\Site\TECres-site\src\assets\Files\CommissionReport.pdf", result);
            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            response.Content = new ByteArrayContent(result);
            response.Content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");

            return response;
        }

        /** -----------------------------------------------------------------------------------------------------------------
        * Objetivo: Descarga el reporte desde el SSRS y lo envia como bytes, además crear un archivo
        * PDF en disco con el contenido del reporte
        * Entrada: DateFilterModel -> clase definida por usuario, contiene la fecha inicial y final que son 
        * parametros para el reporte
        * Salida: HttpResponde con un array de bytes
        * Código tomado de: https://stackoverflow.com/questions/30095445/save-ssrs-report-as-pdf-in-c-sharp-programmatically
        ---------------------------------------------------------------------------------------------------------------------*/
        [AllowAnonymous]
        [HttpPost]
        [Route("api/getSalesReport")]
        public HttpResponseMessage GetSalesReport([FromBody] DateFilterModel filter)
        {
            ReportingServicesReference.ReportExecutionService rs = new ReportingServicesReference.ReportExecutionService();
            // Prepare report parameter.
            ReportingServicesReference.ParameterValue[] parameters = new ReportingServicesReference.ParameterValue[2];

            string deviceInfo = "<DeviceInfo><Toolbar>False</Toolbar></DeviceInfo>";
            string mimeType;
            string encoding;
            string[] streamId;
            ReportingServicesReference.Warning[] warning;

            parameters[0] = new ReportingServicesReference.ParameterValue();
            parameters[0].Name = "FechaInicial";
            //                       mes/dia/año
            // parameters[0].Value = "1/1/2019";
            parameters[0].Value = filter.StartDate;

            parameters[1] = new ReportingServicesReference.ParameterValue();
            parameters[1].Name = "FechaFinal";
            parameters[1].Value = filter.EndDate;

            rs.Credentials = CredentialCache.DefaultCredentials;
            rs.Url = "http://desktop-nsa2cvd/reportserver/reportexecution2005.asmx";

            rs.ExecutionHeaderValue = new ReportingServicesReference.ExecutionHeader();
            var executionInfo = new ReportingServicesReference.ExecutionInfo();
            executionInfo = rs.LoadReport("/TECresReport/SalesReport", null);
            String SessionId = rs.ExecutionHeaderValue.ExecutionID;
            rs.SetExecutionParameters(parameters, "");

            var result = rs.Render("PDF", deviceInfo, out mimeType, out encoding, out encoding, out warning, out streamId);
            File.WriteAllBytes(@"D:\TEC\2019\II semestre\Bases de datos\Proyectos\TECres\Site\TECres-site\src\assets\Files\SalesReport.pdf", result);
            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            response.Content = new ByteArrayContent(result);
            response.Content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");

            return response;
        }
    }
}

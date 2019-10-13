using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;

namespace web_api.Handlers
{
    /**
     * Autencticación del API
     * 
     **/
    public class ValidationHandle : DelegatingHandler
    {


        protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, System.Threading.CancellationToken cancellationToken)
        {
            var dominio = "localhost";
            //Verificar si se accede de un host desconocido
            if (!string.Equals(request.RequestUri.Host, dominio, StringComparison.InvariantCultureIgnoreCase))
            {
                return request.CreateResponse(HttpStatusCode.Unauthorized);
            }

            var mensaje = await base.SendAsync(request, cancellationToken);

            return mensaje;
        }



    }
}
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace tec_api.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class FOTOS
    {
        public int Id { get; set; }
        public string Ruta { get; set; }
        public int IdPropiedad { get; set; }
    
        public virtual PROPIEDAD PROPIEDAD { get; set; }
    }
}
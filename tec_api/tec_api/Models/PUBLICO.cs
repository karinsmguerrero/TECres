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
    
    public partial class PUBLICO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PUBLICO()
        {
            this.ANUNCIO = new HashSet<ANUNCIO>();
        }
    
        public int Id { get; set; }
        public System.DateTime FechaInicial { get; set; }
        public System.DateTime FechaFinal { get; set; }
        public int CantidadMensajes { get; set; }
        public int IngresoInicial { get; set; }
        public int IngresoFinal { get; set; }
        public string Sexo { get; set; }
        public int EdadInicial { get; set; }
        public int EdadFinal { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ANUNCIO> ANUNCIO { get; set; }
    }
}
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ReadingAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class D_Time
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public D_Time()
        {
            this.F_CO2 = new HashSet<F_CO2>();
            this.F_Humidity = new HashSet<F_Humidity>();
            this.F_Light = new HashSet<F_Light>();
            this.F_Temperature = new HashSet<F_Temperature>();
            this.F_Watering = new HashSet<F_Watering>();
        }
    
        public int TimeKey { get; set; }
        public int TimeAltKey { get; set; }
        public string Time30 { get; set; }
        public byte Hour30 { get; set; }
        public byte MinuteNumber { get; set; }
        public byte SecondNumber { get; set; }
        public int TimeInSecond { get; set; }
        public string HourlyBucket { get; set; }
        public int DayTimeBucketGroupKey { get; set; }
        public string DayTimeBucket { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<F_CO2> F_CO2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<F_Humidity> F_Humidity { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<F_Light> F_Light { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<F_Temperature> F_Temperature { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<F_Watering> F_Watering { get; set; }
    }
}

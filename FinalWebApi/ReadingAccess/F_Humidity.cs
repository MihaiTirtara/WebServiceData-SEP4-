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
    
    public partial class F_Humidity
    {
        public int DateKey { get; set; }
        public int TimeKey { get; set; }
        public int PlantKey { get; set; }
        public Nullable<double> Units_Humidity { get; set; }
    
        public virtual D_Date D_Date { get; set; }
        public virtual D_Plant D_Plant { get; set; }
        public virtual D_Time D_Time { get; set; }

        public override String ToString()
        {
            return Units_Humidity + ",";
        }

    }
}
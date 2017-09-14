namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Location")]
    public partial class Location
    {
        public Location()
        {
            Properties = new HashSet<Property>();
        }

        public int LocationId { get; set; }

        [StringLength(256)]
        public string StreetName { get; set; }

        [StringLength(256)]
        public string StreetNo { get; set; }

        public long ZipCode { get; set; }

        public double Logitude { get; set; }

        public double Latitude { get; set; }

        public int CityId { get; set; }

        public virtual city city { get; set; }

        public virtual ICollection<Property> Properties { get; set; }
    }
}

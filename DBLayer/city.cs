namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class city
    {
        public city()
        {
            Locations = new HashSet<Location>();
        }

        public int CityId { get; set; }

        public int CountryID { get; set; }

        [Required]
        [StringLength(256)]
        public string CityName { get; set; }

        public double Latitude { get; set; }

        public double Longitude { get; set; }

        public virtual Country Country { get; set; }

        public virtual ICollection<Location> Locations { get; set; }
    }
}

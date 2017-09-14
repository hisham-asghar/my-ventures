namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Country
    {
        public Country()
        {
            cities = new HashSet<city>();
        }

        public int CountryId { get; set; }

        [Required]
        [StringLength(256)]
        public string CountryName { get; set; }

        public virtual ICollection<city> cities { get; set; }
    }
}

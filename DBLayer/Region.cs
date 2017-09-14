namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Region
    {
        public int RegionId { get; set; }

        public int CountryId { get; set; }

        [Column("Region")]
        [Required]
        [StringLength(50)]
        public string Region1 { get; set; }

        [Required]
        [StringLength(50)]
        public string Code { get; set; }

        [Required]
        [StringLength(50)]
        public string ADM1Code { get; set; }
    }
}

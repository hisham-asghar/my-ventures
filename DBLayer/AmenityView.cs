namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AmenityView")]
    public partial class AmenityView
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AmenitiesTypeId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(256)]
        public string AmenitiesTypeName { get; set; }

        [StringLength(1024)]
        public string SVG { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ParentAmenitiesTypeId { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(256)]
        public string ParentAmenitiesTypeName { get; set; }

        [StringLength(1024)]
        public string ParentSVG { get; set; }
    }
}

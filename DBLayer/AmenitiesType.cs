namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AmenitiesType")]
    public partial class AmenitiesType
    {
        public AmenitiesType()
        {
            Amenities = new HashSet<Amenity>();
            AmenitiesType1 = new HashSet<AmenitiesType>();
        }

        public int AmenitiesTypeId { get; set; }

        [Required]
        [StringLength(256)]
        public string AmenitiesTypeName { get; set; }

        [StringLength(1024)]
        public string SVG { get; set; }

        public int? ParentTypeId { get; set; }

        public bool isActive { get; set; }

        public virtual ICollection<Amenity> Amenities { get; set; }

        public virtual ICollection<AmenitiesType> AmenitiesType1 { get; set; }

        public virtual AmenitiesType AmenitiesType2 { get; set; }
    }
}

namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PriceUnit")]
    public partial class PriceUnit
    {
        public PriceUnit()
        {
            Properties = new HashSet<Property>();
        }

        public int PriceUnitId { get; set; }

        [Required]
        [StringLength(50)]
        public string PriceUnitName { get; set; }

        [Column(TypeName = "numeric")]
        public decimal Amount { get; set; }

        public virtual ICollection<Property> Properties { get; set; }
    }
}

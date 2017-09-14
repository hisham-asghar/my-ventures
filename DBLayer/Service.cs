namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Service")]
    public partial class Service
    {
        public int ServiceId { get; set; }

        [Required]
        [StringLength(1024)]
        public string ServiceName { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string ServiceText { get; set; }

        [Required]
        [StringLength(256)]
        public string Image { get; set; }

        [Required]
        [StringLength(256)]
        public string Guid { get; set; }
    }
}

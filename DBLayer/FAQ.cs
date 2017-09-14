namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FAQ")]
    public partial class FAQ
    {
        public int FAQid { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Question { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Answer { get; set; }
    }
}

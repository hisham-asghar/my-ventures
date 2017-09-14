namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PropertyReview
    {
        [Key]
        public int ReviewId { get; set; }

        public int PropertyId { get; set; }

        public int UserId { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Description { get; set; }

        public bool IsVerified { get; set; }

        public DateTime onCreated { get; set; }

        public DateTime onModified { get; set; }

        public virtual Property Property { get; set; }

        public virtual User User { get; set; }
    }
}

namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ContactMessage")]
    public partial class ContactMessage
    {
        public int ContactMessageId { get; set; }

        public int UserId { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Message { get; set; }

        public virtual User User { get; set; }
    }
}

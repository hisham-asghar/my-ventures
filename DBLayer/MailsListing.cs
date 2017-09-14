namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MailsListing")]
    public partial class MailsListing
    {
        [Key]
        public int MailId { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string MailTo { get; set; }

        [Required]
        [StringLength(1024)]
        public string Subject { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Body { get; set; }
    }
}

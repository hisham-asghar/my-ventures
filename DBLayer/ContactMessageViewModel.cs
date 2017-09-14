namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ContactMessageViewModel")]
    public partial class ContactMessageViewModel
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ContactMessageId { get; set; }

        [Key]
        [Column(Order = 1, TypeName = "ntext")]
        public string Message { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(256)]
        public string Email { get; set; }

        [StringLength(256)]
        public string Name { get; set; }

        [StringLength(256)]
        public string Phone { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserId { get; set; }

        [Key]
        [Column(Order = 4)]
        public bool Subscribed { get; set; }
    }
}

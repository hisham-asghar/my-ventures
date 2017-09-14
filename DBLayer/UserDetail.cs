namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class UserDetail
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserId { get; set; }

        public int Password { get; set; }

        public int Role { get; set; }

        [Required]
        [StringLength(256)]
        public string RoleName { get; set; }

        public virtual User User { get; set; }
    }
}

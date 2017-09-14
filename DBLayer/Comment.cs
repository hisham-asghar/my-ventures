namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Comment
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CommentId { get; set; }

        public int UserId { get; set; }

        public int Message { get; set; }

        public int TypeId { get; set; }

        public int TypeNameId { get; set; }

        [Required]
        [StringLength(50)]
        public string TypeName { get; set; }

        public virtual Magzine Magzine { get; set; }

        public virtual Property Property { get; set; }

        public virtual User User { get; set; }
    }
}

namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("History")]
    public partial class History
    {
        public int HistoryId { get; set; }

        public int sortId { get; set; }

        [StringLength(256)]
        public string Title { get; set; }

        [Column(TypeName = "ntext")]
        public string Text { get; set; }

        public DateTime onModified { get; set; }

        public DateTime onCreated { get; set; }
    }
}

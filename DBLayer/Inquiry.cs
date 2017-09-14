namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Inquiry
    {
        public int InquiryId { get; set; }

        public int PropertyId { get; set; }

        public DateTime Message { get; set; }

        public int UserId { get; set; }

        public DateTime onCreated { get; set; }

        public DateTime onModified { get; set; }

        public virtual Property Property { get; set; }

        public virtual User User { get; set; }
    }
}

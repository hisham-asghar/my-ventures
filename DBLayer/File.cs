namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class File
    {
        public int FileId { get; set; }

        [Required]
        [StringLength(256)]
        public string FileName { get; set; }

        [Required]
        [StringLength(256)]
        public string mimeType { get; set; }

        public int? TypeId { get; set; }

        public DateTime onCreated { get; set; }

        public DateTime onModified { get; set; }

        public int? FileTypeId { get; set; }

        [StringLength(1024)]
        public string Description { get; set; }

        [StringLength(256)]
        public string FileTypeName { get; set; }

        public virtual Magzine Magzine { get; set; }

        public virtual Property Property { get; set; }
    }
}
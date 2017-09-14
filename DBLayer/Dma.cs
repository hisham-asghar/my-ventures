namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Dma
    {
        public int DmaId { get; set; }

        public int CountryId { get; set; }

        [Column("DMA")]
        public int DMA1 { get; set; }

        [Required]
        [StringLength(50)]
        public string Market { get; set; }
    }
}

namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PropertySmallView")]
    public partial class PropertySmallView
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(256)]
        public string CityName { get; set; }

        [Key]
        [Column(Order = 1)]
        public double CityLatitude { get; set; }

        [Key]
        [Column(Order = 2)]
        public double CityLongitude { get; set; }

        [Key]
        [Column(Order = 3)]
        public double Latitude { get; set; }

        [Key]
        [Column(Order = 4)]
        public double Logitude { get; set; }

        [StringLength(256)]
        public string StreetNo { get; set; }

        [StringLength(256)]
        public string StreetName { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(50)]
        public string PriceUnitName { get; set; }

        [Key]
        [Column(Order = 6)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PriceUnitId { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(256)]
        public string Title { get; set; }

        [StringLength(1024)]
        public string SubTitle { get; set; }

        [Key]
        [Column(Order = 8)]
        public double Price { get; set; }

        [Key]
        [Column(Order = 9)]
        public double OfferPrice { get; set; }

        [Key]
        [Column(Order = 10)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Baths { get; set; }

        [Key]
        [Column(Order = 11)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Beds { get; set; }

        [StringLength(256)]
        public string Banner { get; set; }

        [Key]
        [Column(Order = 12)]
        public bool isActive { get; set; }

        [Key]
        [Column(Order = 13)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PropertyTypeId { get; set; }

        [Key]
        [Column(Order = 14)]
        [StringLength(256)]
        public string PropertyTypeName { get; set; }

        public int? ParentTypeId { get; set; }

        [Key]
        [Column(Order = 15)]
        public double Area { get; set; }

        [Key]
        [Column(Order = 16)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AreaUnit { get; set; }

        [Key]
        [Column(Order = 17)]
        [StringLength(50)]
        public string AreaUnitName { get; set; }

        [Key]
        [Column(Order = 18)]
        [StringLength(256)]
        public string guid { get; set; }

        [StringLength(256)]
        public string pdf { get; set; }

        [Column(TypeName = "ntext")]
        public string Description { get; set; }

        [Key]
        [Column(Order = 19)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PropertyId { get; set; }
    }
}

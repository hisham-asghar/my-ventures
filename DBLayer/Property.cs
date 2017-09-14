namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Property")]
    public partial class Property
    {
        public Property()
        {
            Amenities = new HashSet<Amenity>();
            Comments = new HashSet<Comment>();
            Files = new HashSet<File>();
            Inquiries = new HashSet<Inquiry>();
            PropertyReviews = new HashSet<PropertyReview>();
        }

        public int PropertyId { get; set; }

        public int TypeId { get; set; }

        [Required]
        [StringLength(256)]
        public string Title { get; set; }

        [StringLength(1024)]
        public string SubTitle { get; set; }

        [Column(TypeName = "ntext")]
        public string Description { get; set; }

        [StringLength(256)]
        public string pdf { get; set; }

        [Required]
        [StringLength(256)]
        public string guid { get; set; }

        public int LocationId { get; set; }

        public double Area { get; set; }

        public int AreaUnit { get; set; }

        public double Price { get; set; }

        public int PriceUnit { get; set; }

        public double OfferPrice { get; set; }

        public int Baths { get; set; }

        public int Beds { get; set; }

        [StringLength(256)]
        public string Banner { get; set; }

        public bool isActive { get; set; }

        [StringLength(1024)]
        public string VideoURL { get; set; }

        public virtual ICollection<Amenity> Amenities { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }

        public virtual ICollection<File> Files { get; set; }

        public virtual ICollection<Inquiry> Inquiries { get; set; }

        public virtual Location Location { get; set; }

        public virtual PriceUnit PriceUnit1 { get; set; }

        public virtual PropertyType PropertyType { get; set; }

        public virtual Unit Unit { get; set; }

        public virtual ICollection<PropertyReview> PropertyReviews { get; set; }
    }
}

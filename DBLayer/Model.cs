namespace DBLayer
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model : DbContext
    {
        public Model()
            : base("name=DBModelStr")
        {
        }

        public virtual DbSet<Amenity> Amenities { get; set; }
        public virtual DbSet<AmenitiesType> AmenitiesTypes { get; set; }
        public virtual DbSet<BlogViewItem> BlogViewItems { get; set; }
        public virtual DbSet<BlogViewType> BlogViewTypes { get; set; }
        public virtual DbSet<city> cities { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<ContactMessage> ContactMessages { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<Dma> Dmas { get; set; }
        public virtual DbSet<FAQ> FAQs { get; set; }
        public virtual DbSet<File> Files { get; set; }
        public virtual DbSet<History> Histories { get; set; }
        public virtual DbSet<Inquiry> Inquiries { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<MagzineCategory> MagzineCategories { get; set; }
        public virtual DbSet<MagzineItem> MagzineItems { get; set; }
        public virtual DbSet<Magzine> Magzines { get; set; }
        public virtual DbSet<MailsListing> MailsListings { get; set; }
        public virtual DbSet<PriceUnit> PriceUnits { get; set; }
        public virtual DbSet<Property> Properties { get; set; }
        public virtual DbSet<PropertyReview> PropertyReviews { get; set; }
        public virtual DbSet<PropertyType> PropertyTypes { get; set; }
        public virtual DbSet<Region> Regions { get; set; }
        public virtual DbSet<Service> Services { get; set; }
        public virtual DbSet<SiteMeta> SiteMetas { get; set; }
        public virtual DbSet<SiteMetaMatch> SiteMetaMatches { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }
        public virtual DbSet<Unit> Units { get; set; }
        public virtual DbSet<UserDetail> UserDetails { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<AmenityView> AmenityViews { get; set; }
        public virtual DbSet<ContactMessageViewModel> ContactMessageViewModels { get; set; }
        public virtual DbSet<PropertySmallView> PropertySmallViews { get; set; }
        public virtual DbSet<PropertyView> PropertyViews { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AmenitiesType>()
                .Property(e => e.AmenitiesTypeName)
                .IsUnicode(false);

            modelBuilder.Entity<AmenitiesType>()
                .Property(e => e.SVG)
                .IsUnicode(false);

            modelBuilder.Entity<AmenitiesType>()
                .HasMany(e => e.Amenities)
                .WithRequired(e => e.AmenitiesType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AmenitiesType>()
                .HasMany(e => e.AmenitiesType1)
                .WithOptional(e => e.AmenitiesType2)
                .HasForeignKey(e => e.ParentTypeId);

            modelBuilder.Entity<BlogViewItem>()
                .Property(e => e.TypeName)
                .IsUnicode(false);

            modelBuilder.Entity<BlogViewItem>()
                .Property(e => e.Type)
                .IsUnicode(false);

            modelBuilder.Entity<BlogViewItem>()
                .HasMany(e => e.MagzineItems)
                .WithRequired(e => e.BlogViewItem)
                .HasForeignKey(e => e.BlogItemId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BlogViewType>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<BlogViewType>()
                .HasMany(e => e.BlogViewItems)
                .WithRequired(e => e.BlogViewType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BlogViewType>()
                .HasMany(e => e.MagzineItems)
                .WithRequired(e => e.BlogViewType)
                .HasForeignKey(e => e.BlogId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BlogViewType>()
                .HasMany(e => e.Magzines)
                .WithRequired(e => e.BlogViewType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<city>()
                .Property(e => e.CityName)
                .IsUnicode(false);

            modelBuilder.Entity<city>()
                .HasMany(e => e.Locations)
                .WithRequired(e => e.city)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Comment>()
                .Property(e => e.TypeName)
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .Property(e => e.CountryName)
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .HasMany(e => e.cities)
                .WithRequired(e => e.Country)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Dma>()
                .Property(e => e.Market)
                .IsUnicode(false);

            modelBuilder.Entity<File>()
                .Property(e => e.FileName)
                .IsUnicode(false);

            modelBuilder.Entity<File>()
                .Property(e => e.mimeType)
                .IsUnicode(false);

            modelBuilder.Entity<File>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<File>()
                .Property(e => e.FileTypeName)
                .IsUnicode(false);

            modelBuilder.Entity<History>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.StreetName)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.StreetNo)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .HasMany(e => e.Properties)
                .WithRequired(e => e.Location)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MagzineCategory>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<MagzineCategory>()
                .HasMany(e => e.Magzines)
                .WithRequired(e => e.MagzineCategory)
                .HasForeignKey(e => e.CategoryId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Magzine>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<Magzine>()
                .Property(e => e.GUID)
                .IsUnicode(false);

            modelBuilder.Entity<Magzine>()
                .HasMany(e => e.Comments)
                .WithRequired(e => e.Magzine)
                .HasForeignKey(e => e.TypeId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Magzine>()
                .HasMany(e => e.Files)
                .WithOptional(e => e.Magzine)
                .HasForeignKey(e => e.TypeId);

            modelBuilder.Entity<Magzine>()
                .HasMany(e => e.MagzineItems)
                .WithRequired(e => e.Magzine)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MailsListing>()
                .Property(e => e.Subject)
                .IsUnicode(false);

            modelBuilder.Entity<PriceUnit>()
                .Property(e => e.PriceUnitName)
                .IsUnicode(false);

            modelBuilder.Entity<PriceUnit>()
                .Property(e => e.Amount)
                .HasPrecision(18, 0);

            modelBuilder.Entity<PriceUnit>()
                .HasMany(e => e.Properties)
                .WithRequired(e => e.PriceUnit1)
                .HasForeignKey(e => e.PriceUnit)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.SubTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.pdf)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.guid)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.Banner)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.VideoURL)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .HasMany(e => e.Amenities)
                .WithRequired(e => e.Property)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Property>()
                .HasMany(e => e.Comments)
                .WithRequired(e => e.Property)
                .HasForeignKey(e => e.TypeId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Property>()
                .HasMany(e => e.Files)
                .WithOptional(e => e.Property)
                .HasForeignKey(e => e.TypeId);

            modelBuilder.Entity<Property>()
                .HasMany(e => e.Inquiries)
                .WithRequired(e => e.Property)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Property>()
                .HasMany(e => e.PropertyReviews)
                .WithRequired(e => e.Property)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyType>()
                .Property(e => e.TypeName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyType>()
                .HasMany(e => e.Properties)
                .WithRequired(e => e.PropertyType)
                .HasForeignKey(e => e.TypeId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PropertyType>()
                .HasMany(e => e.PropertyType1)
                .WithOptional(e => e.PropertyType2)
                .HasForeignKey(e => e.ParentTypeId);

            modelBuilder.Entity<Region>()
                .Property(e => e.Region1)
                .IsUnicode(false);

            modelBuilder.Entity<Region>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Region>()
                .Property(e => e.ADM1Code)
                .IsUnicode(false);

            modelBuilder.Entity<Service>()
                .Property(e => e.ServiceName)
                .IsUnicode(false);

            modelBuilder.Entity<Service>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<Service>()
                .Property(e => e.Guid)
                .IsUnicode(false);

            modelBuilder.Entity<SiteMeta>()
                .Property(e => e.MetaName)
                .IsUnicode(false);

            modelBuilder.Entity<SiteMeta>()
                .HasMany(e => e.SiteMetaMatches)
                .WithRequired(e => e.SiteMeta)
                .HasForeignKey(e => e.MetaChildId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SiteMeta>()
                .HasMany(e => e.SiteMetaMatches1)
                .WithRequired(e => e.SiteMeta1)
                .HasForeignKey(e => e.MetaParentId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tag>()
                .Property(e => e.TagName)
                .IsUnicode(false);

            modelBuilder.Entity<Unit>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Unit>()
                .HasMany(e => e.Properties)
                .WithRequired(e => e.Unit)
                .HasForeignKey(e => e.AreaUnit)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<UserDetail>()
                .Property(e => e.RoleName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Comments)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.ContactMessages)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Inquiries)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.PropertyReviews)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasOptional(e => e.UserDetail)
                .WithRequired(e => e.User);

            modelBuilder.Entity<AmenityView>()
                .Property(e => e.AmenitiesTypeName)
                .IsUnicode(false);

            modelBuilder.Entity<AmenityView>()
                .Property(e => e.SVG)
                .IsUnicode(false);

            modelBuilder.Entity<AmenityView>()
                .Property(e => e.ParentAmenitiesTypeName)
                .IsUnicode(false);

            modelBuilder.Entity<AmenityView>()
                .Property(e => e.ParentSVG)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMessageViewModel>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMessageViewModel>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMessageViewModel>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.CityName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.StreetNo)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.StreetName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.PriceUnitName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.SubTitle)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.Banner)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.PropertyTypeName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.AreaUnitName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.guid)
                .IsUnicode(false);

            modelBuilder.Entity<PropertySmallView>()
                .Property(e => e.pdf)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.CityName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.StreetNo)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.StreetName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.PriceUnitName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.SubTitle)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.Banner)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.PropertyTypeName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.AreaUnitName)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.guid)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.pdf)
                .IsUnicode(false);

            modelBuilder.Entity<PropertyView>()
                .Property(e => e.VideoURL)
                .IsUnicode(false);
        }
    }
}

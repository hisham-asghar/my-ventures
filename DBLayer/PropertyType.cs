namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PropertyType")]
    public partial class PropertyType
    {
        public PropertyType()
        {
            Properties = new HashSet<Property>();
            PropertyType1 = new HashSet<PropertyType>();
        }

        public int PropertyTypeId { get; set; }

        [Required]
        [StringLength(256)]
        public string TypeName { get; set; }

        public int? ParentTypeId { get; set; }

        public virtual ICollection<Property> Properties { get; set; }

        public virtual ICollection<PropertyType> PropertyType1 { get; set; }

        public virtual PropertyType PropertyType2 { get; set; }
    }
}

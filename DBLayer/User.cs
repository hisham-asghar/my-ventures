namespace DBLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        public User()
        {
            Comments = new HashSet<Comment>();
            ContactMessages = new HashSet<ContactMessage>();
            Inquiries = new HashSet<Inquiry>();
            PropertyReviews = new HashSet<PropertyReview>();
        }

        public int UserId { get; set; }

        [Required]
        [StringLength(256)]
        public string Email { get; set; }

        [StringLength(256)]
        public string Name { get; set; }

        [StringLength(256)]
        public string Phone { get; set; }

        public bool Subscribed { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }

        public virtual ICollection<ContactMessage> ContactMessages { get; set; }

        public virtual ICollection<Inquiry> Inquiries { get; set; }

        public virtual ICollection<PropertyReview> PropertyReviews { get; set; }

        public virtual UserDetail UserDetail { get; set; }
    }
}

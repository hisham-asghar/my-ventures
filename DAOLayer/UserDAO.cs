using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBLayer;
using CustomModels;
using CustomModels.SiteForms;
using System.Data.Entity.Validation;

namespace DAOLayer
{
    public class UserDAO
    {
        public static bool SaveContactMessage(ContactForm form)
        {
            using (var db = new Model())
            {
                var user = db.Users.FirstOrDefault(u => u.Email == form.email);
                if (user != null)
                {
                    db.ContactMessages.Add(new ContactMessage()
                    {
                        Message = form.message,
                        UserId = user.UserId
                    });
                }
                else
                {
                    user = new User()
                    {
                        Name = form.name,
                        Email = form.email,
                        Phone = form.phone
                    };
                    var msg = new ContactMessage()
                    {
                        Message = form.message,
                        User = user
                    };
                    db.ContactMessages.Add(msg);
                }
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (DbEntityValidationException e)
                {
                    return false;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }
        public static bool Subscribe(ContactForm form)
        {
            using (var db = new Model())
            {
                var user = db.Users.FirstOrDefault(u => u.Email == form.email);
                if (user != null)
                {
                    user.Subscribed = true;
                }
                else
                {
                    user = new User()
                    {
                        Name = form.name,
                        Email = form.email,
                        Phone = form.phone,
                        Subscribed = true
                    };
                    db.Users.Add(user);
                }
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (DbEntityValidationException e)
                {
                    return false;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }
    }
}

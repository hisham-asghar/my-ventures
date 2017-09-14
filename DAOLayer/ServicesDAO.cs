using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBLayer;

namespace DAOLayer
{
    public class ServicesDAO
    {
        public static Service get(int id)
        {
            using (var db = new Model())
            {
                return db.Services.FirstOrDefault(f => f.ServiceId == id);
            }
        }
        public static bool delete(int id)
        {
            using (var db = new Model())
            {
                var faq = db.Services.FirstOrDefault(f => f.ServiceId == id);
                db.Services.Remove(faq);
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }
        public static List<Service> getAll()
        {
            using (var db = new Model())
            {
                try { return db.Services.ToList(); }
                catch (Exception e)
                {
                    return new List<Service>();
                }
            }
        }
        public static bool Save(Service model)
        {
            using (var db = new Model())
            {
                var faq = db.Services.FirstOrDefault(f => f.ServiceId == model.ServiceId);
                if (faq == null)
                {
                    if (model.ServiceName.Contains(" "))
                        model.Guid = model.ServiceName.Replace(" ", "-");
                    model.Guid = model.Guid.ToLower();
                    db.Services.Add(model);
                }
                else
                {
                    if (model.ServiceName.Contains(" "))
                        model.Guid = model.ServiceName.Replace(" ", "-");
                    faq.Guid = model.ServiceName.ToLower();
                    faq.Image = string.IsNullOrWhiteSpace(model.Image) ? faq.Image : model.Image;
                    faq.ServiceText = model.ServiceText;
                    faq.ServiceName = model.ServiceName;
                }
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }
    }
}

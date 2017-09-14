using DBLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAOLayer
{
    public class FAQDAO
    {
        public static FAQ getFAQ(int id)
        {
            using (var db = new Model())
            {
                return db.FAQs.FirstOrDefault(f => f.FAQid == id);
            }
        }
        public static List<FAQ> getAllFAQ()
        {
            using (var db = new Model())
            {
                return db.FAQs.ToList();
            }
        }
        public static bool SaveFAQ(FAQ model)
        {
            using (var db = new Model())
            {
                var faq = db.FAQs.FirstOrDefault(f => f.FAQid == model.FAQid);
                if(faq == null)
                {
                    db.FAQs.Add(model);
                }
                else
                {
                    faq.Question = model.Question;
                    faq.Answer = model.Answer;
                }
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch(Exception e)
                {
                    return false;
                }
            }
        }
    }
}

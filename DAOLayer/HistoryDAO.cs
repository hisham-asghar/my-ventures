using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBLayer;

namespace DAOLayer
{
    public class HistoryDAO
    {
        public static History Get(int id)
        {
            using (var db = new Model())
            {
                return db.Histories.FirstOrDefault(h => h.HistoryId == id);
            }
        }

        public static List<History> GetAll()
        {
            using (var db = new Model())
            {
                return db.Histories.ToList();
            }
        }
        
        public static bool Save(History history)
        {
            using (var db = new Model())
            {
                History historyModel = null;
                if (history.HistoryId > 0)
                {
                    historyModel = db.Histories.FirstOrDefault(h => h.HistoryId == history.HistoryId);
                }
                if (historyModel == null)
                {
                    history.onCreated = DateTime.Now;
                    history.onModified = DateTime.Now;
                    db.Histories.Add(history);
                }
                else
                {
                    historyModel.onModified = DateTime.Now;
                }
                try
                {
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    return false;
                }
                return true;
            }
        }

        public static bool Remove(int id)
        {
            using (var db = new Model())
            {
                var history = db.Histories.FirstOrDefault(h => h.HistoryId == id);
                if (history == null) return false;
                db.Histories.Remove(history);
                try
                {
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    return false;
                }
                return true;
            } 
        }
    }
}

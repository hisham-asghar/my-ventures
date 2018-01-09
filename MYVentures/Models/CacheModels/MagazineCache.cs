using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CustomModels;

namespace RentalsClinet.Models.CacheModels
{
    public class MagazineCache : CacheHandler
    {
        public MagazineCache()
        {
            Type = ((int)CacheObjects.MagazinePage).ToString();
        }
        public override object Get(HttpApplicationState cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<Dictionary<string, string>>)result : new List<Dictionary<string, string>>();
            return list.FirstOrDefault(p => Helpers.CustomFunctions.LinkComaprer(p["guid"], token));
        }

        public override object Get(HttpApplicationStateBase cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<Dictionary<string, string>>)result : new List<Dictionary<string, string>>();
            return list.FirstOrDefault(p => Helpers.CustomFunctions.LinkComaprer(p["guid"], token));
        }

        protected override object GetFromDb()
        {
            return LayerDAO.MagzineDAO.GetMagzines(0);
        }
    }
}
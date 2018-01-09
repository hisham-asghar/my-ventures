using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CustomModels;
using LayerDB;

namespace RentalsClinet.Models.CacheModels
{
    public class CitiesCache : CacheHandler
    {

        public CitiesCache()
        {
            Type = ((int)CacheObjects.Cities).ToString();
        }

        public override object Get(HttpApplicationState cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<City>)result : new List<City>();
            return list.FirstOrDefault(p => Helpers.CustomFunctions.LinkComaprer(p.guid, token));
        }

        public override object Get(HttpApplicationStateBase cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<City>)result : new List<City>();
            return list.FirstOrDefault(p => Helpers.CustomFunctions.LinkComaprer(p.guid, token));
        }

        protected override object GetFromDb()
        {
            return LayerDAO.PropertyDAO.GetCities();
        }
    }
}
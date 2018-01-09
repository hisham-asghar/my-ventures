using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Common;
using CustomModels;
using CustomModels.PropertyModels;
using DBLayer;

namespace MYVentures.Models.CacheModels
{
    public class PropertiesCache : CacheHandler
    {

        public PropertiesCache()
        {
            Type = ((int)Enums.CacheObjects.MyProperties).ToString();
        }

        public override object Get(HttpApplicationState cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<PropertyView>) result : new List<PropertyView>();
            return list.FirstOrDefault(p => StringUtils.LinkComaprer(p.guid, token));
        }

        public override object Get(HttpApplicationStateBase cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<PropertyView>)result : new List<PropertyView>();
            return list.FirstOrDefault(p => StringUtils.LinkComaprer(p.guid, token));
        }

        protected override object GetFromDb()
        {
            return DAOLayer.PropertyDao.GetPropertiesList();
        }

        public int GetMaxPrice(HttpApplicationState cache)
        {
            var result = Get(cache);
            var list = result != null ? (List<PropertyView>)result : new List<PropertyView>();
            return list.Count > 0 ? Convert.ToInt32(Math.Floor(list.Max(p => p.CalculatedPrice ?? 0))) : 0;
        }
        public int GetMaxPrice(HttpApplicationStateBase cache)
        {
            var result = Get(cache);
            var list = result != null ? (List<PropertyView>)result : new List<PropertyView>();
            return list.Count > 0 ? Convert.ToInt32(Math.Floor(list.Max(p => p.CalculatedPrice ?? 0))) : 0;
        }

        public int GetMinPrice(HttpApplicationState cache)
        {
            var result = Get(cache);
            var list = result != null ? (List<PropertyView>)result : new List<PropertyView>();
            return list.Count > 0 ? Convert.ToInt32(Math.Floor(list.Min(p => p.CalculatedPrice ?? 0))) : 0;
        }
        public int GetMinPrice(HttpApplicationStateBase cache)
        {
            var result = Get(cache);
            var list = result != null ? (List<PropertyView>)result : new List<PropertyView>();
            return list.Count > 0 ? Convert.ToInt32(Math.Floor(list.Min(p => p.CalculatedPrice ?? 0))) : 0;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CustomModels;
using Service = LayerDB.Service;

namespace RentalsClinet.Models.CacheModels
{
    public class ServicesCache : CacheHandler
    {
        public ServicesCache()
        {
            Type = ((int)CacheObjects.ServicesList).ToString();
        }
        public override object Get(HttpApplicationState cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<Service>)result : new List<Service>();
            return list.FirstOrDefault(p => Helpers.CustomFunctions.LinkComaprer(p.guid, token));
        }

        public override object Get(HttpApplicationStateBase cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<Service>)result : new List<Service>();
            return list.FirstOrDefault(p => Helpers.CustomFunctions.LinkComaprer(p.guid, token));
        }

        protected override object GetFromDb()
        {
            return LayerDAO.ServicesDao.GetAll();
        }
    }
}
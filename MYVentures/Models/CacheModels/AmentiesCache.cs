using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CustomModels;
using LayerDB;

namespace RentalsClinet.Models.CacheModels
{
    public class AmentiesCache : CacheHandler
    {
        public AmentiesCache()
        {
            Type = ((int)CacheObjects.AmentiesList).ToString();
        }
        public override object Get(HttpApplicationState cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<AmenitiesType>)result : new List<AmenitiesType>();
            int tokenId;
            int.TryParse(token,out tokenId);
            return list.FirstOrDefault(p => p.AmenitiesTypeId == tokenId);
        }

        public override object Get(HttpApplicationStateBase cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<AmenitiesType>)result : new List<AmenitiesType>();
            int tokenId;
            int.TryParse(token, out tokenId);
            return list.FirstOrDefault(p => p.AmenitiesTypeId == tokenId);
        }

        protected override object GetFromDb()
        {
            return LayerDAO.AmentiesDAO.GetAll();
        }
    }

}
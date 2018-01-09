using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CustomModels;
using LayerDB;

namespace RentalsClinet.Models.CacheModels
{
    public class TagsCache : CacheHandler
    {
        public TagsCache()
        {
            Type = ((int)CacheObjects.TagsList).ToString();
        }
        public override object Get(HttpApplicationState cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<Tag>)result : new List<Tag>();
            return list.FirstOrDefault(p => Helpers.CustomFunctions.LinkComaprer(p.guid, token)) ?? new Tag();
        }

        public override object Get(HttpApplicationStateBase cache, string token)
        {
            var result = Get(cache);
            var list = result != null ? (List<Tag>)result : new List<Tag>();
            return list.FirstOrDefault(p => Helpers.CustomFunctions.LinkComaprer(p.guid, token)) ?? new Tag();
        }

        protected override object GetFromDb()
        {
            return LayerDAO.PropertyDAO.GetPropertyTags();
        }
    }

}
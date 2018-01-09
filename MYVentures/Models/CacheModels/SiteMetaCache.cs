using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CustomModels;
using LayerDB;

namespace RentalsClinet.Models.CacheModels
{
    public class SiteMetaCache : CacheHandler
    {
        public SiteMetaCache()
        {
            Type = ((int) CacheObjects.SiteMetaList).ToString();
        }

        public override object Get(HttpApplicationState cache, string token)
        {
            if (string.IsNullOrWhiteSpace(token))
                return new Dictionary<string, Meta>();
            token = token.ToLower();
            var result = Get(cache);
            var list = result != null
                ? (Dictionary<string, Dictionary<string, Meta>>) result
                : new Dictionary<string, Dictionary<string, Meta>>();
            return list.ContainsKey(token) ? list[token] : new Dictionary<string, Meta>();
        }

        public override object Get(HttpApplicationStateBase cache, string token)
        {
            if(string.IsNullOrWhiteSpace(token))
                return new Dictionary<string, Meta>();
            token = token.ToLower();
            var result = Get(cache);
            var list = result != null
                ? (Dictionary<string, Dictionary<string, Meta>>) result
                : new Dictionary<string, Dictionary<string, Meta>>();
            return list.ContainsKey(token) ? list[token] : new Dictionary<string, Meta>();
        }

        protected override object GetFromDb()
        {
            return LayerDAO.SiteMetaDAO.GetParentMetaChilds();
        }
    }
}
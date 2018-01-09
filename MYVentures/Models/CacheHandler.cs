using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Common;
using CustomModels.PropertyModels;
using CustomModels;

namespace MYVentures.Models
{
    

    public abstract class CacheHandler
    {
        private string _lastDbUpdate;
        
        private string _lastCacheUpdate;

        private string LastDbUpdate
        {
            get { return Type + (_lastDbUpdate ?? ((int)Enums.CacheObjects.LastDbUpdate).ToString()); }
            set { _lastDbUpdate = value ?? ((int)Enums.CacheObjects.LastDbUpdate).ToString(); }
        }

        private string LastCacheUpdate
        {
            get { return Type + (_lastCacheUpdate ?? ((int)Enums.CacheObjects.LastCacheUpdate).ToString()); }
            set { _lastCacheUpdate = value ?? ((int)Enums.CacheObjects.LastCacheUpdate).ToString(); }
        }

        protected string Type { get; set; }

        public object Get(HttpApplicationStateBase cache)
        {
            var dbTime = cache[LastDbUpdate] != null ? (DateTime) cache[LastDbUpdate] : DateTime.Now;
            var cacheTime = cache[LastCacheUpdate] != null ? (DateTime)cache[LastCacheUpdate] : dbTime;

            if (cache[LastDbUpdate] == null)
            {
                cache[LastDbUpdate] = dbTime;
            }
            if (cache[LastCacheUpdate] == null)
            {
                cache[LastCacheUpdate] = cacheTime;
            }


            if (cache[Type] != null && dbTime == cacheTime)
            {
                return cache[Type];
            }
            return UpdateCache(cache);
        }

        public object Get(HttpApplicationState cache)
        {
            var dbTime = cache[LastDbUpdate] != null ? (DateTime)cache[LastDbUpdate] : DateTime.Now;
            var cacheTime = cache[LastCacheUpdate] != null ? (DateTime)cache[LastCacheUpdate] : dbTime;

            if (cache[LastDbUpdate] == null)
            {
                cache[LastDbUpdate] = dbTime;
            }
            if (cache[LastCacheUpdate] == null)
            {
                cache[LastCacheUpdate] = cacheTime;
            }

            if (cache[Type] != null && dbTime == cacheTime)
            {
                return cache[Type];
            }
            return UpdateCache(cache);
        }

        public abstract object Get(HttpApplicationState cache, string token);

        public abstract object Get(HttpApplicationStateBase cache, string token);

        public bool UpdateDatabaseFlag(HttpApplicationState cache)
        {
            cache[LastDbUpdate] = DateTime.Now;
            return true;
        }
        
        public bool UpdateDatabaseFlag(HttpApplicationStateBase cache)
        {
            cache[LastDbUpdate] = DateTime.Now;
            return true;
        }

        protected object UpdateCache(HttpApplicationState cache)
        {

            var list = GetFromDb();
            cache.Lock();
            cache[Type] = list;
            cache.UnLock();
            return cache[Type];
        }

        protected object UpdateCache(HttpApplicationStateBase cache)
        {

            var list = GetFromDb();
            cache.Lock();
            cache[Type] = list;
            cache.UnLock();
            return cache[Type];
        }

        protected abstract object GetFromDb();


        public static bool UpdateCompleteCache(HttpApplicationState cache)
        {
            return true;
            /*
            var result = new PropertiesCache().UpdateDatabaseFlag(cache);
            result = new CitiesCache().UpdateDatabaseFlag(cache);
            result = new MagazineCache().UpdateDatabaseFlag(cache);
            result = new ServicesCache().UpdateDatabaseFlag(cache);
            result = new SiteMetaCache().UpdateDatabaseFlag(cache);
            result = new TagsCache().UpdateDatabaseFlag(cache);
            return result;*/
        }
        public static bool UpdateCompleteCache(HttpApplicationStateBase cache)
        {
            return true;
            /*
            var result = new PropertiesCache().UpdateDatabaseFlag(cache);
            result = new CitiesCache().UpdateDatabaseFlag(cache);
            result = new MagazineCache().UpdateDatabaseFlag(cache);
            result = new ServicesCache().UpdateDatabaseFlag(cache);
            result = new SiteMetaCache().UpdateDatabaseFlag(cache);
            result = new TagsCache().UpdateDatabaseFlag(cache);
            return result;*/
        }

    }

}
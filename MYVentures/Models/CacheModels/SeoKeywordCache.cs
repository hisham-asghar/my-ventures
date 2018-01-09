using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CustomModels;
using CustomModels.PropertyModels;
using LayerDB;

namespace RentalsClinet.Models.CacheModels
{
    public class SeoKeywordCache : CacheHandler
    {
        private HttpApplicationState Cache { get; set; }
        private HttpApplicationStateBase CacheBase { get; set; }

        public SeoKeywordCache()
        {
            Type = ((int)CacheObjects.SeoKeywords).ToString();
        }

        public override object Get(HttpApplicationState cache, string token)
        {
            Cache = cache;
            CacheBase = null;
            var result = Get(cache);
            if (result == null)
            {
                base.UpdateDatabaseFlag(cache);
                result = base.UpdateCache(cache);
            }
            return (string)(result ?? "");
        }

        public override object Get(HttpApplicationStateBase cache, string token)
        {
            CacheBase = cache;
            Cache = null;
            var result = Get(cache);
            if (result == null)
            {
                base.UpdateDatabaseFlag(cache);
                result = base.UpdateCache(cache);
            }
            return (string)(result ?? "");
        }

        protected override object GetFromDb()
        {
            var str = "";
            if (Cache != null)
            {
                var cities = ((List<City>) (new CitiesCache().Get(Cache) ?? new List<City>())).Select(c => c.CityName)
                    .ToList().Aggregate((c, n) => c + ", " + n);
                var properties =
                    ((List<PropertySmallView>) (new PropertiesCache().Get(Cache) ?? new List<PropertySmallView>()))
                    .Select(c => c.Name).ToList().Aggregate((c, n) => c + ", " + n);
                var propertiescities =
                    ((List<PropertySmallView>) (new PropertiesCache().Get(Cache) ?? new List<PropertySmallView>()))
                    .Select(c => c.Name + " " + c.Location.City.Name).ToList().Aggregate((c, n) => c + ", " + n);
                var citiesproperties =
                    ((List<PropertySmallView>) (new PropertiesCache().Get(Cache) ?? new List<PropertySmallView>()))
                    .Select(c => c.Location.City.Name + " " + c.Name).ToList().Aggregate((c, n) => c + ", " + n);
                str += $"{cities}, {properties}, {propertiescities}, {citiesproperties}";
            }
            else if(CacheBase != null)
            {
                var cities = ((List<City>)(new CitiesCache().Get(CacheBase) ?? new List<City>())).Select(c => c.CityName)
                    .ToList().Aggregate((c, n) => c + ", " + n);
                var properties =
                    ((List<PropertySmallView>)(new PropertiesCache().Get(CacheBase) ?? new List<PropertySmallView>()))
                    .Select(c => c.Name).ToList().Aggregate((c, n) => c + ", " + n);
                var propertiescities =
                    ((List<PropertySmallView>)(new PropertiesCache().Get(CacheBase) ?? new List<PropertySmallView>()))
                    .Select(c => c.Name + " " + c.Location.City.Name).ToList().Aggregate((c, n) => c + ", " + n);
                var citiesproperties =
                    ((List<PropertySmallView>)(new PropertiesCache().Get(CacheBase) ?? new List<PropertySmallView>()))
                    .Select(c => c.Location.City.Name + " " + c.Name).ToList().Aggregate((c, n) => c + ", " + n);
                str += $"{cities}, {properties}, {propertiescities}, {citiesproperties}";
            }
            return str;
        }
    }
}
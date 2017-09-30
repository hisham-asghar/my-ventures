using DBLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAOLayer
{
    public class LocationDAO
    {
        public static Dictionary<int, string> GetCountires()
        {
            using (var db = new Model())
            {
                return db.Countries.ToDictionary(c => c.CountryId, c => c.CountryName);
            }
        }
        public static Dictionary<int, string> GetCities(int countryId)
        {
            using (var db = new Model())
            {
                return db.cities.Where(c => c.CountryID == countryId).ToDictionary(c => c.CityId,c=>c.CityName);
            }
        }

        public static Dictionary<int, string> GetLocations(int cityId)
        {
            using (var db = new Model())
            {
                return db.Locations.Where(c => c.CityId == cityId).ToDictionary(c => c.LocationId, c => c.StreetName);
            }
        }

        public static List<PropertyView> GetProperties(int CountryId = 0,int CityId = 0, int LocationId = 0)
        {
            using (var db = new Model())
            {
                var list = new List<Property>();
                if(LocationId > 0)
                {
                    var loc = db.Locations.FirstOrDefault(l => l.LocationId == LocationId);
                    var data_location = db.Locations.Where(l => l.StreetName.ToLower().Trim() == loc.StreetName.ToLower().Trim());
                    list = data_location.Select(l => l.Properties.FirstOrDefault()).ToList();
                    
                }
                else if(CityId > 0)
                {
                    list = db.Locations.Where(l => l.CityId == CityId).Select(l => l.Properties.FirstOrDefault()).ToList();
                }
                else if(CountryId > 0)
                {
                    list = db.Locations.Where(l => l.city.CountryID == CountryId).Select(l => l.Properties.FirstOrDefault()).ToList();
                }
                else
                {
                    return new List<PropertyView>();
                }

                return db.PropertyViews.Where(p => list.Any(lp => lp.PropertyId == p.PropertyId)).ToList();
            }
        }
    }
}

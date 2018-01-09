using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using CustomModels.Location;
using CustomModels.PropertyModels;
using DBLayer;
using Country = CustomModels.Location.Country;
using CustomModels.SiteForms;

namespace DAOLayer
{
    public class PropertyDao
    {
        public static List<Country> GetCountryCities()
        {
            using (var db = new Model())
            {
                return db.Countries.Select(country => new Country()
                {
                    CountryId = country.CountryId,
                    CountryName = country.CountryName,
                    cities = country.cities.Select(c => new City()
                    {
                        CityId = c.CityId,
                        CityName = c.CityName
                    }).OrderBy(c => c.CityName).ToList()
                }).OrderBy(country => country.CountryName).ToList();
            }
        }
        public static List<PropertyType> GetPropertyTypes()
        {
            using (var db = new Model())
            {
                return db.PropertyTypes.ToList();
            }
        }
        public static List<PropertyType> GetPropertyTypes(int id)
        {
            using (var db = new Model())
            {
                return db.PropertyTypes.Where(p => p.ParentTypeId == id).ToList();
            }
        }

        public static List<AmenitiesType> GetAmenitiesTypes()
        {
            using (var db = new Model())
            {
                return db.AmenitiesTypes.Where(p => p.ParentTypeId != null).ToList();
            }
        }
        public static Dictionary<int,AmenitiesType> GetAmenitiesTypesDictionary()
        {
            using (var db = new Model())
            {
                return db.AmenitiesTypes.ToDictionary(k => k.AmenitiesTypeId, v => v);
            }
        }

        public static List<PriceUnit> GetPriceUnits()
        {
            using (var db = new Model())
            {
                return db.PriceUnits.ToList();
            }
        }

        public static List<Unit> GetAreaUnits()
        {
            using (var db = new Model())
            {
                return db.Units.ToList();
            }
        }

        public static bool SaveProperty(PropertiesModel model)
        {
            using (var db = new Model())
            {
                var guid = model.propertyname;
                if (!string.IsNullOrEmpty(guid))
                {
                    if (guid.Contains(" "))
                    {
                        guid = guid.Trim().ToLower();
                        guid = guid.Replace(" ", "-");
                    }
                }
                else
                {
                    guid = Guid.NewGuid().ToString();
                }
                guid = Guid.NewGuid().ToString();
                try
                {

                    var location = new DBLayer.Location()
                    {
                        CityId = model.city,
                        Latitude = model.latitude,
                        Logitude = model.longitude,
                        StreetName = model.street,
                        ZipCode = model.postalcode
                    };
                    db.Locations.Add(location);
                    db.SaveChanges();

                    var property = new Property()
                    {
                        guid = guid,
                        AreaUnit = model.areaUnit,
                        Area = model.area,
                        Banner = model.banner,
                        Description = model.description,
                        Baths = model.baths,
                        Beds = model.beds,
                        Price = model.price,
                        PriceUnit = model.priceUnit,
                        LocationId = location.LocationId,
                        TypeId = model.propertyType,
                        Title = model.propertyname,
                        SubTitle = model.propertysubname,
                        pdf = model.pdfFile
                    };
                    db.Properties.Add(property);
                    db.SaveChanges();


                    var amentiesList = model.amenities.Select(a => new Amenity()
                    {
                        AmenitiesTypeId = a,
                        PropertyId = property.PropertyId
                    }).ToList();

                    db.Amenities.AddRange(amentiesList);
                    db.SaveChanges();


                    var files = model.ImagesList.Select(img => new File()
                    {
                        FileName = img,
                        FileTypeId = 1,
                        FileTypeName = "property",
                        mimeType = "image",
                        Description = "--",
                        onCreated = DateTime.Now,
                        onModified = DateTime.Now,
                        TypeId = property.PropertyId
                    }).ToList();

                    db.Files.AddRange(files);
                    db.SaveChanges();

                    return true;
                }
                catch (DbEntityValidationException e)
                {
                    return false;
                }
                catch (Exception e)
                {
                    return false;
                }

            }
        }

        public static bool UpdateAmenity(int id, bool b)
        {
            using (var db = new Model())
            {
                var am = db.AmenitiesTypes.FirstOrDefault(a => a.AmenitiesTypeId == id);
                if (am == null)
                    return false;
                am.isActive = b;
                db.SaveChanges();
                return true;
            }
        }

        public static List<AmenitiesType> GetAmenitiesCategories()
        {
            using (var db = new Model())
            {
                return db.AmenitiesTypes.Where(a => a.ParentTypeId == null).ToList();
            }
        }

        public static AmenitiesType GetAmenitiesType(int id)
        {
            using (var db = new Model())
            {
                return db.AmenitiesTypes.FirstOrDefault(a => a.AmenitiesTypeId == id);
            }
        }

        public static List<PropertiesModelGetter> GetProperties()
        {
            using(var db = new Model())
            {
                var list = db.Properties.Select(p => new PropertiesModelGetter() { 
                    propertyid = p.PropertyId,
                    banner = p.Banner,
                    baths = p.Baths,
                    beds = p.Beds,
                    city = p.Location.city.CityName,
                    country = p.Location.city.Country.CountryName,
                    description = p.Description,
                    latitude = p.Location.Latitude,
                    longitude = p.Location.Logitude,
                    postalcode = p.Location.ZipCode,
                    propertyname = p.Title,
                    propertysubname = p.SubTitle,
                    guid = p.guid
                }).ToList();
                foreach(var p in list)
                {
                   /* p.amenities = db.Amenities.Where(a => a.PropertyId == p.propertyid)
                        .Select(a => new KeyValuePair<int, string>(a.AmenitiesTypeId, a.AmenitiesType.AmenitiesTypeName))
                        .ToList();*/
                }
                return list;
                
            }
        }


        public static string GetPropertyGuid(int id)
        {
            using (var db = new Model())
            {
                var prop =  db.Properties.FirstOrDefault(p => p.PropertyId == id);
                return prop == null ? null : prop.guid;
            }
        }


        public static PropertyDetailView GetProperty(string guid)
        {
            using (var db = new Model())
            {
                var view = db.PropertyViews.Select(p => new PropertyDetailView()
                    {
                        PropertyId = p.PropertyId,
                        guid = p.guid,
                        Banner = p.Banner,
                        Area = p.Area,
                        AreaUnit = p.AreaUnit,
                        AreaUnitName = p.AreaUnitName,
                        Baths = p.Baths,
                        Beds = p.Beds,
                        CityLatitude = p.CityLatitude,
                        CityLongitude = p.CityLongitude,
                        CityName = p.CityName,
                        Description = p.Description,
                        Latitude = p.Latitude,
                        Logitude = p.Logitude,
                        pdf = p.pdf,
                        OfferPrice = p.OfferPrice,
                        ParentTypeId = p.ParentTypeId,
                        Price = p.Price,
                        PriceUnitId = p.PriceUnitId,
                        PriceUnitName = p.PriceUnitName,
                        PropertyTypeId = p.PropertyTypeId,
                        PropertyTypeName = p.PropertyTypeName,
                        StreetName = p.StreetName,
                        VideoURL = p.VideoURL,
                        StreetNo = p.StreetNo,
                        SubTitle = p.SubTitle,
                        Title = p.Title,
                        isActive = p.isActive
                    }).FirstOrDefault(g => g.guid == guid);
                if (view == null) return null;

                // Amenties
                var listAm = db.Amenities.Where(a => a.PropertyId == view.PropertyId).Select(a => a.AmenitiesTypeId).ToList();
                var dicAm = db.AmenityViews.ToDictionary(a => a.AmenitiesTypeId, a => a);
                var pairList = new Dictionary<string, List<string>>();
                foreach (var a in listAm)
                {
                    if (pairList.ContainsKey(dicAm[a].ParentAmenitiesTypeName))
                    {
                        pairList[dicAm[a].ParentAmenitiesTypeName].Add(dicAm[a].AmenitiesTypeName);
                    }
                    else
                    {
                        pairList[dicAm[a].ParentAmenitiesTypeName] = new List<string>()
                        {
                            dicAm[a].AmenitiesTypeName
                        };
                    }
                }
                view.Amenties = pairList;

                // Images
                var listImages = db.Files.Where(p => p.TypeId == view.PropertyId && p.FileTypeId == 1)
                    .Select(p => p.FileName).ToList();
                var listPairImages = (
                    from im in listImages
                    let thumbs = im.Substring(0, im.LastIndexOf(".jpg", StringComparison.Ordinal)) + "80x80.jpg"
                    select new KeyValuePair<string, string>(im, thumbs)
                ).ToList();
                view.Images = listPairImages;
                view.Reviews = db.PropertyReviews.Where(r => r.PropertyId == view.PropertyId && r.IsVerified)
                    .Select(r => new ReviewModel()
                    {
                        Description = r.Description,
                        onCreated = r.onCreated,
                        Name = r.User.Name
                    }).OrderByDescending(r => r.onCreated).ToList();
                view.Reviews = view.Reviews ?? new List<ReviewModel>();
                return view;
            }
        }

        public static PropertyDetailView GetProperty(string guid,int ptid)
        {
            using (var db = new Model())
            {
                var view = db.PropertyViews.Where(p => p.ParentTypeId == ptid || p.PropertyTypeId == ptid)
                    .Select(p => new PropertyDetailView()
                    {
                        PropertyId = p.PropertyId,
                        guid = p.guid,
                        Banner = p.Banner,
                        Area = p.Area,
                        AreaUnit = p.AreaUnit,
                        AreaUnitName = p.AreaUnitName,
                        Baths = p.Baths,
                        Beds = p.Beds,
                        CityLatitude = p.CityLatitude,
                        CityLongitude = p.CityLongitude,
                        CityName = p.CityName,
                        Description = p.Description,
                        Latitude = p.Latitude,
                        Logitude = p.Logitude,
                        pdf = p.pdf,
                        OfferPrice = p.OfferPrice,
                        ParentTypeId = p.ParentTypeId,
                        Price = p.Price,
                        PriceUnitId = p.PriceUnitId,
                        PriceUnitName = p.PriceUnitName,
                        PropertyTypeId = p.PropertyTypeId,
                        PropertyTypeName = p.PropertyTypeName,
                        StreetName = p.StreetName,
                        StreetNo = p.StreetNo,
                        SubTitle = p.SubTitle,
                        VideoURL = p.VideoURL,
                        Title = p.Title,
                        isActive = p.isActive
                    }).FirstOrDefault(g => g.guid == guid);
                if (view == null) return null;

                // Amenties
                var listAm = db.Amenities.Where(a => a.PropertyId == view.PropertyId).Select(a => a.AmenitiesTypeId).ToList();
                var dicAm = db.AmenityViews.ToDictionary(a => a.AmenitiesTypeId, a => a);
                var pairList = new Dictionary<string, List<string>>();
                foreach (var a in listAm)
                {
                    if (pairList.ContainsKey(dicAm[a].ParentAmenitiesTypeName))
                    {
                        pairList[dicAm[a].ParentAmenitiesTypeName].Add(dicAm[a].AmenitiesTypeName);
                    }
                    else
                    {
                        pairList[dicAm[a].ParentAmenitiesTypeName] = new List<string>()
                        {
                            dicAm[a].AmenitiesTypeName
                        };
                    }
                }
                view.Amenties = pairList;

                // Images
                var listImages = db.Files.Where(p => p.TypeId == view.PropertyId && p.FileTypeId == 1)
                    .Select(p => p.FileName).ToList();
                var listPairImages = (
                            from im in listImages 
                            let thumbs = im.Substring(0, im.LastIndexOf(".jpg", StringComparison.Ordinal)) + "80x80.jpg" 
                            select new KeyValuePair<string, string>(im, thumbs)
                        ).ToList();
                view.Images = listPairImages;

                view.Reviews = db.PropertyReviews.Where(r => r.PropertyId == view.PropertyId && r.IsVerified)
                    .Select(r => new ReviewModel()
                    {
                        Description = r.Description,
                        onCreated = r.onCreated,
                        Name = r.User.Name
                    }).OrderByDescending(r => r.onCreated).ToList();
                view.Reviews = view.Reviews ?? new List<ReviewModel>();

                return view;
            }
        }

        public static List<PropertyView> GetPropertiesList()
        {
            using (var db = new Model())
            {
                return db.PropertyViews.ToList();
            }
        }
        public static List<PropertyView> GetPropertiesList(int ptid = 0)
        {
            using (var db = new Model())
            {
                return ptid == 0 
                    ? db.PropertyViews.ToList() 
                    : db.PropertyViews.Where(p => p.PropertyTypeId == ptid || p.ParentTypeId == ptid).ToList();
            }
        }

        public static double GetPriceMax(int i)
        {
            using (var db = new Model())
            {
                return db.PropertyViews.Max(p => p.CalculatedPrice) ?? 0;
            }
        }
        public static PropertyReview SaveReview(PropertyReview model,ContactForm form)
        {
            using (var db = new Model())
            {
                if(model.ReviewId > 0)
                {
                    var pm = db.PropertyReviews.FirstOrDefault(p => p.ReviewId == model.ReviewId);
                    if (pm == null) return null;
                    pm.IsVerified = model.IsVerified;
                    pm.onModified = DateTime.Now;
                    pm.Description = model.Description;
                    try
                    {
                        db.SaveChanges();
                        return pm;
                    }
                    catch (Exception e)
                    {
                        return null;
                    }
                }
                var user = db.Users.FirstOrDefault(u => u.Email == form.email) ?? new User()
                {
                    Name = form.name,
                    Email = form.email,
                    Phone = form.phone
                };
                model.User = user;
                db.PropertyReviews.Add(model);
                try
                {
                    db.SaveChanges();
                    return model;
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }

        public static bool UpdateReviewStatus(int id, bool status)
        {
            if (id <= 0)
            {
                return false;
            }
            using (var db = new Model())
            {

                var pm = db.PropertyReviews.FirstOrDefault(p => p.ReviewId == id);
                if (pm == null) return false;
                pm.IsVerified = status;
                try
                {
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    return false;
                }
                return true;
            }
        }

        public static List<PropertyReview> GetPropertyReviews(int id)
        {
            if (id <= 0)
            {
                return new List<PropertyReview>();
            }
            using (var db = new Model())
            {
                return db.PropertyReviews.Where(p => p.PropertyId == id).ToList();
            }
        }
        public static PropertyReview GetReviews(int id)
        {
            if (id <= 0)
            {
                return null;
            }
            using (var db = new Model())
            {
                return db.PropertyReviews.FirstOrDefault(p => p.ReviewId == id);
            }
        }
        public static List<PropertyReview> GetReviews()
        {
            using (var db = new Model())
            {
                return db.PropertyReviews.ToList();
            }
        }

        public static List<PropertyReview> GetUserReviews(int id)
        {
            if (id <= 0)
            {
                return new List<PropertyReview>();
            }
            using (var db = new Model())
            {
                return db.PropertyReviews.Where(p => p.UserId == id).ToList();
            }
        }
    }
}

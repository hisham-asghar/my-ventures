using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using CustomModels.SiteForms;
using DBLayer;

namespace CustomModels.PropertyModels
{

    
    public class UserView
    {
        public string Name { get; set; }
        public string Image { get; set; }
    }
    public class ReviewModel
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime onCreated { get; set; }
    }
    public class ReviewModelDetail : ReviewModel 
    {
        public int PropertyId { get; set; }
        public int UserId { get; set; }
    }

    public class PropertyDetailView : PropertyView
    {
        public List<KeyValuePair<string, string>> Images { get; set; }
        public List<KeyValuePair<UserView, string>> Comments { get; set; }
        public Dictionary<string, List<string>> Amenties { get; set; }
        public List<ReviewModel> Reviews { get; set; }
        public string SmallDescription { get; set; }

    }

    public class PropertyMail : ContactForm
    {
        public string id { get; set; }
    }

    public class PropertyBasicInfo
    {
        public int propertyId { get; set; }
        public string propertyname { get; set; }
        public string propertysubname { get; set; }
        public int propertyType { get; set; }
        public float price { get; set; }
        public float area { get; set; }
        public int areaUnit { get; set; }
        public int priceUnit { get; set; }
        public double longitude { get; set; }
        public double latitude { get; set; }
        public string street { get; set; }
        public int country { get; set; }
        public int city { get; set; }
        public long postalcode { get; set; }

    }
    public class PropertiesModel : PropertyBasicInfo
    {
        public int spacem2 { get; set; }
        public int spaceft { get; set; }
        public int beds { get; set; }
        public int baths { get; set; }
        public int toilets { get; set; }
        public string description { get; set; }
        public string videoURL { get; set; }
        public string pdfFile { get; set; }
        public string banner { get; set; }
        public List<int> amenities { get; set; }
        public List<int> tags { get; set; }
        public List<string> ImagesList { get; set; }
    }
    public class PropertiesModelGetter
    {
        public string propertyname { get; set; }
        public string propertysubname { get; set; }
        public KeyValuePair<int, string> propertyType { get; set; }
        public int maxguests { get; set; }
        public int spacem2 { get; set; }
        public int spaceft { get; set; }
        public int propertyid { get; set; }
        public int beds { get; set; }
        public int baths { get; set; }
        public int toilets { get; set; }
        public double longitude { get; set; }
        public double night { get; set; }
        public double latitude { get; set; }
        public string street { get; set; }
        public string country { get; set; }
        public string city { get; set; }
        public long postalcode { get; set; }
        public string banner { get; set; }
        public string guid { get; set; }
        public string description { get; set; }
        public List<KeyValuePair<int, string>> amenities { get; set; }
        public List<KeyValuePair<int, string>> tags { get; set; }
        public List<string> ImagesList { get; set; }
        public List<RateModel> rates { get; set; }
    }

    public class RateModel
    {
        public DateTime sd { get; set; }
        public DateTime ed { get; set; }
        public string SeasonName { get; set; }
        public double price { get; set; }
        public double guest_price { get; set; }
        public int minStay { get; set; }
    }
    public class BookingModel
    {
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public double price { get; set; }
    }

    public class UpdateExtraModel
    {
        public HttpPostedFileBase banner { get; set; }
        public HttpPostedFileBase pdf { get; set; }
        public string videoUrl { get; set; }
        public int propertyId { get; set; }
        public string bannerUrl { get; set; }
        public string pdfUrl { get; set; }
    }
}

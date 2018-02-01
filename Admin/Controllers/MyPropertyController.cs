using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using CustomModels.PropertyModels;
using DAOLayer;
using DBLayer;

namespace Admin.Controllers
{
    public class MyPropertyController : Controller
    {
        //
        // GET: /MyProperty/

        public ActionResult Index()
        {
            var list = PropertyDao.GetActivePropertiesList();
            return View(list);
        }
        public ActionResult AddNew()
        {
            ViewBag.countries = PropertyDao.GetCountryCities();
            ViewBag.propertyTypes = PropertyDao.GetPropertyTypes();
            ViewBag.amenitiesTypes = PropertyDao.GetAmenitiesTypes();
            ViewBag.units = PropertyDao.GetAreaUnits();
            ViewBag.priceunits = PropertyDao.GetPriceUnits();
            return View();
        }

        public ActionResult Delete(int id)
        {
            PropertyDao.Delete(id);
            return RedirectToAction("Index");
        }

        public ActionResult Amenities()
        {
            var list = PropertyDao.GetAmenitiesTypes();
            ViewBag.dict = PropertyDao.GetAmenitiesTypesDictionary();
            return View("Amenties", list);
        }
        public ActionResult AmenitiesU(int id, int v)
        {
            var res = PropertyDao.UpdateAmenity(id, v != 0);
            return RedirectToAction("Amenities");
        }

        [HttpGet]
        public ActionResult RenewImages(int id = 0)
        {
            if (id <= 0)
                return RedirectToAction("Index");
            var model = PropertyDao.GetPropertyBasicInfo(id);
            if (model == null) return RedirectToAction("Index");
            return View("UpdateAllImages",model);
        }

        [HttpPost]
        public ActionResult RenewImages(List<string> imagesList, int id = 0)
        {
            if (id <= 0)
                return RedirectToAction("Index");
            if (imagesList == null || imagesList.Count == 0)
                return RedirectToAction("Index");
            var res = PropertyDao.RenewPropertyImages(id, imagesList);
            if (res) return RedirectToAction("Index");

            var model = PropertyDao.GetPropertyBasicInfo(id);

            if (model == null) return RedirectToAction("Index");

            return View("UpdateAllImages", model);
        }

        
        [HttpGet]
        public ActionResult UpdateExtras(int id = 0)
        {
            if (id <= 0)
                return RedirectToAction("Index");
            var model = PropertyDao.GetPropertyExtrasViewModel(id);
            if (model == null) return RedirectToAction("Index");
            return View("UpdateExtras", model);
        }



        [HttpPost]
        public ActionResult UpdateExtras(PropertyExtrasViewModel model,int id = 0)
        {
            if (id <= 0)
                return RedirectToAction("Index");
            var res = PropertyDao.SavePropertyExtrasViewModel(id, model);
            if (res) return RedirectToAction("Index");

            var vmodel = PropertyDao.GetPropertyExtrasViewModel(id);
            if (vmodel == null) return RedirectToAction("Index");
            return View("UpdateExtras", vmodel);
        }

        [HttpGet]
        public ActionResult UpdatePropertyAmenities(int id = 0)
        {
            if (id <= 0)
                return RedirectToAction("Index");
            var model = PropertyDao.GetPropertyExtrasViewModel(id);
            if (model == null) return RedirectToAction("Index");
            return View("UpdateExtras", model);
        }



        [HttpPost]
        public ActionResult UpdatePropertyAmenities(PropertyExtrasViewModel model, int id = 0)
        {
            if (id <= 0)
                return RedirectToAction("Index");
            var res = PropertyDao.SavePropertyExtrasViewModel(id, model);
            if (res) return RedirectToAction("Index");

            var vmodel = PropertyDao.GetPropertyExtrasViewModel(id);
            if (vmodel == null) return RedirectToAction("Index");
            return View("UpdateExtras", vmodel);
        }


        public ActionResult UpdateAmenities(AmenitiesType model, int id = 0)
        {
            if (Request.HttpMethod == "POST")
            {
                if (model.ParentTypeId == 0)
                    model.ParentTypeId = null;
                PropertyDao.UpdateAmenity(model);
            }
            var list = PropertyDao.GetAmenitiesCategories();
            if (id > 0)
            {
                var modelA = PropertyDao.GetAmenitiesType(id);
                ViewBag.Model = modelA ?? new AmenitiesType()
                {
                    AmenitiesTypeId = 0,
                    ParentTypeId = 0,
                    AmenitiesTypeName = ""
                };
            }
            else
            {
                ViewBag.Model = new AmenitiesType()
                {
                    AmenitiesTypeId = 0,
                    ParentTypeId = 0,
                    AmenitiesTypeName = ""
                };
            }
            
            return View("UpdateAmenities", list);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddNewProperty(PropertiesModel model, List<HttpPostedFileBase> files, List<string> PropertyImages, HttpPostedFileBase banner, HttpPostedFileBase featuredBanner, HttpPostedFileBase headerBanner)
        {
            if (model.ImagesList == null)
                model.ImagesList = new List<string>();
            if (PropertyImages != null)
                foreach (var pic in PropertyImages)
                {
                    // model.ImagesList.Add(pic);
                }

            if (files != null)
            {
                foreach (var pic in files)
                {
                    model.pdfFile = SavePdf(pic);
                }
            }
            model.banner = SaveImage(banner);
            model.FeaturedBanner = SaveImage(featuredBanner);
            model.HeaderBanner = SaveImage(headerBanner);

            bool res = PropertyDao.SaveProperty(model);

            ViewBag.countries = PropertyDao.GetCountryCities();
            ViewBag.propertyTypes = PropertyDao.GetPropertyTypes();
            ViewBag.amenitiesTypes = PropertyDao.GetAmenitiesTypes();
            ViewBag.units = PropertyDao.GetAreaUnits();

            return RedirectToAction("AddNew");
        }

        public string SaveImage(HttpPostedFileBase pic)
        {
            if (pic == null || pic.ContentLength <= 0) return null;

            try
            {
                var fileName = Guid.NewGuid() + ".jpg";

                var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                pic.SaveAs(path);
                return fileName;
            }
            catch (Exception ex)
            {
                ViewBag.Message = "ERROR:" + ex.Message;
            }

            return null;
        }

        public string SavePdf(HttpPostedFileBase pic)
        {
            if (pic == null || pic.ContentLength <= 0) return null;

            try
            {
                var fileName = Guid.NewGuid() + ".pdf";

                var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                pic.SaveAs(path);
                return fileName;
            }
            catch (Exception ex)
            {
                ViewBag.Message = "ERROR:" + ex.Message;
            }

            return null;
        }
    }
}

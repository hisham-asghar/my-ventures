using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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
            var list = PropertyDao.GetPropertiesList();
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

        public ActionResult Amenities()
        {
            var list = PropertyDao.GetAmenitiesTypes();
            ViewBag.dict = PropertyDao.GetAmenitiesTypesDictionary();
            return View("City", list);
        }
        public ActionResult AmenitiesU(int id, int v)
        {
            var res = PropertyDao.UpdateAmenity(id, v != 0);
            return RedirectToAction("Amenities");
        }
        public ActionResult UpdateAmenities(int id,AmenitiesType model)
        {
            if (Request.HttpMethod == "POST")
            {
                
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
            
            return View("CityEdit", list);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddNewProperty(PropertiesModel model, List<HttpPostedFileBase> files, List<string> PropertyImages, HttpPostedFileBase banner)
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
                    if ((pic != null) && (pic.ContentLength > 0))
                    {
                        try
                        {
                            var fileName = Guid.NewGuid() + ".pdf";

                            var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                            pic.SaveAs(path);
                            model.pdfFile = fileName;
                        }
                        catch (Exception ex)
                        {
                            ViewBag.Message = "ERROR:" + ex.Message;
                        }
                    }
                }
            }
            if (banner != null)
            {
                var pic = banner;
                if ((pic.ContentLength > 0))
                {
                    try
                    {
                        var fileName = Guid.NewGuid() + ".jpg";

                        var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                        pic.SaveAs(path);
                        model.banner = fileName;
                    }
                    catch (Exception ex)
                    {
                        ViewBag.Message = "ERROR:" + ex.Message;
                    }
                }
            }
            bool res = PropertyDao.SaveProperty(model);

            ViewBag.countries = PropertyDao.GetCountryCities();
            ViewBag.propertyTypes = PropertyDao.GetPropertyTypes();
            ViewBag.amenitiesTypes = PropertyDao.GetAmenitiesTypes();
            ViewBag.units = PropertyDao.GetAreaUnits();

            return RedirectToAction("AddNew");
        }

    }
}

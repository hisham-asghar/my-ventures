using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAOLayer;

namespace MYVentures.Controllers
{
    public class HomesController : Controller
    {
        //
        // GET: /MYHomes/

        public ActionResult Index(string search,int smin = 0,int smax = 0)
        {
            var list = PropertyDao.GetPropertiesList(1);
            ViewBag.propertyTypeTags = PropertyDao.GetPropertyTypes(1);
            var max = Math.Floor(PropertyDao.GetPriceMax(1));
            ViewBag.PriceMax = max;
            if (Request.HttpMethod == "POST")
            {
                var priceFilter =  Request.Form["priceFilter"];
                if (smin > 0)
                {
                    list = list.Where(p => p.CalculatedPrice >= smin).ToList();
                }
                ViewBag.SPriceMin = smin;

                if (smax > 0)
                {
                    list = list.Where(p => p.CalculatedPrice <= smax).ToList();
                    ViewBag.SPriceMax = smax;
                }
                else
                {
                    ViewBag.SPriceMax = max;
                }
                search = search.Trim();
                if (!string.IsNullOrWhiteSpace(search))
                {
                    list = search.Split(' ').Aggregate(list, (current, s) => current.Where(p => p.StreetName.Contains(s) || p.CityName.Contains(s)).ToList());
                }
                ViewBag.searchKeyword = search;
            }
            else
            {
                ViewBag.SPriceMax = max;
                ViewBag.SPriceMin = 0;
                ViewBag.searchKeyword = "";
            }


            ViewBag.PageType = "MY Homes";
            ViewBag.BarType = "Homes";

            return View(list);
        }
        // GET: /MYHomes/

        public ActionResult Detail()
        {
            if (Request.Url == null) 
                return RedirectToAction("Index");

            if (Request.Url.Segments.Length < 4)
            {
                return RedirectToAction("Index");
            }

            var property = PropertyDao.GetProperty(Request.Url.Segments[3],1);
            if (property == null)
            {
                return RedirectToAction("Index");
            }
            property.SmallDescription = property.Description.Length > 400 ? property.Description.Substring(0, 400) : property.Description;
            return View(property);
        }

    }
}

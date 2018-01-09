using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAOLayer;

namespace MYVentures.Controllers
{
    [Attributes.GZipOrDeflate]
    public class FAQController : Controller
    {
        //
        // GET: /FAQ/

        public ActionResult Index()
        {
            var list = FAQDAO.getAllFAQ();
            return View("~/Views/Home/FAQ.cshtml",list);
        }

    }
}

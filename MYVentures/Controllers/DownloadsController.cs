using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAOLayer;

namespace MYVentures.Controllers
{
    [Attributes.GZipOrDeflate]
    public class DownloadsController : Controller
    {
        //
        // GET: /Downloads/

        public ActionResult Index()
        {
            var list = FilesDAO.GetAll(3);
            return View(list);
        }

    }
}

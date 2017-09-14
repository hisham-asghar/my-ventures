using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CustomModels;
using DAOLayer;

namespace MYVentures.Controllers
{
    public class AboutController : Controller
    {
        //
        // GET: /About/

        public ActionResult Index()
        {
            return View("~/Views/Home/About.cshtml");
        }
        [ActionName("ceo-message")]
        public ActionResult ChairmansMessage()
        {

            var mainMetas = SiteMetaDAO.getMetaChilds("CEO");
            var model = new CeoModel
            {
                image = Helper.getDicData(mainMetas, "ceo_image"),
                email = Helper.getDicData(mainMetas, "ceo_email"),
                name = Helper.getDicData(mainMetas, "ceo_name"),
                message = Helper.getDicData(mainMetas, "ceo_message"),
                phone = Helper.getDicData(mainMetas, "ceo_phone")
            };

            return View("chairmans-message",model);
        }

        public ActionResult History()
        {
            return View(HistoryDAO.GetAll());
        }

        public ActionResult Team()
        {
            return View("Team");
        }
    }
}

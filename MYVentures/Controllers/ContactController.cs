using System.Web.Mvc;
using CustomModels;
using DAOLayer;

namespace MYVentures.Controllers
{
    public class ContactController : Controller
    {
        public ActionResult Index()
        {
            var listSection = SiteMetaDAO.getMetaChilds("Contact_Page");
            var txt = Helper.getDicData(listSection, "contact_location");
            if (txt.MetaText.Contains("\n"))
            {
                txt.MetaText = txt.MetaText.Replace("\n", "<br />");
            }
            ViewBag.location = txt;

            txt = Helper.getDicData(listSection, "contact_phone");
            if (txt.MetaText.Contains("\n"))
            {
                txt.MetaText = txt.MetaText.Replace("\n", "<br />");
            }
            ViewBag.phone = txt;

            ViewBag.open = Helper.getDicData(listSection, "contact_open");
            ViewBag.email = Helper.getDicData(listSection, "contact_email");
            return View("~/Views/Home/Contact.cshtml");
        }
    }
}
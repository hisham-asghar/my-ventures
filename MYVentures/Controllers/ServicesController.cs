using System.Web.Mvc;

namespace MYVentures.Controllers
{
    [Attributes.GZipOrDeflate]
    public class ServicesController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
using System.Web.Mvc;

namespace MYVentures.Controllers
{
    [Attributes.GZipOrDeflate]
    public class BlogsController : Controller
    {
        public ActionResult Index()
        {
            return View("~/Views/Home/Blogs.cshtml");
        }

        public ActionResult Detail(string guid)
        {
            if (!string.IsNullOrWhiteSpace(guid))
                return View("~/Views/Home/BlogDetails.cshtml");
            return RedirectToAction("Index");
        }
    }
}
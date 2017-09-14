using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Admin.Controllers
{
    public class ServicesController : Controller
    {
        //
        // GET: /Services/

        public ActionResult Index()
        {
            var list = DAOLayer.ServicesDAO.getAll();
            return View(list);
        }

        public ActionResult Update(HttpPostedFileBase small,DBLayer.Service model,int id = 0)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                model.Image = SaveImage(small);
                DAOLayer.ServicesDAO.Save(model);
                return RedirectToAction("Index");
            }

            if (id == 0)
            {
                return View("Update", new DBLayer.Service()
                {
                    ServiceId = 0,
                    ServiceName = "",
                    ServiceText = "",
                    Image = "image_placeholder.jpg"
                });
            }


            var faq = DAOLayer.ServicesDAO.get(id);
            if (faq == null)
            {
                return RedirectToAction("Index");
            }
            
            if (string.IsNullOrWhiteSpace(faq.Image))
                faq.Image = "image_placeholder.jpg";

            return View("Update", faq);
        }

        private string SaveImage(HttpPostedFileBase pic)
        {

            if (pic != null && pic.ContentLength > 0)
            {
                try
                {
                    var fileName = Guid.NewGuid() + ".jpg";
                    var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                    pic.SaveAs(path);
                    return fileName;
                }
                catch (Exception){ }
            }
            return "";
        }

    }
}

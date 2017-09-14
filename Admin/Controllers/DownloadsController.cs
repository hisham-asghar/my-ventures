using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAOLayer;

namespace Admin.Controllers
{
    public class DownloadsController : Controller
    {
        //
        // GET: /Downloads/

        public ActionResult Index()
        {
            var list = FilesDAO.GetAll(3);
            return View(list);
        }
        public ActionResult Update(DBLayer.File model, HttpPostedFileBase small, int id = 0)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                var name = SaveImage(small);
                model.FileName = name;
                model.onModified = DateTime.Now;
                model.onCreated = DateTime.Now;
                model.FileTypeId = 3;
                model.FileTypeName = "Downloads";
                FilesDAO.Save(model);
                return RedirectToAction("Index");
            }
            return id == 0
                ? View("Update", new DBLayer.File()
                {
                    FileId = 0,
                    FileName = null
                })
                : View("Update", FilesDAO.Get(id, 2) ?? new DBLayer.File()
                {
                    FileId = 0,
                    FileName = null
                });
        }

        private string SaveImage(HttpPostedFileBase pic)
        {
            if (pic == null || pic.ContentLength <= 0) return "";
            try
            {
                var fileName = Guid.NewGuid() + "." +
                               pic.ContentType.Substring(pic.ContentType.LastIndexOf('/') + 1);
                var path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                pic.SaveAs(path);
                return fileName;
            }
            catch (Exception e)
            {
                return "";
            }
        }
    }
}

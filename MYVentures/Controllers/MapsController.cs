using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DAOLayer;

namespace MYVentures.Controllers
{
    public class MapsController : Controller
    {
        //
        // GET: /MYMaps/

        public ActionResult Index()
        {
            var list = FilesDAO.GetAll(2);
            return View(list);
        }

        public ActionResult Download(int id = 0)
        {
            var file = FilesDAO.Get(id, 2);
            if(file == null)
                return new EmptyResult();
            var filepath = Helpers.CustomActions.GetUploadLocation() + "/" + file.FileName;

            var lxRequest = (HttpWebRequest)WebRequest.Create(filepath);

            // returned values are returned as a stream, then read into a string
            var lsResponse = string.Empty;
            using (var lxResponse = (HttpWebResponse)lxRequest.GetResponse())
            {
                using (var reader = new BinaryReader(lxResponse.GetResponseStream()))
                {
                    
                    try
                    {
                        var lnByte = reader.ReadBytes(1 * 1024 * 1024 * 10);
                        return File(lnByte, "image/jpeg", file.mimeType+".jpg");
                    }
                    catch (Exception e)
                    {
                        return new EmptyResult();
                    }
                }
            }

        }

    }
}

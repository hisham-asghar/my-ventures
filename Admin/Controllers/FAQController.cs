using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Admin.Controllers
{
    public class FAQController : Controller
    {
        //
        // GET: /FAQ/

        public ActionResult Index()
        {
            var list = DAOLayer.FAQDAO.getAllFAQ();
            return View(list);
        }
        public ActionResult Update(DBLayer.FAQ model, int id = 0)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                DAOLayer.FAQDAO.SaveFAQ(model);
                return RedirectToAction("Index");
            }

            if(id == 0)
            {
                return View("Update", new DBLayer.FAQ()
                {
                    FAQid = 0,
                    Question = "",
                    Answer = ""
                });
            }


            DBLayer.FAQ faq = DAOLayer.FAQDAO.getFAQ(id);
            if(faq == null)
            {
                return RedirectToAction("Index");
            }
            return View("Update",faq);
        }

    }
}

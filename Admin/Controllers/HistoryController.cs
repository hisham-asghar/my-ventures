using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAOLayer;
using DBLayer;

namespace Admin.Controllers
{
    public class HistoryController : Controller
    {
        //
        // GET: /History/

        public ActionResult Index()
        {
            var list = HistoryDAO.GetAll();
            return View(list);
        }

        public ActionResult Update(History model,int id = 0)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                if (!(string.IsNullOrWhiteSpace(model.Text) && string.IsNullOrWhiteSpace(model.Title)))
                {
                    HistoryDAO.Save(model);
                }
                return RedirectToAction("Index");
            }
            
            return id <= 0 ? View(new History()) : View(HistoryDAO.Get(id) ?? new History());
        }

    }
}

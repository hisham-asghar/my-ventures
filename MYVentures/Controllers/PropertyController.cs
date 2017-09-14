using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CustomModels;
using CustomModels.PropertyModels;
using CustomModels.SiteForms;
using DBLayer;

namespace MYVentures.Controllers
{
    public class PropertyController : Controller
    {
        //
        // GET: /Property/

        public ActionResult GetProperties()
        {
            var list = DAOLayer.PropertyDao.GetPropertiesList();
            foreach (var p in list)
            {
                p.Banner = Helpers.CustomActions.GetUploadLocation() + p.Banner;
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetPropertyDetail(string guid)
        {
            var list = DAOLayer.PropertyDao.GetProperty(guid,1);
            /*foreach (var p in list)
            {
                p.Banner = Helpers.CustomActions.getUploadLocation() + p.Banner;
            }*/
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ActionResult MsgRequest(PropertyMail model)
        {
            var domainStr = Helpers.CustomActions.GetDomainName();
            var list = DAOLayer.PropertyDao.GetProperty(model.id);

            var str = "Name: " + model.name + "<br/>";
            str += "Email: " + model.email + "<br/>";
            str += "Phone: " + model.phone + "<br/>";
            str += "Property ID: " + list.guid + "<br/>";
            str += "Property Type: " + list.PropertyTypeName + "<br/>";
            str += "Property Address: " + list.StreetName + ", " + list.CityName + "<br/>";
            str += "Message: " + model.message + "<br/>";

            Helpers.EmailHelper.SendMail(new SendEmailModel()
            {
                To = Helpers.CustomActions.GetclientsRequestDestination(),
                Body = str,
                Subject = "Client Property Request From MYVentures"
            });
            var text = "We have recieved your message and will contact you soon...";
            var htmlText = "<div class=\"alert alert-success alert-dismissible wow fadeInUp\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>{0}</div>";
            text = String.Format(htmlText, text);
            var boxid = Request.Form["BoxId"];
            return string.IsNullOrWhiteSpace(boxid)
                ? Json(text, JsonRequestBehavior.AllowGet)
                : Json(new
                {
                    id = boxid,
                    text
                }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult PostReview(int id = 0, bool status = false)
        {
            if (id <= 0)
                return RedirectToAction("Index", "Home");
            DAOLayer.PropertyDao.UpdateReviewStatus(id, status);
            var res = DAOLayer.PropertyDao.GetReviews(id);
            if(res == null)
                return RedirectToAction("Index", "Home");
            var prop = DAOLayer.PropertyDao.GetPropertyGuid(res.ReviewId);
            return prop == null ? RedirectToAction("Index", "Home") : RedirectToAction("Detail", "Homes", new {@id = prop});
        }

        public ActionResult Review(PropertyMail model)
        {
            
            var list = DAOLayer.PropertyDao.GetProperty(model.id);
            var res = DAOLayer.PropertyDao.SaveReview(new PropertyReview()
            {
                PropertyId = list.PropertyId,
                Description = model.message,
                onCreated = DateTime.Now,
                onModified = DateTime.Now,
                IsVerified = false
            }, new ContactForm()
            {
                email = model.email,
                name = model.name,
                phone = model.phone,
                message = model.message
            });
            var domainStr = Helpers.CustomActions.GetDomainName();
            var str = "Name: " + model.name + "<br/>";
            str += "Email: " + model.email + "<br/>";
            str += "Phone: " + model.phone + "<br/>";
            str += "Property ID: " + list.guid + "<br/>";
            str += "Property Type: " + list.PropertyTypeName + "<br/>";
            str += "Property Address: " + list.StreetName + ", " + list.CityName + "<br/>";
            str += "Property Link: <a href='" + domainStr + "/Homes/Detail/" + list.guid + "'>Click To View</a><br/>";
            str += "Review Status: <a href='" + domainStr + "/Property/PostReview?id=" + res.ReviewId + "&status=true'>Click To Verify</a> <a href='" + domainStr + "/Property/PostReview?id=" + res.ReviewId + "&status=false'>Click To Delete</a><br/>";
            str += "Review Message: " + model.message + "<br/>";
            
            Helpers.EmailHelper.SendMail(new SendEmailModel()
            {
                To = Helpers.CustomActions.GetclientsRequestDestination(),
                Body = str,
                Subject = "Client Property Review From MYVentures"
            });
            var text = "Your review will be added, once verified";
            var htmlText = "<div class=\"alert alert-success alert-dismissible wow fadeInUp\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>{0}</div>";
            text = String.Format(htmlText, text);
            var boxid = Request.Form["BoxId"];
            return string.IsNullOrWhiteSpace(boxid)
                ? Json(text, JsonRequestBehavior.AllowGet)
                : Json(new
                {
                    id = boxid,
                    text
                }, JsonRequestBehavior.AllowGet);
        }

    }
}

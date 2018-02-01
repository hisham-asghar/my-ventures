using System;
using System.Collections.Generic;
using System.Web.Mvc;
using CustomModels;
using CustomModels.SiteForms;
using DAOLayer;
using MailChimp;
using MailChimp.Helper;
using MYVentures.Helpers;
using Newtonsoft.Json;

namespace MYVentures.Controllers
{

    [Attributes.GZipOrDeflate]
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult SendMessage(ContactForm model)
        {
            var dbSave = false;
            UserDAO.SaveContactMessage(model);

            var str = "Name: " + model.name + "<br/>";
            str += "Email: " + model.email + "<br/>";
            str += "Phone: " + model.phone + "<br/>";
            str += "Message: " + model.message + "<br/>";

            var mailSend = EmailHelper.SendMail(new SendEmailModel
            {
                To = CustomActions.GetclientsRequestDestination(),
                Body = str,
                Subject = "Client Request From MYVentures"
            });


            MailChimpHelper.SubscribeUser(model.email, "df5b833e6d");

            var boxid = Request.Form["BoxId"];
            
            try
            {
                var mailSendFlag = (bool) mailSend;
                if (mailSendFlag)
                {
                    const string res = "<div class=\"alert alert-success alert-dismissible wow fadeInUp\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>We have recieved your message and will contact you soon...</div>";
                    
                    return string.IsNullOrWhiteSpace(boxid)
                        ? Json(res, JsonRequestBehavior.AllowGet)
                        : Json(new
                        {
                            id = boxid,
                            res
                        }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception e)
            {
                
            }
            const string resF = "<div class=\"alert alert-danger alert-dismissible wow fadeInUp\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button> Service is not available right now. Please use contact number or Try again </div>";
            
            return string.IsNullOrWhiteSpace(boxid)
                ? Json(resF, JsonRequestBehavior.AllowGet)
                : Json(new
                {
                    id = boxid,
                    resF
                }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Subscribe(ContactForm model)
        {
            model.name = model.email.Substring(0, model.email.IndexOf('@'));

            MailChimpHelper.SubscribeUser(model.email, "df5b833e6d");
            UserDAO.Subscribe(model);

            
            var text = "You have been subscribed for our newsletter...";
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

        public ActionResult TestMailChimp(string str = "tagheir@gmail.com")
        {

            var mc = new MailChimpManager(CustomActions.GetMailChimpApiKey());

            //	Create the email parameter
            var emailParam = new EmailParameter()
            {
                Email = str

            };
            try
            {

                var results = mc.Subscribe("df5b833e6d", emailParam);

                return Json(results, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(e.ToString(), JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Index()
        {

            var listSection = SiteMetaDAO.getMetaChilds("Index_Page");

            var headerList = new List<MainPageSection2>();
            var imageList = new List<string>();
            var headerData = new List<MainPageHeaderSection>();
            for (var i = 1 ; i <= 5; i++)
            {
                
                var sectionItem = new MainPageSection2
                {
                    link = Helper.getDicData(listSection, "section_1_" + i + "_img").MetaText,
                    head = Helper.getDicData(listSection, "section_1_" + i + "_head").MetaText,
                    text = Helper.getDicData(listSection, "section_1_" + i + "_text").MetaText
                };
                if (sectionItem.text.Contains("\n"))
                    sectionItem.text = sectionItem.text.Replace("\n", "<br />");
                var str = CustomActions.GetUploadLocation() + (sectionItem.link == "" ? "image_placeholder.jpg" : sectionItem.link);
                imageList.Add(str);
                headerList.Add(sectionItem);
                headerData.Add(new MainPageHeaderSection()
                {
                    path = str,
                    text = sectionItem.text,
                    title = sectionItem.head
                });
            }
            ViewBag.HeaderList = headerList;
            ViewBag.ServiceHead = JsonConvert.SerializeObject(headerData);

            ViewBag.imgList = JsonConvert.SerializeObject(imageList);             

            ViewBag.Wimg = Helper.getDicData(listSection, "section_welcome_img");
            ViewBag.Whead = Helper.getDicData(listSection, "section_welcome_head");
            var txt = Helper.getDicData(listSection, "section_welcome_text");
            if (txt.MetaText.Contains("\n"))
            {
                txt.MetaText = txt.MetaText.Replace("\n", "<br />");
            }
            ViewBag.Wtext = txt;

            ViewBag.Eimg1 = Helper.getDicData(listSection, "section_Exclusive_1_img");
            ViewBag.Ehead1 = Helper.getDicData(listSection, "section_Exclusive_1_head");
            ViewBag.Etext1 = Helper.getDicData(listSection, "section_Exclusive_1_text");
            ViewBag.Elink1 = Helper.getDicData(listSection, "section_Exclusive_1_link");

            ViewBag.Eimg2 = Helper.getDicData(listSection, "section_Exclusive_2_img");
            ViewBag.Ehead2 = Helper.getDicData(listSection, "section_Exclusive_2_head");
            ViewBag.Etext2 = Helper.getDicData(listSection, "section_Exclusive_2_text");
            ViewBag.Elink2 = Helper.getDicData(listSection, "section_Exclusive_2_link");

            ViewBag.Eimg3 = Helper.getDicData(listSection, "section_Exclusive_3_img");
            ViewBag.Ehead3 = Helper.getDicData(listSection, "section_Exclusive_3_head");
            ViewBag.Etext3 = Helper.getDicData(listSection, "section_Exclusive_3_text");
            ViewBag.Elink3 = Helper.getDicData(listSection, "section_Exclusive_3_link");

            txt = Helper.getDicData(listSection, "contact_location");
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
            ViewBag.AddressBackgroundImage = Helper.getDicData(listSection, "section_address_background_image");

            return View();
        }
        
        public ActionResult About()
        {
            return RedirectToAction("Index","About");
        }
       
        public ActionResult Test(string to = "zeeshan@myventures.pk")
        {
            //Execute();
            var res = EmailHelper.SendMail(new SendEmailModel
            {
                Body = "Body Testing",
                Subject = "Subject Testing",
                To = to
            });
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Contact()
        {
            return RedirectToAction("Index","Contact");
        }
        
        public ActionResult FAQ()
        {
            return RedirectToAction("Index", "FAQ");
        }
        
        public ActionResult Blogs(string guid)
        {
            return RedirectToAction("Detail", "Blogs", new {guid});
        }
        
        public ActionResult Team()
        {
            return RedirectToAction("Team", "About");
        }

    }

}

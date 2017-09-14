using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CustomModels;
using CustomModels.SiteForms;
using DAOLayer;
using System.IO;

namespace Admin.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult ExclusvieOffers(List<MainPageSection2> list)
        {
            if (Request.HttpMethod == "POST" && list != null)
            {
                var parents = new List<string>()
                {
                    "Index_Section_Exclusive",
                    "Index_Page"
                };
                int i = 1;
                foreach (var section in list)
                {
                    var img = saveImage(section.img);
                    if (img != null)
                    {
                        SiteMetaDAO.SaveMeta(new Meta()
                        {
                            MetaName = "section_Exclusive_" + i + "_img",
                            MetaText = img
                        }, parents);
                    }

                    SiteMetaDAO.SaveMeta(new Meta()
                    {
                        MetaName = "section_Exclusive_" + i + "_head",
                        MetaText = section.head
                    }, parents);

                    SiteMetaDAO.SaveMeta(new Meta()
                    {
                        MetaName = "section_Exclusive_" + i + "_text",
                        MetaText = section.text
                    }, parents);

                    SiteMetaDAO.SaveMeta(new Meta()
                    {
                        MetaName = "section_Exclusive_" + i + "_link",
                        MetaText = section.link
                    }, parents);

                    i++;
                }
            }

            var listSection = DAOLayer.SiteMetaDAO.getMetaChilds("Index_Section_Exclusive");

            ViewBag.img1 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_1_img");
            ViewBag.head1 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_1_head");
            ViewBag.text1 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_1_text");
            ViewBag.link1 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_1_link");

            ViewBag.img2 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_2_img");
            ViewBag.head2 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_2_head");
            ViewBag.text2 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_2_text");
            ViewBag.link2 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_1_link");

            ViewBag.img3 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_3_img");
            ViewBag.head3 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_3_head");
            ViewBag.text3 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_3_text");
            ViewBag.link3 = CustomModels.Helper.getDicData(listSection, "section_Exclusive_1_link");

            return View();
        }

        public ActionResult Welcome(MainPageSection model)
        {
            if (Request.HttpMethod == "POST" && model != null)
            {
                var parents = new List<string>()
                {
                    "Index_Section_Welcome",
                    "Index_Page"
                };

                var section = model;

                var img = saveImage(section.img);
                if (img != null)
                {
                    SiteMetaDAO.SaveMeta(new Meta()
                    {
                        MetaName = "section_welcome_img",
                        MetaText = img
                    }, parents);
                }

                SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "section_welcome_head",
                    MetaText = section.head
                }, parents);

                SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "section_welcome_text",
                    MetaText = section.text
                }, parents);
            }

            var listSection = DAOLayer.SiteMetaDAO.getMetaChilds("Index_Section_Welcome");

            ViewBag.img = CustomModels.Helper.getDicData(listSection, "section_welcome_img");
            ViewBag.head = CustomModels.Helper.getDicData(listSection, "section_welcome_head");
            ViewBag.text = CustomModels.Helper.getDicData(listSection, "section_welcome_text");

            return View();
        }

        public ActionResult Header(List<MainPageSection> list)
        {
            if(Request.HttpMethod == "POST" && list != null)
            {
                var parents = new List<string>()
                {
                    "Index_Section_1",
                    "Index_Page"
                };
                int i = 1;
                foreach(var section in list)
                {
                    var img = saveImage(section.img);
                    if(img != null)
                    {
                        SiteMetaDAO.SaveMeta(new Meta()
                        {
                            MetaName = "section_1_" + i + "_img",
                            MetaText = img
                        }, parents);
                    }
                    
                    SiteMetaDAO.SaveMeta(new Meta()
                    {
                        MetaName = "section_1_"+i+"_head",
                        MetaText = section.head
                    }, parents);
                    
                    SiteMetaDAO.SaveMeta(new Meta()
                    {
                        MetaName = "section_1_"+i+"_text",
                        MetaText = section.text
                    }, parents);

                    i++;
                }
            }

            var listSection = DAOLayer.SiteMetaDAO.getMetaChilds("Index_Section_1");

            ViewBag.img1 = CustomModels.Helper.getDicData(listSection, "section_1_1_img");
            ViewBag.head1 = CustomModels.Helper.getDicData(listSection, "section_1_1_head");
            ViewBag.text1 = CustomModels.Helper.getDicData(listSection, "section_1_1_text");

            ViewBag.img2 = CustomModels.Helper.getDicData(listSection, "section_1_2_img");
            ViewBag.head2 = CustomModels.Helper.getDicData(listSection, "section_1_2_head");
            ViewBag.text2 = CustomModels.Helper.getDicData(listSection, "section_1_2_text");

            ViewBag.img3 = CustomModels.Helper.getDicData(listSection, "section_1_3_img");
            ViewBag.head3 = CustomModels.Helper.getDicData(listSection, "section_1_3_head");
            ViewBag.text3 = CustomModels.Helper.getDicData(listSection, "section_1_3_text");

            ViewBag.img4 = CustomModels.Helper.getDicData(listSection, "section_1_4_img");
            ViewBag.head4 = CustomModels.Helper.getDicData(listSection, "section_1_4_head");
            ViewBag.text4 = CustomModels.Helper.getDicData(listSection, "section_1_4_text");

            ViewBag.img5 = CustomModels.Helper.getDicData(listSection, "section_1_5_img");
            ViewBag.head5 = CustomModels.Helper.getDicData(listSection, "section_1_5_head");
            ViewBag.text5 = CustomModels.Helper.getDicData(listSection, "section_1_5_text");

            return View();
        }
        
        public ActionResult Contact()
        {

            if (Request.HttpMethod == "POST")
            {
                var parents = new List<string>()
                {
                    "Contact_Panel",
                    "Contact_Page",
                    "Index_Page"
                };
                ViewBag.location = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "contact_location",
                    MetaText = Request.Form["contact_location"]
                }, parents);

                ViewBag.phone = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "contact_phone",
                    MetaText = Request.Form["contact_phone"]
                }, parents);

                ViewBag.open = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "contact_open",
                    MetaText = Request.Form["contact_open"]
                }, parents);

                ViewBag.email = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "contact_email",
                    MetaText = Request.Form["contact_email"]
                }, parents);
            }
            else
            {
                var mainMetas = SiteMetaDAO.getMetaChilds("Contact_Page");

                ViewBag.location = Helper.getDicData(mainMetas, "contact_location");
                ViewBag.phone = Helper.getDicData(mainMetas, "contact_phone");
                ViewBag.open = Helper.getDicData(mainMetas, "contact_open");
                ViewBag.email = Helper.getDicData(mainMetas, "contact_email");
            }

            return View();
        }

        private string saveImage(HttpPostedFileBase pic)
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
                catch (Exception)
                {
                    return null;
                }
            }
            else
                return null;
        }


        public ActionResult AboutSmall()
        {
            if (Request.HttpMethod == "POST")
            {
                var parents = new List<string>()
                {
                    "About_Panel",
                    "About_Page",
                    "Index_Page"
                };
                ViewBag.about = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "about_small",
                    MetaText = Request.Form["about_small"]
                }, parents);
            }
            else
            {
                ViewBag.about = SiteMetaDAO.getMeta("about_small");
            }

            return View();
        }

        public ActionResult CeoMessage(HttpPostedFileBase img)
        {
            if (Request.HttpMethod == "POST")
            {
                var parents = new List<string>()
                {
                    "CEO"
                };
                ViewBag.message = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "ceo_message",
                    MetaText = Request.Form["ceo_message"]
                }, parents);

                ViewBag.name = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "ceo_name",
                    MetaText = Request.Form["ceo_name"]
                }, parents);

                ViewBag.phone = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "ceo_phone",
                    MetaText = Request.Form["ceo_phone"]
                }, parents);

                ViewBag.email = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "ceo_email",
                    MetaText = Request.Form["ceo_email"]
                }, parents);

                var imageStr = saveImage(img);
                ViewBag.image = SiteMetaDAO.SaveMeta(new Meta()
                {
                    MetaName = "ceo_image",
                    MetaText = imageStr
                }, parents) ?? new Meta()
                {

                    MetaName = "ceo_image",
                    MetaText = imageStr
                };
            }
            else
            {
                var mainMetas = SiteMetaDAO.getMetaChilds("CEO");

                ViewBag.image = Helper.getDicData(mainMetas, "ceo_image");
                ViewBag.email = Helper.getDicData(mainMetas, "ceo_email");
                ViewBag.name = Helper.getDicData(mainMetas, "ceo_name");
                ViewBag.message = Helper.getDicData(mainMetas, "ceo_message");
                ViewBag.phone = Helper.getDicData(mainMetas, "ceo_phone");
            }
            return View();
        }
    }
}

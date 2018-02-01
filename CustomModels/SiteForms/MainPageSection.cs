using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace CustomModels.SiteForms
{
    public class MainPageSection
    {
        public HttpPostedFileBase img { get; set; }
        public string head { get; set; }
        public string text { get; set; }
    }
    public class MainPageSection2 : MainPageSection
    {
        public string link { get; set; }
    }
    public class MainPageHeaderSection
    {
        public string path { get; set; }
        public string title { get; set; }
        public string text { get; set; }
    }
}

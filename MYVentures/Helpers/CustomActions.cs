using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MYVentures.Helpers
{
    public class CustomActions
    {

        public static string GetDomainName()
        {
            return System.Configuration.ConfigurationManager.AppSettings["DomainName"];
        }
        public static string GetUploadLocation()
        {
            return System.Configuration.ConfigurationManager.AppSettings["uploadLoc"];
        }
        public static string GetGodaddyLocation()
        {
            return System.Configuration.ConfigurationManager.AppSettings["SecLoc"];
        }
        public static string GetGodaddyEmailLocation()
        {
            return System.Configuration.ConfigurationManager.AppSettings["MailLoc"];
        }
        public static string GetclientsRequestDestination()
        {
            return System.Configuration.ConfigurationManager.AppSettings["clientsRequest"];
        }

        public static string GetMailChimpApiKey()
        {
            return System.Configuration.ConfigurationManager.AppSettings["MailChimpKey"];
        }
    }
}
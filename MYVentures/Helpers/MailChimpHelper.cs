using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MailChimp;
using MailChimp.Helper;
using MailChimp.Lists;

namespace MYVentures.Helpers
{
    public class MailChimpHelper
    {
        public static bool SubscribeUser(string email, string listId)
        {

            var mc = new MailChimpManager(CustomActions.GetMailChimpApiKey());

            //	Create the email parameter
            var emailParam = new EmailParameter()
            {
                Email = email

            };
            try
            {
                var results = mc.Subscribe(listId, emailParam);
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }
        public static ListResult GetAllLists()
        {

            var mc = new MailChimpManager(CustomActions.GetMailChimpApiKey());

            try
            {
                return mc.GetLists();
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public static MembersResult GetAllMembersList(string listId, string subscribed = "subscribed", int startIdx = 0, int limit = 25)
        {

            var mc = new MailChimpManager(CustomActions.GetMailChimpApiKey());

            try
            {
                var list = mc.GetAllMembersForList(listId, subscribed, startIdx, limit);
                return list;
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
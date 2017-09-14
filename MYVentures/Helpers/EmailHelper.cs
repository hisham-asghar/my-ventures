using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Text;
using CustomModels;
using Newtonsoft.Json;

namespace MYVentures.Helpers
{
    public class EmailHelper
    {
        public static object SendMail(SendEmailModel model)
        {
            var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");


            var htmlView = AlternateView.CreateAlternateViewFromString(model.Body);
            htmlView.ContentType = new System.Net.Mime.ContentType("text/html");

            var mail = new MailMessage
            {
                From = new MailAddress(smtpSection.From),
                IsBodyHtml = true,
                Subject = model.Subject,
                Body = model.Body
            };
            //mail.AlternateViews.Add(htmlView);
            mail.To.Add(new MailAddress(model.To));

            var smtp = new SmtpClient
            {
                Port = smtpSection.Network.Port,
                EnableSsl = smtpSection.Network.EnableSsl,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(mail.From.ToString(), smtpSection.Network.Password),
                Host = smtpSection.Network.Host
            };
            smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
            
            try { smtp.Send(mail); }
            catch (Exception e)
            {
                return e.ToString();
            }
            
            var flag = true;
            /*
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(mail.From.ToString());
            mailMessage.To.Add(new MailAddress(model.To));
            string emailBody = "<font face=arial size=2>Test Asp.net Send Mail</font>";
            mailMessage.IsBodyHtml = true;
            mailMessage.Subject = model.Subject;
            mailMessage.Body = model.Body;

            SmtpClient smtpClient = new SmtpClient();
            
            try 
            { 
                smtpClient.Send(mailMessage); 
            }
            catch (Exception e)
            {
                flag = false;
            }
            */

            return flag;
        }
    }
}
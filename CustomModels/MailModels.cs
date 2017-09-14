using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CustomModels
{
    public class SendEmailModel
    {
        public string To { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
    }
}

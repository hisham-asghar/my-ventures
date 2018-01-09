using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common
{
    public static class StringUtils
    {
        public static bool LinkComaprer(string service, string p)
        {
            p = LinkModifier(p);
            service = LinkModifier(service);
            return p == service;
        }

        public static string LinkModifier(string p)
        {
            if (p.Contains("%20"))
                p = p.Replace("%20", "-");
            if(p.Contains(' '))
                p = p.Replace(' ', '-');
            
            p = LinkTrimmer(p) ?? "";
            return p.ToLower();
        }

        public static string LinkTrimmer(string link)
        {
            if (null == link)
                return null;
            char[] charsToTrim = { '/' };
            return link.Trim(charsToTrim).ToLower();
        }

        public static double ParseDouble(string doublestringValue)
        {
            var amount = 0.0;

            if (null != doublestringValue && 0 < doublestringValue.Trim().Length)
            {
                double.TryParse(doublestringValue.Trim(), out amount);
            }

            return amount;
        }

        public static int ParseInt(string intstringValue)
        {
            var amount = 0;

            if (null != intstringValue && 0 < intstringValue.Trim().Length)
            {
                int.TryParse(intstringValue.Trim(), out amount);
            }

            return amount;
        }
        
        public static bool ParseBool(string boolstringValue)
        {
            var result = false;

            if (null != boolstringValue && 0 < boolstringValue.Trim().Length)
            {
                bool.TryParse(boolstringValue.Trim(), out result);
            }

            return result;
        }
    }
}

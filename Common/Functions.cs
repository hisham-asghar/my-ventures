using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public static class Functions
    {

        public static int ToInt(int? number)
        {
            try
            {
                return number ?? 0;
            }
            catch (Exception e)
            {
                return 0;
            }
        }
        public static int ToInt(this string number)
        {
            try
            {
                return int.Parse(number);
            }
            catch (Exception e)
            {
                return 0;
            }
        }
        public static decimal ToDecimal(this string number)
        {
            try
            {
                return decimal.Parse(number);
            }
            catch (Exception e)
            {
                return 0;
            }
        }
        public static List<List<T>> ListDividier<T>(List<T> list, int nsize = 3)
        {
            var listOfList = new List<List<T>>();
            while (list.Any())
            {
                listOfList.Add(list.Take(nsize).ToList());
                list = list.Skip(nsize).ToList();
            }
            return listOfList;
        }
        public static string ToDescription(this Enum value)
        {
            string description = value.ToString();

            var fi = value.GetType().GetField(value.ToString());

            var attributes = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);
            // ReSharper disable ConditionIsAlwaysTrueOrFalse
            if (null != attributes && attributes.Length > 0)
                // ReSharper restore ConditionIsAlwaysTrueOrFalse
            {
                description = attributes[0].Description;
            }

            return description;
        }
    }
}

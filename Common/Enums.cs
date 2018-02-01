using System.ComponentModel;

namespace Common
{
    public static class Enums
    {
        public static class Property
        {
            public enum Type
            {
                [Description("My Homes")]
                Homes,
                [Description("My Lands")]
                Lands,
                [Description("My Plots")]
                Plots
            }
        }

        public enum CacheObjects
        {
            LastDbUpdate,
            LastCacheUpdate,
            MyProperties
        }
        public enum FileType
        {
            None,
            Property,
            Map,
            Download
        }
    }
}
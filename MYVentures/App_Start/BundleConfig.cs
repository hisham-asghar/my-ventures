using System.Web;
using System.Web.Optimization;

namespace MYVentures
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Scripts/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.unobtrusive*",
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            AddCss(bundles);

            //bundles.Add(new StyleBundle("~/Content/css").Include("~/Content/site.css"));

            bundles.Add(new StyleBundle("~/Content/themes/base/css").Include(
                        "~/Content/themes/base/jquery.ui.core.css",
                        "~/Content/themes/base/jquery.ui.resizable.css",
                        "~/Content/themes/base/jquery.ui.selectable.css",
                        "~/Content/themes/base/jquery.ui.accordion.css",
                        "~/Content/themes/base/jquery.ui.autocomplete.css",
                        "~/Content/themes/base/jquery.ui.button.css",
                        "~/Content/themes/base/jquery.ui.dialog.css",
                        "~/Content/themes/base/jquery.ui.slider.css",
                        "~/Content/themes/base/jquery.ui.tabs.css",
                        "~/Content/themes/base/jquery.ui.datepicker.css",
                        "~/Content/themes/base/jquery.ui.progressbar.css",
                        "~/Content/themes/base/jquery.ui.theme.css"));

            AddJs(bundles);
        }

        private static void AddJs(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/Content/js").Include(
                "~/Content/assets/js/vendor/modernizr-2.8.3.min.js",
                "~/Content/assets/js/vendor/jquery-2.1.4.min.js",
                "~/Content/assets/js/vendor/font-awesome-all.js",
                "~/Content/assets/js/vendor/google-fonts.js",
                "~/Content/assets/js/vendor/jquery.easing.js",
                "~/Content/assets/js/vendor/jquery.waypoints.min.js",
                "~/Content/assets/js/vendor/bootstrap.min.js",
                "~/Content/assets/js/vendor/bootstrap-hover-dropdown.min.js",
                "~/Content/assets/js/vendor/smoothscroll.js",
                "~/Content/assets/js/vendor/jquery.localScroll.min.js",
                "~/Content/assets/js/vendor/jquery.scrollTo.min.js",
                "~/Content/assets/js/vendor/jquery.stellar.min.js",
                "~/Content/assets/js/vendor/jquery.parallax.js",
                "~/Content/assets/js/vendor/slick.min.js",
                "~/Content/assets/js/vendor/jquery.easypiechart.min.js",
                "~/Content/assets/js/vendor/countup.min.js",
                "~/Content/assets/js/vendor/isotope.min.js",
                "~/Content/assets/js/vendor/jquery.magnific-popup.min.js",
                "~/Content/assets/js/vendor/jquery-ui.min.js",
                "~/Content/assets/js/vendor/wow.js",
                "~/Content/assets/js/vendor/animated-heading.js",
                "~/Content/assets/js/vendor/kenburns.js",
                "~/Content/assets/js/vendor/jquery.mb.YTPlayer.min.js",
                "~/Content/assets/js/vendor/jquery.ajaxchimp.js",
                "~/Content/assets/js/main.js",
                "~/Content/assets/js/custom.js"
                ));
        }

        private static void AddCss(BundleCollection bundles)
        {
            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/assets/styles/vendor/bootstrap.min.css")
                .Include("~/Content/assets/fonts/et-lineicons/css/style.css",
                "~/Content/assets/fonts/linea-font/css/linea-font.css",
//                "~/Content/assets/fonts/fontawesome/css/font-awesome.min.css",
                "~/Content/assets/styles/vendor/slick.css",
                "~/Content/assets/styles/vendor/magnific-popup.css",
                "~/Content/assets/styles/vendor/animate.css",
                "~/Content/assets/styles/vendor/animated-heading.css",
                "~/Content/assets/styles/vendor/jquery-ui.min.css",
                "~/Content/assets/styles/vendor/jquery-ui.structure.min.css",
                "~/Content/assets/styles/main.css",
                    "~/Content/assets/styles/custom.css",
                "~/Content/assets/styles/responsive.css"));
        }
    }
}
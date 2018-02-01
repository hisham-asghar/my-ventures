using System.Web;
using System.Web.Optimization;

namespace Admin
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            AddJs(bundles);
            AddCss(bundles);

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

            bundles.Add(new StyleBundle("~/Content/css2").Include("~/Content/site.css"));

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
        }

        private static void AddCss(BundleCollection bundles)
        {
            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/assets/css/bootstrap.min.css",
                "~/Content/assets/css/material-dashboard.css",
                "~/Content/assets/css/demo.css"
            ));

            bundles.Add(new StyleBundle("~/Content/FileUpload").Include(
                "~/Content/jQuery.FileUpload/css/jquery.fileupload.css",
                "~/Content/jQuery.FileUpload/css/jquery.fileupload-ui.css",
                "~/Content/blueimp-gallery2/css/blueimp-gallery.css",
                "~/Content/blueimp-gallery2/css/blueimp-gallery-video.css",
                "~/Content/blueimp-gallery2/css/blueimp-gallery-indicator.css"
            ));
        }

        private static void AddJs(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/Content/jquery").Include(
                "~/Content/assets/js/jquery-3.1.1.min.js"));
            bundles.Add(new ScriptBundle("~/Content/js").Include(
                "~/Content/assets/js/jquery-3.1.1.min.js",
                "~/Content/assets/js/jquery-ui.min.js",
                "~/Content/assets/js/bootstrap.min.js",
                "~/Content/assets/js/material.min.js",
                "~/Content/assets/js/perfect-scrollbar.jquery.min.js",
                "~/Content/assets/js/jquery.validate.min.js",
                "~/Content/assets/js/moment.min.js",
                //"~/Content/assets/js/chartist.min.js",
                "~/Content/assets/js/jquery.bootstrap-wizard.js",
                "~/Content/assets/js/bootstrap-notify.js",
                "~/Content/assets/js/bootstrap-datetimepicker.js",
                "~/Content/assets/js/jquery-jvectormap.js",
                "~/Content/assets/js/nouislider.min.js",
                "~/Content/assets/js/jquery.select-bootstrap.js",
                "~/Content/assets/js/jquery.datatables.js",
                "~/Content/assets/js/jasny-bootstrap.min.js",
                "~/Content/assets/js/fullcalendar.min.js",
                "~/Content/assets/js/jquery.tagsinput.js",
                "~/Content/assets/js/material-dashboard.js",
                "~/Content/assets/js/sweetalert2.js",
                "~/Content/assets/js/font-awesome-all.js",
                "~/Content/assets/js/demo.js"));

            bundles.Add(new ScriptBundle("~/Content/jsFileUpload").Include(
                "~/Scripts/jQuery.FileUpload/vendor/jquery.ui.widget.js",
                "~/Scripts/jQuery.FileUpload/tmpl.min.js",
                "~/Scripts/jQuery.FileUpload/load-image.all.min.js",
                "~/Scripts/jQuery.FileUpload/canvas-to-blob.min.js",
                "~/Scripts/jQuery.FileUpload/jquery.iframe-transport.js",
                "~/Scripts/jQuery.FileUpload/jquery.fileupload.js",
                "~/Scripts/jQuery.FileUpload/jquery.fileupload-process.js",
                "~/Scripts/jQuery.FileUpload/jquery.fileupload-image.js",
                "~/Scripts/jQuery.FileUpload/jquery.fileupload-audio.js",
                "~/Scripts/jQuery.FileUpload/jquery.fileupload-video.js",
                "~/Scripts/jQuery.FileUpload/jquery.fileupload-validate.js",
                "~/Scripts/jQuery.FileUpload/jquery.fileupload-ui.js",
                "~/Scripts/blueimp-gallery2/js/blueimp-gallery.js",
                "~/Scripts/blueimp-gallery2/js/jquery.blueimp-gallery.min.js",
                "~/Scripts/blueimp-gallery2/js/blueimp-gallery-video.js",
                "~/Scripts/blueimp-gallery2/js/blueimp-gallery-indicator.js",
                "~/Scripts/blueimp-gallery2/js/jquery.blueimp-gallery.js"
                ));
        }


    }
}
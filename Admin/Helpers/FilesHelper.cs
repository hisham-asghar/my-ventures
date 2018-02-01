using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Helpers;
using System.Web.Hosting;

namespace Admin.Helpers
{
    public class FilesHelper
    {

        string DeleteURL = null;
        string DeleteType = null;
        string StorageRoot = null;
        string UrlBase = null;
        string tempPath = null;
        //ex:"~/Files/something/";
        string serverMapPath = null;
        public FilesHelper(string DeleteURL, string DeleteType, string StorageRoot, string UrlBase, string tempPath, string serverMapPath)
        {
            this.DeleteURL = DeleteURL;
            this.DeleteType = DeleteType;
            this.StorageRoot = StorageRoot;
            this.UrlBase = UrlBase;
            this.tempPath = tempPath;
            this.serverMapPath = serverMapPath;
        }

        public void DeleteFiles(string pathToDelete)
        {

            string path = HostingEnvironment.MapPath(pathToDelete);

            System.Diagnostics.Debug.WriteLine(path);
            if (Directory.Exists(path))
            {
                DirectoryInfo di = new DirectoryInfo(path);
                foreach (FileInfo fi in di.GetFiles())
                {
                    File.Delete(fi.FullName);
                    System.Diagnostics.Debug.WriteLine(fi.Name);
                }

                di.Delete(true);
            }
        }

        public string DeleteFile(string file)
        {
            System.Diagnostics.Debug.WriteLine("DeleteFile");
            //    var req = HttpContext.Current;
            System.Diagnostics.Debug.WriteLine(file);

            string fullPath = Path.Combine(StorageRoot, file);
            System.Diagnostics.Debug.WriteLine(fullPath);
            System.Diagnostics.Debug.WriteLine(File.Exists(fullPath));
            string thumbPath = "/" + file + "80x80.jpg";
            string partThumb1 = Path.Combine(StorageRoot, "thumbs");
            string partThumb2 = Path.Combine(partThumb1, file + "80x80.jpg");

            System.Diagnostics.Debug.WriteLine(partThumb2);
            System.Diagnostics.Debug.WriteLine(File.Exists(partThumb2));
            if (File.Exists(fullPath))
            {
                //delete thumb 
                if (File.Exists(partThumb2))
                {
                    File.Delete(partThumb2);
                }
                File.Delete(fullPath);
                string succesMessage = "Ok";
                return succesMessage;
            }
            string failMessage = "Error Delete";
            return failMessage;
        }

        public JsonFiles GetFileList()
        {

            var r = new List<ViewDataUploadFilesResult>();

            string fullPath = Path.Combine(StorageRoot);
            if (Directory.Exists(fullPath))
            {
                DirectoryInfo dir = new DirectoryInfo(fullPath);
                foreach (FileInfo file in dir.GetFiles())
                {
                    int SizeInt = unchecked((int)file.Length);
                    r.Add(UploadResult(file.Name, SizeInt, file.FullName, Guid.NewGuid().ToString()));
                }

            }
            JsonFiles files = new JsonFiles(r);

            return files;
        }

        public void UploadAndShowResults(HttpContextBase ContentBase, List<ViewDataUploadFilesResult> resultList)
        {
            var httpRequest = ContentBase.Request;
            System.Diagnostics.Debug.WriteLine(Directory.Exists(tempPath));

            var fullPath = Path.Combine(StorageRoot);
            Directory.CreateDirectory(fullPath);
            // Create new folder for thumbs
            Directory.CreateDirectory(fullPath + "/thumbs/");

            foreach (string inputTagName in httpRequest.Files)
            {

                var headers = httpRequest.Headers;

                var file = httpRequest.Files[inputTagName];
                if (file != null) System.Diagnostics.Debug.WriteLine(file.FileName);

                if (string.IsNullOrEmpty(headers["X-File-Name"]))
                {

                    UploadWholeFile(ContentBase, resultList);
                }
                else
                {

                    UploadPartialFile(headers["X-File-Name"], ContentBase, resultList);
                }
            }
        }


        private void UploadWholeFile(HttpContextBase requestContext, List<ViewDataUploadFilesResult> statuses)
        {
            var request = requestContext.Request;
            for (var i = 0; i < request.Files.Count; i++)
            {
                var file = request.Files[i];
                var fileGuid = Guid.NewGuid().ToString();
                var pathOnServer = Path.Combine(StorageRoot);
                var getType = "." + file.FileName.Substring(file.FileName.LastIndexOf(".", StringComparison.Ordinal) + 1);
                var fullPath = Path.Combine(pathOnServer, Path.GetFileName(fileGuid) + getType);
                file.SaveAs(fullPath);
                var handler = new ImageHandler();
                try
                {
                    // handler.Save(ImageHandler.LoadImage(fullPath), 800, 450, 100, fullPath);
                }
                catch (Exception)
                {
                    // ignored
                }
                //Create thumb
                var imageArray = file.FileName.Split('.');
                if (imageArray.Length != 0)
                {
                    var extansion = imageArray[imageArray.Length - 1].ToLower();
                    if (extansion == "jpg" || extansion == "png" || extansion == "jpeg")
                    {
                        var thumbfullPath = Path.Combine(pathOnServer, "thumbs");
                        //String fileThumb = file.FileName + ".80x80.jpg";
                        var fileThumb = Path.GetFileNameWithoutExtension(fileGuid) + "80x80.jpg";
                        var thumbfullPath2 = Path.Combine(thumbfullPath, fileThumb);
                        using (var stream = new MemoryStream(System.IO.File.ReadAllBytes(fullPath)))
                        {
                            var webImage = new WebImage(stream);
                            var thumbnail = webImage.Resize(80, 80);
                            thumbnail.Save(thumbfullPath2, "jpg");
                        }
                    }
                }
                statuses.Add(UploadResult(file.FileName, file.ContentLength, file.FileName, fileGuid));
            }
        }



        private void UploadPartialFile(string fileName, HttpContextBase requestContext, List<ViewDataUploadFilesResult> statuses)
        {
            var request = requestContext.Request;
            if (request.Files.Count != 1) throw new HttpRequestValidationException("Attempt to upload chunked file containing more than one fragment per request");
            var file = request.Files[0];
            var inputStream = file.InputStream;
            string patchOnServer = Path.Combine(StorageRoot);
            var fileGuid = Guid.NewGuid().ToString();
            var fullName = Path.Combine(patchOnServer, Path.GetFileName(fileGuid));
            var ThumbfullPath = Path.Combine(fullName, Path.GetFileName(fileGuid + "80x80.jpg"));
            ImageHandler handler = new ImageHandler();

            var ImageBit = ImageHandler.LoadImage(fullName);
            handler.Save(ImageBit, 80, 80, 10, ThumbfullPath);
            using (var fs = new FileStream(fullName, FileMode.Append, FileAccess.Write))
            {
                var buffer = new byte[1024];

                var l = inputStream.Read(buffer, 0, 1024);
                while (l > 0)
                {
                    fs.Write(buffer, 0, l);
                    l = inputStream.Read(buffer, 0, 1024);
                }
                fs.Flush();
                fs.Close();
            }
            statuses.Add(UploadResult(file.FileName, file.ContentLength, file.FileName, fileGuid));
        }

        public ViewDataUploadFilesResult UploadResult(string fileName, int fileSize, string fileFullPath, string shortPath)
        {
            var getType = fileFullPath.Substring(fileFullPath.LastIndexOf(".", StringComparison.Ordinal));
            var fileExtension = getType.Substring(getType.LastIndexOf("/", StringComparison.Ordinal) + 1);
            var result = new ViewDataUploadFilesResult
            {
                name = fileName,
                size = fileSize,
                type = getType,
                url = UrlBase + shortPath + fileExtension,
                deleteUrl = DeleteURL + shortPath + fileExtension,
                thumbnailUrl = CheckThumb(getType, shortPath + fileExtension),
                deleteType = DeleteType,
                guid = shortPath + fileExtension
            };
            return result;
        }

        public string CheckThumb(string type, string fileName)
        {
            var splited = type.Split('/');
            if (splited.Length == 2)
            {
                string extansion = splited[1].ToLower();
                if (extansion.Equals("jpeg") || extansion.Equals("jpg") || extansion.Equals("png") || extansion.Equals("gif"))
                {
                    string thumbnailUrl = UrlBase + "thumbs/" + Path.GetFileNameWithoutExtension(fileName) + "80x80.jpg";
                    return thumbnailUrl;
                }
                else
                {
                    if (extansion.Equals("octet-stream")) //Fix for exe files
                    {
                        return "/Content/Free-file-icons/48px/exe.png";

                    }
                    if (extansion.Contains("zip")) //Fix for exe files
                    {
                        return "/Content/Free-file-icons/48px/zip.png";
                    }
                    var thumbnailUrl = "/Content/Free-file-icons/48px/" + extansion + ".png";
                    return thumbnailUrl;
                }
            }
            return UrlBase + "/thumbs/" + Path.GetFileNameWithoutExtension(fileName) + "80x80.jpg";
        }

        public List<string> FilesList()
        {

            List<string> Filess = new List<string>();
            string path = HostingEnvironment.MapPath(serverMapPath);
            System.Diagnostics.Debug.WriteLine(path);
            if (Directory.Exists(path))
            {
                DirectoryInfo di = new DirectoryInfo(path);
                foreach (FileInfo fi in di.GetFiles())
                {
                    Filess.Add(fi.Name);
                    System.Diagnostics.Debug.WriteLine(fi.Name);
                }

            }
            return Filess;
        }
    }
    public class ViewDataUploadFilesResult
    {
        public string name { get; set; }
        public string guid { get; set; }
        public int size { get; set; }
        public string type { get; set; }
        public string url { get; set; }
        public string deleteUrl { get; set; }
        public string thumbnailUrl { get; set; }
        public string deleteType { get; set; }
    }
    public class JsonFiles
    {
        public ViewDataUploadFilesResult[] files;
        public string TempFolder { get; set; }
        public JsonFiles(List<ViewDataUploadFilesResult> filesList)
        {
            files = new ViewDataUploadFilesResult[filesList.Count];
            for (int i = 0; i < filesList.Count; i++)
            {
                files[i] = filesList.ElementAt(i);
            }

        }
    }
}


﻿using System;
using System.Collections.Generic;
using System.IO.Compression;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MYVentures.Attributes
{
    public class GZipOrDeflateAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting (ActionExecutingContext filterContext)
        {
            var acceptencoding = filterContext.HttpContext.Request.Headers["Accept-Encoding"];

            if (!string.IsNullOrEmpty(acceptencoding))
            {
                acceptencoding = acceptencoding.ToLower();
                var response = filterContext.HttpContext.Response;
                if (acceptencoding.Contains("gzip"))
                {
                    response.AppendHeader("Content-Encoding", "gzip");
                    response.Filter = new GZipStream(response.Filter,
                        CompressionMode.Compress);
                }
                else if (acceptencoding.Contains("deflate"))
                {
                    response.AppendHeader("Content-Encoding", "deflate");
                    response.Filter = new DeflateStream(response.Filter,
                        CompressionMode.Compress);
                }
            }
        }
    }
    
}
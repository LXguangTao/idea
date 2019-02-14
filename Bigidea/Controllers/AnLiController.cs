using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bigidea.Controllers
{
    public class AnLiController : Controller
    {
        // GET: AnLi
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AnLi()
        {
            try
            {
                string title = Request.Params["title"];
                bigideaEntities U = new bigideaEntities();

                //var AnLi = U.Article.Where(x =>x.Research.Contains(title)).ToList();
                var AnLi = from x in U.Article
                           where x.Research.Contains(title)
                           select new
                           {
                               Id=x.Id,
                               Title = x.Title,
                               Author = x.Author,
                               ReadTimes = x.ReadTimes,
                               MainPicUrl = x.MainPicUrl,
                               Research = x.Research
                           };
                var h1 = AnLi.FirstOrDefault().Research;
                    return Json(new { success = true, data = AnLi,h1=h1 });
                
            }
            catch (Exception ex)
            {
                return Redirect("~/htmls/404.html");
                return Json(new { success = false, message = ex.Message });
            }
        }
    }
}